import os

os.chdir('/Users/hugo/Documents/ecole/maths')
chapters = sorted([d for d in os.listdir('.') if d.startswith('chap')])
all_todos = []
table_header = ['Chapter', 'File', 'Line']

for chapter in chapters:
    files = sorted([
        os.path.join(dp, f)
        for dp, dn, filenames in os.walk(chapter)
        for f in filenames
        if os.path.splitext(f)[1] == '.tex' and 'asy' not in dp
    ])

    for file in files:
        with open(file) as f:
            content = f.readlines()

        todos = [
            i
            for i,line in enumerate(content)
            if '%' in line
        ]

        for todo in todos:
            all_todos.append((chapter, file[len(chapter)+1:], todo))

format_row = "{:>20}" * (len(table_header))
print(format_row.format(*table_header))

for todo in all_todos:
    print(format_row.format(*todo))
