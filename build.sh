#!/bin/sh
find public/EPUB -type f -exec sed -E -i 's#(href|src|url)=(")?/#\1=\2#g' {} +
