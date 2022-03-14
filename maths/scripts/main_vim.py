import os
import subprocess as sp
import tkinter as tk
from tkinter import simpledialog
import shutil
import unicodeit

def input(text, val = ""):
    master = tk.Tk()
    master.withdraw()

    return simpledialog.askstring(title=text, prompt=text, initialvalue = val)

def choose(*options):
    process = sp.Popen("choose", stdin=sp.PIPE, stdout=sp.PIPE)
    
    process.stdin.write(str.encode('\n'.join(options)))
    process.stdin.close()

    process.wait()

    result = process.stdout.read().decode('utf-8')

    process.terminate()

    if len(result) == 0:
        exit()

    return result

os.chdir('/Users/hugo/Documents/ecole/maths')
chapters = list(reversed(sorted(filter(lambda d: d.startswith('chap'), os.listdir('.')))))
chapters.append('--NEW--')

def get_chapter_name(chapter):
    if chapter == '--NEW--':
        return 'Nouveau chapitre'
    if not os.path.exists(f'{chapter}/main.tex'):
        return f'Chapitre {chapter[4:]}'
    
    else:
        with open(f'{chapter}/main.tex') as f:
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

        title = part_line[start:end]
        return f'Chapitre {int(chapter[4:])} : {title}'

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

def get_part_name(file, offset=2):
    if file == '--NEW--':
        return 'Nouvelle partie'

    with open(file) as f:
        content = f.readlines()[0]

    if 'part' not in content:
        if offset == 1:
            return f'Partie {int(file[offset:-4])}'
        else:
            return f'Exercice {int(file[offset:-4])}'
    
    else:
        title = unicode_tex(content[6:-2])
        if offset == 1:
            return f'Partie {file[offset:-4]} : {title}'
        else:
            return title
def create_chap():
    num = int(chapters[0][4:]) + 1
    title = input('Titre ? ')
    num = int(input('Numéro ?', str(num)))
    chap = f'chap{str(num).zfill(2)}'

    os.mkdir(chap)
    os.mkdir(f'{chap}/asy')
    shutil.copyfile('latexmkrc', f'{chap}/latexmkrc')
    shutil.copyfile('compile-asy.sh', f'{chap}/commpile-asy.sh')
    os.chdir(chap)

    with open('main.tex', 'w') as f:
        f.write(r"""\documentclass[a4paper]{report}

\input{../preamble.tex}
\title{--CHAP_NUM--}{--CHAP_TITLE--}

\begin{document}
	\tableofcontents

\end{document}
        """.replace('--CHAP_NUM--', str(num)).replace('--CHAP_TITLE--', title))

    print(f':e ~/Documents/ecole/maths/{chap}/main.tex')


chapters_names = [get_chapter_name(chap) for chap in chapters]
choice = choose(*chapters_names)
index = chapters_names.index(choice)
chap = chapters[index]

if chap == '--NEW--':
    create_chap()
    exit()

os.chdir(chap)

section = choose('Cours', 'TD', 'Exercices', 'Fiches')
chap_num = chap[4:]

default_td_main = r"""\documentclass[a4paper]{article}

\input{../../preamble.tex}
\title{--CHAP_NUM--}{--TD_FONT-- TD}

\begin{document}
    \tableofcontents
    
\end{document}
"""

if section == 'Cours':
    parts = sorted([
        file
        for file in os.listdir('.')
        if file.startswith('p') and file.endswith('.tex')
    ])

    try:
        last_part = parts[-1][1:-4]
    except:
        last_part = 0
    parts.append('--NEW--')

    parts_names = [
        get_part_name(file, 1)
        for file in parts
    ]

    chosen_part = choose(*parts_names)
    file = parts[parts_names.index(chosen_part)]

    if file == '--NEW--':
        with open('main.tex') as f:
            main_file = f.readlines()

        end_doc_line = main_file.index('\\end{document}\n')
        new_part = str(int(last_part)+1)
        new_part_file = f'p{new_part}.tex'
        new_part_tex = '\t\\input{' + new_part_file + '}\n'
        main_file.insert(end_doc_line, new_part_tex)

        main_file = ''.join(main_file)

        with open('main.tex', 'w') as f:
            f.write(main_file)

        file = new_part_file

    print(f':e ~/Documents/ecole/maths/{chap}/{file}')

