splitt:
	./perl_splitting
	
build:
	hugo --cleanDestinationDir
	rsync -r --remove-source-files --exclude='EPUB/' --exclude='mimetype' --exclude='META-INF/' public/ public/EPUB/
	rmdir public/* >/dev/null 2>&1 || true
	./build.sh
	rm ebook.epub -r
	cd public;zip -X0 ../ebook.epub mimetype;zip -rX ../ebook.epub EPUB META-INF

clean:
	rm -rf ebook.epub