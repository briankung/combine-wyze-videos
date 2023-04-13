#!/usr/bin/env sh

for folder in ./2023*; do
    # New process to avoid having to navigate relative paths
    (
        cd "$folder";
        echo "🗂️🗂️🗂️🗂️🗂️ $folder 🗂️🗂️🗂️🗂️🗂️"
        ls -d **/*.mp4 | rg '(.+)' -r 'file $1' > files.txt
        cat files.txt
        ffmpeg -f concat -safe 0 -i files.txt -c copy ./combined.mp4;
    )
done
