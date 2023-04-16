#!/usr/bin/env sh

for folder in $(fd . -td -L1); do
    # New process to avoid having to navigate relative paths
    (
        cd "$folder";
        echo "🗂️🗂️🗂️🗂️🗂️ $folder 🗂️🗂️🗂️🗂️🗂️";
        ls -d **/*.mp4 | rg '(.+)' -r 'file $1' > files.txt;
        # cat files.txt;
        ffmpeg -f concat -safe 0 -i files.txt -c copy ./$folder-combined.mp4;
        rm files.txt;
    )
done
