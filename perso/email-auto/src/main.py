from days import Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
from email_sender import send_email
from personal_calendar import export_calendar
from renderer.pdf_renderer import PDFRenderer
from renderer.html_renderer import HTMLRenderer
from renderer.ical_renderer import IcalRenderer
from student import Student
from classroom import classroom
import datetime, os, sys
from custom.tp_info import get_groups as add_tp_info_groups
from colors import reset_random_seed
from tps_info_loader import TPInfoLoader

with open('src/counter.txt') as f:
    week_num, real_week_num = list(map(int, f.read().split(';')))

year = 2022

date = datetime.date.today().strftime("%Y-%m-%d-%a")

directory = f"archive/{date}"

# classroom = add_tp_info_groups(week_num)
reset_random_seed()
TPInfoLoader().load_data()

if not os.path.exists(directory):
  os.makedirs(directory)

for student in classroom:
 week = [
   Monday(student, week_num),
   Tuesday(student, week_num),
   Wednesday(student, week_num),
   Thursday(student, week_num),
   Friday(student, week_num),
   Saturday(student, week_num),
 ]

 file_name = f"archive/{date}/{student.get_id()}_{student.get_name_id()}_{date}"

 pdf_renderer = PDFRenderer(week, file_name + '.pdf')
 pdf_renderer.render()

 os.system(f'pdftoppm "{file_name}.pdf" "{file_name}.png" -png -r 300 2> /dev/null')

 # html_renderer = HTMLRenderer(week)
 # planning_table = html_renderer.render()

 ical_renderer = IcalRenderer(week, file_name + '.ics', real_week_num, year)
 ical_renderer.render()

 if student.mail is not None:
   pass #send_email(student, file_name, week_num, real_week_num, year, planning_table)

 if student.name == "Hugo SALOU":
   export_calendar(student, week, real_week_num, year)
