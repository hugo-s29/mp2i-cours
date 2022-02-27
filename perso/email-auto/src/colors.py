import json
import random

random.seed(8084)

with open("src/colors.json", "r") as file:
  colors = json.load(file)

color_names = [*colors.keys()]

with open("src/cache.json", "r") as file:
  cache = json.load(file)


def get_color(i, shade=300):
  if i in cache:
    return cache[i][str(shade)]

  global color_names

  if len(color_names) == 0:
    color_names = [*colors.keys()]

  k = random.randrange(len(color_names))

  color_name = color_names[k]
  color_names.remove(color_name)
  color_shades = colors[color_name]

  cache[i] = color_shades

  return color_shades[str(shade)]


def hex_to_rgb(hex):
  hex = hex[1:]  # remove "#"
  hr, hg, hb = [
    hex[i * len(hex) // 3 : (i + 1) * len(hex) // 3] for i in range(3)
  ]  # split by component

  # get int value from hex
  r = int(hr, 16)
  g = int(hg, 16)
  b = int(hb, 16)

  return r, g, b


def save_cache():
  with open("src/cache.json", "w") as file:
    json.dump(cache, file)
