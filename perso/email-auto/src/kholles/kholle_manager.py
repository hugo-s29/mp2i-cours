import kholles


class KholleManager:
  def __init__(self, student, week_num):
    self.student = student
    self.week_num = week_num

  def load(self, day):
    all_kholles = [
      *kholles.maths,
      *kholles.physique,
      *kholles.anglais,
      *kholles.informatique,
    ]
    group = self.student.kholle_group

    return [
      kholle
      for kholle in all_kholles
      if kholle.day == day and kholle.has(group=group, week_num=self.week_num)
    ]
