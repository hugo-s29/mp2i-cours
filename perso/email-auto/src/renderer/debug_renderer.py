from .renderer import Renderer


class DebugRenderer(Renderer):
  def render(self):
    print(f"Généré pour {self.student.name} (semaine {self.week_num})")

    lines = [
      [],
      [],
      [],
      [],
      *([] for i in range(8, 21)),
      *([] for i in range(8, 21)),
    ]

    for name, day in self.get_week().items():
      lines[0].append(name)

      def _filter(meal):
        if meal is None:
          return None

        if meal.has(day.student):
          return meal

        return None

      meals = list(map(_filter, day.meals))

      for i, meal in enumerate(meals):
        if meal is None:
          lines[i + 1].append("")
          continue

        text = f"{meal.time}: {meal.get_type()}"
        lines[i + 1].append(text)

      for hour, subject in day.spots.items():
        if subject is None:
          lines[(hour - 8) * 2 + 4].append("")
          lines[(hour - 8) * 2 + 5].append("")
          continue

        lines[(hour - 8) * 2 + 4].append(subject.name)
        lines[(hour - 8) * 2 + 5].append(subject.room)

    max_w = max([max([len(cell) for cell in line] + [0]) for line in lines])

    for i, line in enumerate(lines):
      out = ""

      if i == 3:
        for i in range(6):
          out += "-" * max_w + "-|"

          if i != 5:
            out += "-"

        print(out)
        continue

      for cell in line:
        spaces = " " * (max_w - len(cell))
        out += cell + spaces + " | "

      print(out)
