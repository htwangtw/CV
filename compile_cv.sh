for file in *.aux ; do
  bibtex `basename $file .aux`
done

pdflatex cv
bibtex cv
pdflatex cv

cp cv.pdf ~/
rm cv.pdf
git add .
git commit -m "compile cv"
git checkout gh-pages
cp ~/cv.pdf .
git add cv.pdf
git commit -m "update"
git push
git checkout main
