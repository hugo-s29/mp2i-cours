from day import Day
from subject import Subject
from meal import Meal


class Wednesday(Day):
  def generate_subjects(self):
    subjects = [
      Subject(name="Mathématiques", time=(10, 12), room="K201"),
      Subject(name="Mathématiques", time=(13, 15), room="K201"),
      Subject(name="Physique", time=(15, 17), room="??")
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
