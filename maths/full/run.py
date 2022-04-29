import os

if os.getcwd() != '/Users/hugo/Documents/ecole/maths/full':
    os.chdir('/Users/hugo/Documents/ecole/maths/full')

os.chdir('..')
chaps = sorted([ d for d in os.listdir('.') if d.startswith('chap') ])

out = r'''\documentclass[a4paper]{report}
\input{../preamble.tex}

\newcommand{\chap}[2][0]{
    \setcounter{chapter}{#1 - 1}
    \chapter{#2}
    \renewcommand*\parttitle{#2}
}

\let\part\section
\let\section\subsection
\AtBeginDocument{\fulltrue}

\renewcommand{\thesection}{\arabic{section}}

\usepackage{pgfornament}
\usepackage{makeidx}
\usepackage{fancyhdr}
\usepackage[totoc]{idxlayout}
\usepackage{tocbibind}
\pagestyle{fancy}

\fancyhead[R]{\itshape MP2I}
\fancyhead[L]{\arabic{chapter}.\arabic{section}}
\fancyhead[C]{\parttitle}

\fancyfoot{}
\fancyfoot[C]{\thepage}

\makeindex

\begin{document}
    \begin{titlepage}
        \begin{center}
            \vspace{10cm}
            {\Large \itshape 2021-2022}\\
            \vspace{3cm}
            \pgfornament[width=8cm]{88}\\
            \vspace{2mm}
            \vspace{0.5cm}
            {\HUGE Mathématiques}\\
            \vspace{0.5cm}
            {\fontsize{240pt}{260pt}\selectfont MP2I}\\
            \vspace{0.5cm}
            \pgfornament[width=8cm]{88}\\
            \vfill
            Hugo {\sc Salou}\\
        \end{center}
    \end{titlepage}

    {
        \lhead{}
        \renewcommand*\parttitle{Table des matières}
        \tableofcontents
    }

'''.replace('    ', '\t')

for chap in chaps:
    main_path = os.path.join(os.getcwd(), chap, 'main.tex')
    num = chap[4:]
    
    if not os.path.exists(main_path):
        continue

    with open(main_path) as f:
        main_content = f.read()

    inputs = [
        line[8:-1]
        for line in main_content.split('\n')
        if line.startswith('\t\\input{')
    ]

    title = [
        line[line.index('{', 7)+1:-1]
        for line in main_content.split('\n')
        if line.startswith('\\title{')
    ][0]

    out += '\n\n\t\\chap[' + num + ']{' + title + '}'
    out += '\n\t\\renewcommand{\cwd}{../' + chap + '}'

    for inp in inputs:
        out += '\n\t\\input{../' + chap + '/' + inp + '}'

out += r'''

    \clearpage
    \lhead{}
    \renewcommand*\parttitle{Index}
    \printindex
\end{document}
'''.replace('    ', '\t')
os.chdir('full')

with open('main.tex', 'w') as f:
    f.write(out)

with open('simple-main.tex', 'w') as f:
    f.write('\\AtBeginDocument\\simpletrue\n\\input{main.tex}')
