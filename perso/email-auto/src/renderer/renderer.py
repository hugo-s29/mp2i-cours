class Renderer:
  def __init__(self, week):
    self.week = week
    self.monday = week[0]
    self.tuesday = week[1]
    self.wednesday = week[2]
    self.thursday = week[3]
    self.friday = week[4]
    self.saturday = week[5]

    self.student = self.monday.student
    self.week_num = self.monday.week_num

  def render(self):
    raise Exception("Not implemented")

  def get_week(self):
    days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
    return {key: day for key, day in zip(days, self.week)}
