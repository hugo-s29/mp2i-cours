from day import Day
from subject import Subject
from meal import Meal


class Wednesday(Day):
  def generate_subjects(self):
    td_math_time = (13, 15) if self.student.half_group == "I" else (15, 17)
    tp_phys_time = (13, 15) if self.student.half_group == "II" else (15, 17)

    td_math = Subject(name="Mathématiques", room="K201", time=td_math_time)
    tp_phys = Subject(name="Physique", room="Salles TP", time=tp_phys_time)

    subjects = [
      Subject(name="Mathématiques", time=(10, 12), room="K201"),
      td_math,
      tp_phys,
    ]

    if self.student.lv2 is not None:
      lv2 = self.student.lv2.lower()
      if lv2 == "espagnol":
        subjects.append(
          Subject(
            name="Espagnol",
            time=(8, 10),
            room="I211",
          )
        )
      elif lv2 == "allemand":
        subjects.append(
          Subject(
            name="Allemand",
            time=(8, 10),
            room="N301",
          )
        )
      elif lv2 == "chinois":
        subjects.append(
          Subject(
            name="Chinois",
            time=(17, 19),
            room="I108",
          )
        )

    return subjects

  def get_id(self):
    return 3

  def generate_meals(self):
    return [
      Meal(time="12h03"),
      Meal(time="19h06", meal_type="dinner"),
    ]
