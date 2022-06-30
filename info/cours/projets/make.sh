pandoc -F mermaid-filter -t pdf planning.md -o planning.pdf
pandoc -F mermaid-filter -t pdf oraux.md -o oraux.pdf
pdfunite planning.pdf oraux.pdf cours.pdf
