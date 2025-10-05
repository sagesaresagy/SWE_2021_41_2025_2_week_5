#!/bin/bash
for c in {a..z}; do
    mkdir -p "$c"
done

for file in files/*; do

    if cat "$file" > temp.txt; then
        name=${file##*/}
        first_char=${name:0:1}
        folder=$(echo "$first_char" | tr '[:upper:]' '[:lower:]')

        if [[ $folder == [a-z] ]]; then
            mv "$file" "$folder"/
        fi
    fi
done
rm temp.txt