class Meal:
  def __init__(self, time, meal_type="lunch", cold=False):
    self.time = time
    self.meal_type = meal_type
    self.cold = cold

  def has(self, student):
    if student.meals == "e":
      return False

    if student.meals == "dp":
      return self.meal_type == "lunch"

    if student.meals == "ie" or student.meals == "i":
      return True

  def get_type(self):
    if self.meal_type == "lunch":
      return "Déjeuner"
    elif self.meal_type == "dinner":
      return "Dinner"

    raise Exception(f"Unknown meal type {self.meal_type}")
