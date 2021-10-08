for file in *.aux ; do
  bibtex `basename $file .aux`
done

pdflatex cv
bibtex cv
pdflatex cv
