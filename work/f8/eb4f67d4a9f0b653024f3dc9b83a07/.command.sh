#!/bin/bash -ue
cat (find data -type f -name "*.csv" | xargs) | cut -d ',' -f 2 > output/proteins.txt