elif section == 'TD':
    if not os.path.exists('td/'):
        os.mkdir('td')


    os.chdir('td')
    parts = sorted([
        file
        for file in os.listdir('.')
        if file.startswith('ex') and file.endswith('.tex')
    ])

    if not os.path.exists('main.tex'):
        with open('main.tex', 'w') as f:
            f.write(
                default_td_main\
                    .replace('--CHAP_NUM--', str(chap_num))\
                    .replace('--TD_FONT--', r'\bf \fontsize{128pt}{128pt}\selectfont')
            )


    parts.insert(0, '--NEW--')

    parts_names = [
        get_part_name(file)
        for file in parts
    ]

    chosen_part = choose(*parts_names)
    file = parts[parts_names.index(chosen_part)]

    if file == '--NEW--':
        ex_num = int(input('Num° Exercice ? '))

        with open('main.tex') as f:
            main_file = f.readlines()

        end_doc_line = main_file.index('\\end{document}\n')
        new_part = str(ex_num).zfill(2)
        new_part_file = f'ex{new_part}.tex'
        new_part_tex = '\t\\input{' + new_part_file + '}\n'
        main_file.insert(end_doc_line, new_part_tex)

        main_file = ''.join(main_file)

        with open('main.tex', 'w') as f:
            f.write(main_file)

        file = new_part_file

        with open(new_part_file, 'w') as f:
            f.write(r'\part{Exercice --EX_NUM--}'.replace('--EX_NUM--', str(ex_num)) + '\n')

    print(f':e ~/Documents/ecole/maths/{chap}/td/{file}')

elif section == 'Exercices':
    if not os.path.exists('td-ex/'):
        os.mkdir('td-ex')


    os.chdir('td-ex')
    parts = sorted([
        file
        for file in os.listdir('.')
        if file.startswith('ex') and file.endswith('.tex')
    ])

    if not os.path.exists('main.tex'):
       with open('main.tex', 'w') as f:
           f.write(
                default_td_main\
                    .replace('--CHAP_NUM--', str(chap_num))\
                    .replace('--TD_FONT--', '')
            )

    parts.insert(0, '--NEW--')

    parts_names = [
        get_part_name(file)
        for file in parts
    ]

    chosen_part = choose(*parts_names)
    file = parts[parts_names.index(chosen_part)]

    if file == '--NEW--':
        ex_num = int(input('Num° Exercice ? '))

        with open('main.tex') as f:
            main_file = f.readlines()

        end_doc_line = main_file.index('\\end{document}\n')
        new_part = str(ex_num).zfill(2)
        new_part_file = f'ex{new_part}.tex'
        new_part_tex = '\t\\input{' + new_part_file + '}\n'
        main_file.insert(end_doc_line, new_part_tex)

        main_file = ''.join(main_file)

        with open('main.tex', 'w') as f:
            f.write(main_file)

        file = new_part_file

        with open(new_part_file, 'w') as f:
            f.write(r'\part{Exercice --EX_NUM--}'.replace('--EX_NUM--', str(ex_num)) + '\n')

    print(f':e ~/Documents/ecole/maths/{chap}/td-ex/{file}')
elif section == 'Fiches':
    choices = []

    if os.path.exists('cours.pdf'):
        choices.append('Cours - Polycopié')
    if os.path.exists('td.pdf'):
        choices.append('TD - Polycopié')
    if os.path.exists('td/main.pdf'):
        choices.append('TD')
    if os.path.exists('main.pdf'):
        choices.append('Cours')
    if os.path.exists('simple-main.pdf'):
        choices.append('Cours simple')

    choice = choose(*choices)
    
    if choice == 'Cours - Polycopié':
        os.system('open cours.pdf')
    elif choice == 'TD - Polycopié':
        os.system('open td.pdf')
    elif choice == 'Cours':
        os.system('open main.pdf')
    elif choice == 'TD':
        os.system('open td/main.pdf')
    elif choice == 'Cours simple':
        os.system('open simple-main.pdf')
