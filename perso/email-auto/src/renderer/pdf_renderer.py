from fpdf import FPDF
from .renderer import Renderer
from kholles import Kholle
import colors

pt_to_mm = 0.3527777778


class PDFRenderer(Renderer):
  def __init__(self, week, file_name="test.pdf"):
    super().__init__(week)
    self.file_name = file_name
    self.pdf = None

  def render(self):
    if self.pdf is None:
      self.pdf = FPDF(orientation="L", format="A4")

    pdf = self.pdf
    width, height = 297, 210

    pdf.add_page()

    a = 3
    b = 6
    name_height = 10

    col = float(width - 2 * a) / len(self.week)
    pdf.set_font("Arial", "B", 16)

    week_dict = self.get_week()
    week_days = list(week_dict.keys())
    for i, day_name in enumerate(week_days):
      day = week_dict[day_name]

      x = i * col + a

      pdf.rect(
        x + a,
        b,
        col - a * 2,
        height - b * 4,
      )

      pdf.set_xy(x + a, b)
      pdf.cell(col - 2 * a, name_height, day_name, 1, 0, "C")

    # Affichage des cours
    week_dict = self.get_week()
    week = list(week_dict.values())
    base_subject_height = (1 / 12.5) * (height - 2 * b - name_height)

    for i, day in enumerate(week):
      x = i * col + a

      for subject in day.subjects:
        pdf.set_fill_color(*subject.get_color())

        offsetY = (subject.time[0] - 8) * base_subject_height
        subject_height = (
          subject.time[1] - subject.time[0]
        ) * base_subject_height
        pdf.set_xy(x + a, b + offsetY + name_height * 1.5)

        pdf.cell(col - 2 * a, subject_height, "", 1, 0, "C", True)

        k = 3.0 if (subject.time[1] - subject.time[0]) > 1 else 1.4

        mx, my = (
          x + col / 2,
          b + offsetY + name_height * 1.5 + subject_height / 2.0,
        )

        # Pour les Khôlles
        if type(subject) == Kholle:
          pdf.set_font("Arial", "U", 14)
          h = 14 * pt_to_mm * k

          w1 = pdf.get_string_width(subject.name)

          pdf.text(mx - w1 / 2, my - h / 2, subject.name)

          pdf.set_font("Arial", "I", 10)
          h = 10 * pt_to_mm * k

          w2 = pdf.get_string_width(subject.room)
          w3 = pdf.get_string_width(subject.teacher)

          pdf.text(mx - w2 / 2, my + h / 3, subject.room)
          pdf.text(mx - w3 / 2, my + h * 4 / 3, subject.teacher)

          continue

        # Cours normaux

        if subject.room == "":
          pdf.set_font("Arial", "", 14)
          h = 14 * pt_to_mm * 1.5
          w = pdf.get_string_width(subject.name)

          pdf.text(mx - w / 2, my + h / 4, subject.name)
        else:
          pdf.set_font("Arial", "", 14)
          h = 14 * pt_to_mm * k

          w1 = pdf.get_string_width(subject.name)
          pdf.text(mx - w1 / 2, my - h / 3, subject.name)

          pdf.set_font("Arial", "I", 12)
          h = 12 * pt_to_mm * k

          w2 = pdf.get_string_width(subject.room)
          pdf.text(mx - w2 / 2, my + h / 2, subject.room)

    colors.save_cache()

    k = 1.5
    # Repas
    for i, day in enumerate(week):

      def _filter(meal):
        if meal is None:
          return None

        if meal.has(day.student):
          return meal

        return None

      meals = list(map(_filter, day.meals))

      for meal in meals:
        if meal is None:
          continue

        hh, mm = meal.time.split("h")
        time = int(hh) + int(mm) / 60
        pdf.set_font("Arial", "", 10)
        h = 10 * pt_to_mm * k
        pdf.set_xy(0, 0)
        x1 = i * col + a * 2
        x2 = x1 + col - a * 2

        if meal.meal_type == "lunch":
          y = map_range(
            time, 8, 8 + 11, b + name_height * 1.5, height - 4 * b
          )
        else:
          y = map_range(time, 6, 18.95, b + name_height * 1.5, height - 4 * b)
        pdf.line(x1, y, x2, y)

        if meal.cold:
          ox = 1.5
          pdf.text(x1 + ox, y + h / 1.85, meal.time)
          pdf.set_font("Arial", "I", 10)
          w = pdf.get_string_width("La Chappelle")
          pdf.text(x2 - w - ox, y + h / 1.85, "La Chappelle")
        else:
          w = pdf.get_string_width(meal.time)
          pdf.text((x1 + x2) / 2 - w / 2, y + h / 1.85, meal.time)

    # Ajoute les heures
    pdf.set_font("Arial", "I", 9)
    footer = f"Généré pour {self.student.name} (semaine {self.week_num})"
    footer_width = pdf.get_string_width(footer)
    footer_height = 9 * pt_to_mm * k
    pdf.text(width - footer_width - 5, height - footer_height - 5, footer)

    if self.file_name is not None:
      pdf.output(self.file_name, "F")


map_range = (
  lambda value, start1, stop1, start2, stop2: ((value - start1) / (stop1 - start1))
  * (stop2 - start2)
  + start2
)
