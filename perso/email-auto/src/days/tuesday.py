from day import Day
from subject import Subject
from meal import Meal


class Tuesday(Day):
  def generate_subjects(self):
    tipe_first_group = ['I', 'II'][self.week_num % 2]
    tipe_time = (15,16) if self.student.half_group == tipe_first_group else (16,17)

    subjects = [
      Subject(name="Mathématiques", time=(8, 10), room="K201"),
      Subject(name="Informatique", time=(10, 12), room="K201"),
      Subject(name="Physique", time=(13, 15), room="K201"),
      Subject(name="TIPE", time=tipe_time, room="K201")
    ]
    
    return subjects

  def get_id(self):
    return 2

  def generate_meals(self):
    return [
      Meal(time="12h06"),
      Meal(time="19h12", meal_type="dinner"),
    ]
