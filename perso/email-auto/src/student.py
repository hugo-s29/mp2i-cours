import json, hashlib
from unidecode import unidecode


class Student:
  def __init__(
    self,
    name,
    mail=None,
    kholle_group=-1,
    ap_physique=False,
    lv2=None,
    meals="ie",
    option="info",
  ):
    self.kholle_group = kholle_group
    self.name = name
    self.mail = mail
    self.ap_physique = ap_physique
    self.meals = meals
    self.lv2 = lv2
    self.option = option

    self.short_name = name.split(" ")[0]

    self.kholle_count = 0  # added in Day.__init__
    self.kholles = []

    half_group, third_group, sixth_group = self.get_groups()

    self.half_group = half_group
    self.third_group = third_group
    self.sixth_group = sixth_group

  def get_groups(self):
    return [
      group
      for group, kholle_groups in groups_data.items()
      if self.kholle_group in kholle_groups
    ]

  def get_id(self):
    name = unidecode(self.name).encode("ascii", "ignore")
    return hashlib.sha256(name).hexdigest()[:16]

  def get_name_id(self):
    return unidecode(self.name)


groups_data = {}
with open("src/groups.json", "r") as json_file:
  json_data = json.load(json_file)

  groups_data["I"] = json_data["I"]
  groups_data["II"] = json_data["II"]

  groups_data["A"] = json_data["A"]["A1"] + json_data["A"]["A2"]
  groups_data["B"] = json_data["B"]["B1"] + json_data["B"]["B2"]
  groups_data["C"] = json_data["C"]["C1"] + json_data["C"]["C2"]

  groups_data["A1"] = json_data["A"]["A1"]
  groups_data["B1"] = json_data["B"]["B1"]
  groups_data["C1"] = json_data["C"]["C1"]

  groups_data["A2"] = json_data["A"]["A2"]
  groups_data["B2"] = json_data["B"]["B2"]
  groups_data["C2"] = json_data["C"]["C2"]
