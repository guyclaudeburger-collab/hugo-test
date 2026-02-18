#
# we assume you already cloned epub
#
quickstart:
	# git clone https://github.com/weitblick/epub.git
	# cd epub
	hugo --minify
	bash ./deploy.sh
	echo "Your example epub is generated at"
	echo
	echo "exampleSite/ebook.epub"
	echo


clean:
	rm -rf exampleSite/*.epub