#!/bin/sh
hugo --cleanDestinationDir
rsync -r --remove-source-files --exclude='EPUB/' --exclude='mimetype' --exclude='META-INF/' public/ public/EPUB/
rmdir public/* >/dev/null 2>&1 || true
find public/EPUB -type f -exec sed -E -i 's#(href|src|url)=(")?/#\1=\2#g' {} +
rm ebook.epub ebook/ -r
cd public
zip -X0 ../ebook.epub mimetype
zip -rX ../ebook.epub EPUB META-INF
cd ../
dtrx ebook.epub -r -o