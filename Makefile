build:
	hugo --minify --cleanDestinationDir
	rsync -r --remove-source-files \
		--exclude='META-INF/' \
		--exclude='mimetype' \
		public/* public/EPUB/
	rmdir public/* >/dev/null 2>&1 || true
	zip -X0 ebook.epub public/mimetype
	zip -rX ebook.epub public/EPUB public/META-INF

clean:
	rm -rf ebook.epub public/
