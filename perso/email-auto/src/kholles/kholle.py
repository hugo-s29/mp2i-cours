from subject import Subject
import colors


class Kholle(Subject):
  def __init__(self, day, time, subject_name, abbr, teacher, room="?", groups=[]):
    self.subject_name = subject_name
    self.teacher = teacher
    self.abbr = abbr
    self.groups = groups
    self.time = time
    self.day = day

    name = "Khôlle " + abbr
    super().__init__(time, name, room)

  def get_color(self):
    seed = sum(ord(c) - i for i, c in enumerate(self.subject_name))
    return colors.hex_to_rgb(colors.get_color(seed))

  def has(self, group, week_num):
    return self.groups[week_num] == group
