from .renderer import Renderer


class HTMLRenderer(Renderer):
  def render(self):
    output = "<table><thead><tr>"

    for day_name, day in self.get_week().items():
      output += f"<td>{day_name}</td>"

    output += "</tr></thead><tbody>"

    for time in range(8, 19):
      output += "<tr>"

      for day in self.week:
        subject = day.spots[time]

        if subject is None:
          output += "<td></td>"
          continue

        output += f"<td>{subject.name}<br/>"
        output += f"<i>{subject.room}</i></td>"

      output += "</tr>"

    output += "</tbody></table>"

    return output
