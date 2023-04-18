for file in *.aux ; do
  bibtex `basename $file .aux`
done

pdflatex cv
bibtex cv
pdflatex cv

git add cv.pdf
git commit -m "compile cv"
rm ~/cv.pdf
cp cv.pdf ~/
git checkout gh-pages
mv ~/cv.pdf .
git add cv.pdf
git commit -m "update"
git push
git checkout main
