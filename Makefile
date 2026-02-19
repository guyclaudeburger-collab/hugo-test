#
# we assume you already cloned epub
#
build:
	hugo --minify --cleanDestinationDir
	rsync -r --remove-source-files --exclude='public/META-INF/' --exclude='public/mimetype' public/* public/EPUB/
	rmdir public/* >/dev/null 
	zip -rX ebook.epub public/mimetype public/EPUB public/META-INF

clean:
	rm -rf ebook.epub public/