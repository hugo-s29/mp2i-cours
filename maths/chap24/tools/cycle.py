# Generate TikZ code to typeset a cycle
import pyperclip as pc

n = int(input('Num. nodes ?'))
r = input('radius ?')
s = input('elements ?').split(',')

out = ''

for i, s in enumerate(s):
    theta_1 = (360/n) * (i - 1)
    theta_2 = (360/n) * i

    out += '\\node[draw, circle] at (' + str(theta_1) + ':' + r + ') {$' + s + '$};\n';
    out += '\\draw[->, >=latex] ({' + str(theta_1) + '+\\margin}:' + r + ')'
    out += 'arc ({' + str(theta_1) + '+\\margin}:{' + str(theta_2) + '-\\margin}:' + r + ');\n'
    out += '\n';

pc.copy(out)

