from day import Day
from subject import Subject
from meal import Meal


class Tuesday(Day):
  def generate_subjects(self):

    subjects = [
      Subject(name="Mathématiques", time=(8, 10), room="K201"),
      Subject(name="Informatique", time=(10, 12), room="K201"),
      Subject(name="Physique", time=(13, 15), room="K201"),
      Subject(name="TIPE", time=(15,17), room="K201")
    ]
    
    return subjects

  def get_id(self):
    return 2

  def generate_meals(self):
    return [
      Meal(time="12h06"),
      Meal(time="19h12", meal_type="dinner"),
    ]
