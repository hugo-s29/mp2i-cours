import os, subprocess, shutil, json, datetime, inquirer, unicodeit


directories = sorted([
    entity
    for entity in os.listdir('.')
    if not os.path.isfile(entity) and entity.startswith('chap')
])

cwd = os.getcwd()
out_directory = f'{cwd}/../web/data/maths/'

def unicode_tex(title):
    parts = title.split('$')
    out = ''

    replace = {
        "\\mathbbm": "\\mathbb",
        "\\R": "\\mathbb{R}",
        "\\C": "\\mathbb{C}",
        "\\Z": "\\mathbb{Z}",
        "\\Q": "\\mathbb{Q}",
        "\\N": "\\mathbb{N}",
    }

    for i, part in enumerate(parts):
        if i % 2 == 0:
            out += part
        else:
            for old, new in replace.items():
                part = part.replace(old, new)
            out += unicodeit.replace(part)

    return out

def clean_up_asymptote_files(chapter):
    asy_directory = f'{cwd}/{chapter}/asy'
    if os.path.exists(asy_directory):
        shutil.rmtree(asy_directory)
        os.mkdir(asy_directory)
    else:
        os.mkdir(asy_directory)

def compile_latex_file(file_path):
    directory, file = os.path.split(file_path)

    os.chdir(directory)
    subprocess.Popen(f'latexmk -pdf {file}', shell=True).wait()

    return f"{directory}/{file[:-4]}.pdf"

def create_simple_file(file_path):
    with open(file_path, 'w+') as f:
        out = r'\AtBeginDocument\simpletrue' + '\n'
        out += r'\input{main.tex}'
        f.write(out)

def clear_console():
    os.system('cls' if os.name=='nt' else 'clear')

def get_choices(chapter):
    main_path = f'{cwd}/{chapter}/main.tex'
    td_path = f'{cwd}/{chapter}/td/main.tex'
    choices = []

    title = ""

    if os.path.exists(main_path):
        with open(main_path) as f:
            file_content = f.readlines()

        part_line_num = [
            'title' in l
            for l in file_content
        ].index(True)

        if part_line_num != -1:
            part_line = file_content[part_line_num]

            start = part_line.find('{', 9) + 1
            end = part_line.find('}', 10)

            title = unicode_tex(part_line[start:end])

        if title != "":
            choices.append(f"{chapter} -- main ({title})")
        else:
            choices.append(f"{chapter} -- main")
    if os.path.exists(td_path):
        if title != "":
            choices.append(f"{chapter} -- td   ({title})")
        else:
            choices.append(f"{chapter} -- td")

    return choices
    
questions = [
    inquirer.Checkbox(
        "target",
        message="Which files needs to be (re)compiled ?",
        choices=list(reversed([
            c
            for chapter in directories
            for c in reversed(get_choices(chapter))
        ]))
    )
]

answers = inquirer.prompt(questions)

if answers is None:
    exit()

update_full = False

pdf_files = []
for choice in answers['target']:
    chapter, part = choice.split(' -- ')

    path = ""
    file = ""

    if part.startswith("main"):
        path = f'{cwd}/{chapter}/main.tex'
        file = f"{chapter}.pdf"
        update_full = True
    else:
        path = f'{cwd}/{chapter}/td/main.tex'
        file = f"{chapter}-td.pdf"
    
    pdf_files.append((compile_latex_file(path), file))

    if part == "main":
        simple_path = f'{cwd}/{chapter}/simple-main.tex'
        simple_file = f'{chapter}-simple.pdf'

        if not os.path.exists(simple_path):
            create_simple_file(simple_path)
        
        pdf_files.append((compile_latex_file(simple_path), simple_file))

date = datetime.datetime.now().strftime("%d/%m/%Y %H:%M")

data = {
    'date': date,
    'files': [],
    'chapters': {}
}

def get_title(chapter):
    with open(f'{cwd}/{chapter}/main.tex') as f:
        file_content = f.readlines()

    part_line_num = [
        'title' in l
        for l in file_content
    ].index(True)

    if part_line_num == -1:
        return f'Chapitre {int(chapter[4:])}'
    
    part_line = file_content[part_line_num]

    start = part_line.find('{', 9) + 1
    end = part_line.find('}', 10)

    title = unicode_tex(part_line[start:end])
    return f'Chapitre {int(chapter[4:])} : {title}'


for chapter in directories:
    if os.path.exists(f'{cwd}/{chapter}/main.tex'):
        data["files"].append(f"{chapter}.pdf")
        data["files"].append(f"{chapter}-simple.pdf")

        data['chapters'].update({ chapter: get_title(chapter) })
    if os.path.exists(f'{cwd}/{chapter}/td/main.tex'):
        data["files"].append(f"{chapter}-td.pdf")

for path, file_name in pdf_files:
    shutil.copyfile(path, f'{out_directory}{file_name}')

    data['files'].append(file_name)

if update_full:
    os.chdir(f'{cwd}/full')
    os.system('python3 run.py')
    os.system('latexmk -pdf main.tex')
    os.system('latexmk -pdf simple-main.tex')
    os.chdir(cwd)
    shutil.copyfile('full/main.pdf', f'{out_directory}full.pdf')
    shutil.copyfile('full/simple-main.pdf', f'{out_directory}full-simple.pdf')

with open(f'{out_directory}data.json', 'w') as f:
    json.dump(data, f)

