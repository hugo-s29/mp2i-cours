from day import Day
from subject import Subject
from meal import Meal
from tps_info_loader import TPInfoLoader


class Friday(Day):
  def get_tp_info_time(self):
    group = self.student.kholle_group
    week = self.week_num
    return TPInfoLoader().get_time(group, week)


  def generate_subjects(self):
    subjects = [
      Subject(name="EPS", time=(8, 10), room=""),
      Subject(name="Mathématiques", time=(10, 12), room="K201"),
      Subject(name="Informatique", time=self.get_tp_info_time(), room="I204"),
      Subject(name="Mathématiques", time=(13,14), optional=True, room="K201"),
      Subject(name="Mathématiques", time=(14,15), optional=True, room="K201"),
      Subject(name="Mathématiques", time=(15,16), optional=True, room="K201"),
    ]

    return subjects

  def get_id(self):
    return 5
