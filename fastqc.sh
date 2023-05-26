#!/usr/bin/env bash

# set path to analysis files
DATA="$PWD"

# 1. Perform QC on raw data

mkdir -p quality_control
mkdir -p quality_control/raw

for file in ${DATA}/*; do
    fastqc $file \
        --outdir quality_control/raw
done

multiqc quality_control/raw -n raw_reads -o quality_control
