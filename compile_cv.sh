for file in *.aux ; do
  bibtex `basename $file .aux`
done

pdflatex cv
bibtex cv
pdflatex cv

cp cv.pdf ~/
git checkout gh-pages
mv ~/cv.pdf .
git add cv.pdf
git commit -m "update"
git push
git checkout master