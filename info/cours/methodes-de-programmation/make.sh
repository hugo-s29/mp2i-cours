pandoc -F mermaid-filter -t pdf diviser-pour-regner.md -o diviser-pour-regner.pdf
pandoc -F mermaid-filter -t pdf programmation-dynamique.md -o programmation-dynamique.pdf
pdfunite diviser-pour-regner.pdf programmation-dynamique.pdf cours.pdf
