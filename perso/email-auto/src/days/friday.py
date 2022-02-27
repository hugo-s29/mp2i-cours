from day import Day
from subject import Subject
from meal import Meal


class Friday(Day):
  def add_tp_info(self, start, end):
    tp = Subject(name="Informatique", room="I204", time=(start, end), optional=True)

    if self.spots[start] is None:
      return tp
    else:
      return None
  
  def generate_subjects(self):
    subjects = [
      Subject(name="EPS", time=(8, 10), room=""),
      Subject(name="Mathématiques", time=(10, 12), room="K201"),
      self.add_tp_info(13,14),
      self.add_tp_info(14,15),
      self.add_tp_info(15,16),
    ]

    return subjects

  def get_id(self):
    return 5

  def generate_meals(self):
    return [
      Meal(time="12h15"),
      Meal(time="18h25", meal_type="dinner"),
    ]
