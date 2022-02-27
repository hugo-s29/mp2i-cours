from day import Day
from subject import Subject


class Saturday(Day):
  def generate_subjects(self):
    return [
      Subject(name="Mathématiques", time=(8, 10), room="K201"),
    ]

  def get_id(self):
    return 6

  def generate_meals(self):
    return [None, None]
