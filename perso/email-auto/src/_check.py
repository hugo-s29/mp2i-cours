import csv

with open("src/tps_info.csv", "r") as csv_file:
  reader = csv.DictReader(csv_file)
  data = [dict(row) for row in reader]

groups = list(range(1, 17))
del groups[2]

def get_groups(line):
    keys = [ 'g' + str(i) for i in range(1, 6) ]
    return [ int(line[key]) for key in keys ]

weeks = set()
for row in data:
    weeks.add(row['week'])

for k, week in enumerate(weeks):
    groups_13 = get_groups(data[3 * k + 0])
    groups_14 = get_groups(data[3 * k + 1])
    groups_15 = get_groups(data[3 * k + 2])

    for g in groups:
        if g not in groups_13 and g not in groups_14 and g not in groups_15:
            print(f'Problem w/ group {g} for week {week}')
            print(groups_13)
            print(groups_14)
            print(groups_15)
