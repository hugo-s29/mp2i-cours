import yagmail, os, re
from dotenv import dotenv_values
from datetime import datetime, timedelta

env = {**dotenv_values(".env"), **os.environ}

gmail_user = env["GMAIL_USER"]
gmail_password = env["GMAIL_PASSWORD"]

yag = yagmail.SMTP(gmail_user, gmail_password)

with open("src/email_template.txt") as f:
  template = f.read()


def generate_template(data):
  parts = re.split("{{|}}", template)

  return "".join(
    [str(data[part[1:]]) if part.startswith("&") else part for part in parts]
  )


format_date = lambda date: date.strftime("%d/%m")
days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]


def get_week_start_end(year, real_week_num):
  date = f"{year}-{real_week_num}-1"
  dt = datetime.strptime(date, "%Y-%W-%w")
  start = dt - timedelta(days=dt.weekday())
  end = start + timedelta(days=6)

  return start, end


def send_email(student, file_name, week_num, real_week_num, year, planning_table):
  start, end = get_week_start_end(year, real_week_num)

  kholle_list = "\n".join(
    [
      f"- {kholle.subject_name} le {days[kholle.day]} de {kholle.time[0]}h à "
      + f"{kholle.time[1]}h en {kholle.room} avec {kholle.teacher}"
      for kholle in student.kholles
    ]
  )

  data = {
    "student_name_short": student.short_name,
    "real_week_num": real_week_num,
    "week_start_day": format_date(start),
    "week_end_day": format_date(end),
    "kholle_count": student.kholle_count,
    "kholle_plural_s": "" if student.kholle_count == 1 else "s",
    "kholle_list_text": kholle_list,
    "planning_table": planning_table,
  }

  content = generate_template(data)

  yag.send(
    to=student.mail,
    subject=f"Emploi du temps semaine #{week_num + 1}",
    contents=content,
    attachments=file_name,
  )
