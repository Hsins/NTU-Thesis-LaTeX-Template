# Run this script from the terminal to compile the LaTeX files locally.
# This can be useful especially if the document size exceeds the free
# limit on Overleaf.

xelatex -interaction=nonstopmode main.tex
bibtex main
xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex

rm main.{bbl,lof,lot,toc,aux,blg,log,out}

