import os

dirs = list(
  filter(
    lambda x: '202' in x,
    sorted(os.listdir("archive"))
  )
)

print(dirs[-1])