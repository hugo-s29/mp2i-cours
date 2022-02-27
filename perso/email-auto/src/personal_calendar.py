import json
from unidecode import unidecode

remove_accents = lambda s: unidecode(s)

def export_calendar(student, week, week_num, year):
  days = [export_day(day) for day in week]
  data = {"date": f"{week_num}/{year}", "days": days}

  with open("/Users/hugo/vim/calendar.json", "w", encoding="utf8") as file:
    json.dump(data, file)


def export_day(day):
  return [
    {
      "time": list(subject.time),
      "room": subject.room,
      "name": remove_accents(subject.name),
    }
    for subject in day.subjects
  ]
