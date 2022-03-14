import os, subprocess, shutil, json, datetime, inquirer

directories = sorted([
    entity
    for entity in os.listdir('cours/')
    if not os.path.isfile(entity)
])

cwd = os.getcwd()
out_directory = f'{cwd}/../web/data/info/'

def clear_console():
    os.system('cls' if os.name=='nt' else 'clear')

questions = [
    inquirer.Checkbox(
        "target",
        message="Which files needs to be (re)compiled ?",
        choices=list(reversed(directories))
    )
]

answers = inquirer.prompt(questions)

pdf_files = []
for choice in os.listdir('cours'):
    if choice != '.DS_Store':
        pdf_files.append(('./cours/' + choice + '/cours.pdf', choice))

date = datetime.datetime.now().strftime("%d/%m/%Y %H:%M")

data = {
    'date': date,
    'chapters': {}
}

def get_title(chapter):
    return chapter.replace('-', ' ')

for path, chapter in pdf_files:
    shutil.copyfile(path, f'{out_directory}{chapter}.pdf')
    data['chapters'].update({ (chapter + '.pdf') : get_title(chapter) })

with open(f'{out_directory}data.json', 'w') as f:
    json.dump(data, f)
