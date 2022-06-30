from helpers.singleton import Singleton
import csv, json

def _get_groups(line):
  keys = [ 'g' + str(i) for i in range(1, 6) ]
  return [ int(line[key]) for key in keys ]

class TPInfoLoader(metaclass=Singleton):
  def __init__(self):
      pass

  def load_data(self):
    with open("src/tps_info.csv", "r") as csv_file:
      reader = csv.DictReader(csv_file)
      data = [dict(row) for row in reader]

    self.data = dict()
    weeks = sorted(list(set([ row['week'] for row in data ])))

    for index, week in enumerate(weeks):
      print(index, week)
      week = int(week)
      self.data[week] = dict()

      groups_13 = _get_groups(data[3 * index + 0])
      groups_14 = _get_groups(data[3 * index + 1])
      groups_15 = _get_groups(data[3 * index + 2])

      for group in groups_13: self.data[week][group] = 13
      for group in groups_14: self.data[week][group] = 14
      for group in groups_15: self.data[week][group] = 15

  def get_time(self, student_group, week):
    time = self.data[week][student_group]
    return (time, time+1)

