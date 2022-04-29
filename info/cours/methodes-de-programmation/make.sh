pandoc -F mermaid-filter -t pdf diviser-pour-regner.md -o diviser-pour-regner.pdf
pandoc -F mermaid-filter -t pdf programmation-dynamique.md -o programmation-dynamique.pdf
pandoc -F mermaid-filter -t pdf algorithmes-gloutons.md -o algorithmes-gloutons.pdf
pdfunite diviser-pour-regner.pdf programmation-dynamique.pdf algorithmes-gloutons.pdf cours.pdf
