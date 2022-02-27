from day import Day
from subject import Subject
from meal import Meal


class Thursday(Day):
  def get_td_times(self):
    patterns = ['II', 'I']
    pattern = patterns[self.week_num % 2]

    if self.student.half_group == pattern:
      return (13, 14), (14, 15)
    else:
      return (14, 15), (13, 14)

  def generate_subjects(self):
    td_phys_time, td_info_time = self.get_td_times()

    td_phys = Subject(name="Physique", room="D206", time=td_phys_time)
    td_info = Subject(name="Informatique", room="K201", time=td_info_time)

    subjects = [
      Subject(name="Mathématiques", time=(8, 10), room="K201"),
      Subject(name="Informatique", time=(10, 11), room="K201"),
      Subject(name="Informatique", time=(12, 13), room="K201"),
      td_phys,
      td_info,
      Subject(name="Français", time=(15, 17), room="K201"),
    ]


    if self.student.lv2 is not None:
      lv2 = self.student.lv2.lower()
      if lv2 == "italien":
        subjects.append(
          Subject(
            name="Italien",
            time=(17, 19),
            room="I003",
          )
        )
      elif lv2 == "russe":
        subjects.append(
          Subject(
            name="Russe",
            time=(17, 19),
            room="N301",
          )
        )

    return subjects

  def get_id(self):
    return 4

  def generate_meals(self):
    return [
      # Meal(time="11h15"), FIXME
      Meal(time="19h06", meal_type="dinner"),
    ]
