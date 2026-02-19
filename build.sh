#!/bin/sh
hugo --minify --cleanDestinationDir
rsync -r --remove-source-files \
	--exclude='META-INF/' \
	--exclude='mimetype' \
	public/* public/EPUB/
rmdir public/* >/dev/null 2>&1 || true
zip -X0 ebook.epub public/mimetype
zip -rX ebook.epub public/EPUB public/META-INF
find public -type f -exec sed -i 's/\(href\|src\|url\)="\/\(.*\)/\1="\2/g; s/\(href\|src\|url\)=\/\(.*\)/\1=\2/g' {} +
