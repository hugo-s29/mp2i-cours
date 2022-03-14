from classroom import classroom
from days.friday import Friday
import random

def get_groups(week_num):
  groups = [[], [], []]
  random.seed(week_num % 17)

  for student in classroom:
    day = Friday(student, week_num)

    # pas de colles en après-midi, le plus tôt possible mais priorité 1
    # une colle à midi, dans les 2 dernières heures, priorité 10
    # une colle pendant l'après midi,
    #     avant : priorité 2
    #     après : priorité 4

    kholles = day.kholles

    if len(kholles) == 0:
      groups[0].append((student, 2))
      groups[1].append((student, 1))
      groups[2].append((student, 0.5))
    
    for k in kholles:
      if k.time[0] == 12:
        groups[1].append((student, 4))
        groups[2].append((student, 0.2))
      elif k.time[0] == 13:
        groups[1].append((student, 4))
        groups[2].append((student, 0.5))
      elif k.time[0] == 14:
        groups[0].append((student, 0.5))
        groups[2].append((student, 4))
      elif k.time[0] == 15:
        groups[0].append((student, 2))
        groups[1].append((student, 4))
      elif k.time[0] == 16:
        groups[0].append((student, 0.5))
        groups[1].append((student, 0.5))
        groups[2].append((student, 4))
      elif k.time[0] == 17:
        groups[0].append((student, 4))
        groups[1].append((student, 1))
        groups[2].append((student, 1))
      elif k.time[0] == 18:
        groups[0].append((student, 4))
        groups[1].append((student, 1))
        groups[2].append((student, 0.1))
      else:
        print('problem here')
        print(k.time, k.name)
  
  total_total = sum([w for g in groups for s, w in g])
  final_groups = [[], [], []]

  flat = [
    (s, w, i)
    for i, group in enumerate(groups)
    for s, w in group
  ]

  random.shuffle(flat)
  weights = list(map(lambda o: o[1] / total_total, flat))

  while len(flat) != 0:
    k = random.choices(list(range(len(flat))), weights)[0]
    s, w, i = flat[k]

    student_group = list(filter(lambda x: x.kholle_group == s.kholle_group,classroom))
    final_groups[i] += student_group

    flat = [
      (student, w, i)
      for student, w, i in flat
      if student not in student_group
    ]

    for i in range(3):
      if len(final_groups[i]) >= 14:
        flat = list(filter(lambda x: x[2] != i, flat))

    random.shuffle(flat)
    weights = list(map(lambda o: o[1] / total_total, flat))

  flattned = [ s for group in final_groups for s in group ]
  students_not_added = list(filter(lambda s: s not in flattned,classroom))

  print(students_not_added)

  for student in students_not_added:
    i = max([0,1,2], key=lambda x: len(final_groups[x]))
    final_groups[i].append(student)
    print(student.name)

  for i, group in enumerate(final_groups):
    for student in group:
      student.tp_info_group = i

  print(list(map(len, final_groups)))

  return classroom
