

pandoc --from=markdown --to=latex --template=template.tex --output=main.tex main.md
rubber -d main.tex
