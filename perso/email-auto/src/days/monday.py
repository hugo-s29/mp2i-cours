from day import Day
from subject import Subject
from meal import Meal


class Monday(Day):
  def generate_subjects(self):
    return [
      # Subject(name="Physique", time=(8, 10), room="D207"),
      Subject(name="Anglais", time=(10, 12), room="K201"),
      Subject(name="Intervention", time=(13, 14), room="La chappelle"),
      Subject(name="Conseil", time=(16, 18), room="La chappelle"),
    ]

  def get_id(self):
    return 1

  def generate_meals(self):
    return [
      Meal(time="12h39"),
      Meal(time="18h36", meal_type="dinner"),
    ]
