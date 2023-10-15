#!/bin/bash

input_dir=$1
outdir=$2

proteins=()

csv_files=$(find "$input_dir" -type f -name "*.csv")

for file in $csv_files; do
    tail -n +2 "$file" | cut -d ',' -f 2 | while IFS= read -r line; do
        proteins+=("$line")
    done
done

echo "${proteins[@]}" > "$outdir/proteins.txt
