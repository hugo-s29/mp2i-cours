pandoc -F mermaid-filter -t pdf arbres.md -o arbres.pdf
pandoc -F mermaid-filter -t pdf graphes.md -o graphes.pdf
pdfunite arbres.pdf graphes.pdf cours.pdf
