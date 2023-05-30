#!/usr/bin/env sh

# This is supposed to be on the same level as the individual days in the wyze
# cam `record` folder.

for folder in $(fd . -td -d1); do
    # New process to avoid having to navigate relative paths
    (
        folder=$(basename "$folder");
        cd "$folder";
        echo "🗂️🗂️🗂️🗂️🗂️   $folder 🗂️🗂️🗂️🗂️🗂️";
        ls -d **/*.mp4 | rg '(.+)' -r 'file $1' > files.txt;
        # cat files.txt;
        ffmpeg -f concat -safe 0 -i files.txt -c copy ../$folder-combined.mp4;
        rm files.txt;
    )
done
