#!/bin/bash
TARGETDIR="./out"

rm -rf $TARGETDIR


# compile slim templates

for file in $(find . -type f -name \*.slim); do
	dir="./$TARGETDIR/$(dirname ${file})"
	mkdir -p "$dir"
	echo "Converting to $dir/$(basename ${file%.*}).erb"
	slimrb -e ${file}>"$dir/$(basename ${file%.*}).erb"
    echo "Done"

done