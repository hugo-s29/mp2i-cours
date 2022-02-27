import csv, re

with open("src/kholles/maths.csv", "r") as csv_file:
  reader = csv.DictReader(csv_file)
  data = [dict(row) for row in reader]

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


def get_kholle_count(group, kholle):
  weeks = [kholle[f"w{i}"] for i in range(30)]

  groups = [parse_group(group) for group in weeks]

  return groups.count(group)

a, b = 0, 0

for group in range(1, 17):
  weeks = [kholle for kholle in data for k in range(get_kholle_count(group, kholle))]
  print(group, len(weeks))
  a += len(weeks)
  b += 1

print(a / b)
