from .renderer import Renderer
from icalendar import Calendar, Event
from datetime import datetime, timedelta

class IcalRenderer(Renderer):
  def __init__(self, week, file_name, real_week_num, year):
    super().__init__(week)
    self.file_name = file_name
    self.real_week_num = real_week_num
    self.year = year

  def render(self):
    cal = Calendar()
    cal['summary'] = f'Emploi du temps de la semaine {self.week_num} pour {self.student.name}'

    start, end = get_week_start_end(self.year, self.real_week_num)

    for i, day in enumerate(self.week):
      for subject in day.subjects:
        event = Event()
        event.add('dtstart', start + timedelta(days = i, hours = subject.time[0]))
        event.add('dtend', start + timedelta(days = i, hours = subject.time[1]))
        event['summary'] = f'{subject.name} en {subject.room}'
        event['color'] = subject.get_hex_color()
        cal.add_component(event)

    with open(self.file_name, 'wb') as f:
      f.write(cal.to_ical())

def get_week_start_end(year, real_week_num):
  date = f"{year}-{real_week_num}-1"
  dt = datetime.strptime(date, "%Y-%W-%w")
  start = dt - timedelta(days=dt.weekday())
  end = start + timedelta(days=6)

  return start, end
