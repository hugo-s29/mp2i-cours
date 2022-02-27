from kholles import KholleManager
from subject import Subject

class Day:
  def __init__(self, student, week_num):
    self.student = student
    self.week_num = week_num
    self.kholle_manager = KholleManager(
      student=student,
      week_num=week_num,
    )

    self.spots = {hour: None for hour in self.generate_hours()}

    kholles = self.kholle_manager.load(self.get_id())
    student.kholle_count += len(kholles)
    student.kholles += kholles

    self.kholles = kholles

    self.subjects = [
      *kholles,
      *self.generate_subjects(),
    ]

    self.meals = self.generate_meals()

    for subject in self.subjects:
      for hour in range(*subject.time):
        if self.spots[hour] is not None:
          if self.spots[hour].optional:
            self.subjects.remove(self.spots[hour])
            self.spots[hour] = subject
            continue
          if subject.optional:
            self.subjects.remove(subject)
            continue

          print("Exception Data:")
          print("Already have ", self.spots[hour])
          print("Trying to add", subject)

          raise Exception("Two classes at the same time")

        self.spots[hour] = subject
    
    for hour in sorted(self.spots.keys()):
      if hour + 1 not in self.spots.keys():
        continue
      
      current_spot = self.spots.get(hour)
      next_spot = self.spots.get(hour+1)

      if current_spot is None or next_spot is None:
        continue

      if (
        type(current_spot) == type(next_spot)
        and current_spot.name == next_spot.name
        and current_spot.room == next_spot.room
        and current_spot is not next_spot
      ):

        full = Subject(
          name=current_spot.name,
          room=current_spot.room,
          time=(current_spot.time[0], next_spot.time[1])
        )

        self.spots[hour] = full
        self.spots[hour + 1] = full
        self.subjects.remove(current_spot)
        self.subjects.remove(next_spot)
        self.subjects.append(full)

  def generate_subjects(self):
    raise Exception("Not implemented")

  def generate_meals(self):
    raise Exception("Not implemented")

  def generate_hours(self):
    return range(8, 21)

  def get_id():
    raise Exception("Not implemented")
