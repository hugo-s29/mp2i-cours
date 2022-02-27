import colors


class Subject:
  def __init__(self, time, name, room="K201", optional=False):
    self.time = time
    self.room = room
    self.name = name
    self.optional = optional

  def get_color(self):
    seed = sum(ord(c) - i for i, c in enumerate(self.name))
    return colors.hex_to_rgb(colors.get_color(seed))

  def __repr__(self):
    return f"{self.name} (hours: {self.time}) in {self.room}"
