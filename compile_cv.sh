for file in *.aux ; do
  bibtex `basename $file .aux`
done

pdflatex cv
bibtex cv
pdflatex cv

git add .
git commit -m "compile cv"
cp cv.pdf ~/
rm cv.pdf
git checkout gh-pages
mv ~/cv.pdf .
git add cv.pdf
git commit -m "update"
git push
git checkout main
