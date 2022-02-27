import csv, re
from .kholle import Kholle


def load_kholles(name, file, abbr=None):
  if abbr is None:
    abbr = name

  with open(f"src/kholles/{file}", "r") as f:
    reader = csv.DictReader(f)

    return [create_kholle(name, abbr, row) for row in reader]


def parse_group(group):
  try:
    return int(group)
  except:
    if '+' in group:
      group, _ = group.split('+')
      return int(group)
    else:
      _, group, _ = re.split(r'(\d+)', group)
      return int(group)

def create_kholle(name, abbr, data):
  groups = [parse_group(data[f"w{i}"]) for i in range(30)]

  time = int(data["time"])

  return Kholle(
    time=(time, time + 1),
    day=int(data["day"]),
    subject_name=name,
    abbr=abbr,
    teacher=data["name"],
    room=data["room"],
    groups=groups,
  )
