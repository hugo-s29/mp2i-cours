import os

with open('chap10/aubin.md') as f:
    content = f.readlines()

parts = set()
blocks = set()

for line in content:
    if line.startswith('## '):
        parts.add(line[3:].replace('\n',''))
    elif line.startswith('#### '):
        if ' ' in line[5:]:
            index = (line[5:]).index(' ') + 5
        else:
            index = len(line)
        blocks.add(line[5:index].replace('\n',''))

mapping = {
        'Axiome': 'axm',
        'Corollaire': 'crlr',
        'Lemme': 'lem',
        'Définition': 'defn',
        'Théorème': 'thm',
        'Proposition': 'prop',
        'Propositions': 'prop',
        'Remarque': 'rmk',
        'Preuve': 'prv',
        'Notation': 'rmk',
        None: None
}

for block in blocks:
    if not block in mapping:
        raise Exception(f'No block {block}')

block = None
out = ''

out += r'''
	\pagebreak
	\begin{mdframed}
		La suite du cours provient d'Aubin. Je ne suis pas responsable pour les éventuelles bêtises qu'il a pu taper.
	\end{mdframed}
	\pagebreak
'''

out += '\n\n'

out += '\\let\\cross\\times\n'
out += '\\let\\gt\\ge\n'
out += '\\let\\lt\\le\n'
out += '\\let\\exist\\exists\n'

out += '\n\n'

for line in content:
    line = line.replace('\n', '')

    if line.startswith('## '):
        part = line[7:].replace('\n','')
        if block is not None:
            out += '\\end{' + mapping[block] + '}\n'
            out += '\n'
        block = None

        out += '\n\\part{' + part + '}\n\n'
    elif line.startswith('#### '):
        if ' ' in line[5:]:
            index = (line[5:]).index(' ') + 5
        else:
            index = len(line)
        new_block_name = line[5:index].replace('\n','')
        
        if block is not None:
            out += '\\end{' + mapping[block] + '}\n'
            out += '\n'
        if ' ' in line[5:] and len(line) > index + 2:
            out += '\\begin{' + mapping[new_block_name] + '}[' + line[index+3:] + ']\n'
        else:
            out += '\\begin{' + mapping[new_block_name] + '}\n'
        block = new_block_name
    else:
        if len(line) > 0:
            line += '\\\\'

        out += line + '\n'

out += '\\end{' + mapping[block] + '}\n'
print(out)
