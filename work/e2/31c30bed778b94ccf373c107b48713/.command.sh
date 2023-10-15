#!/bin/bash -ue
cat $(find ${input_dir} -type f -name "*.csv" | xargs) | cut -d ',' -f 2 > ${outdir}/proteins.txt
