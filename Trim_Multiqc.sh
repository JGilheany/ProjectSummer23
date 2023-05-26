#!/usr/bin/env bash

# set path to analysis files
#User inputs directory they wish to analyse e.g. SIvG_Female
INPUT=$1

DATA="$PWD"/${INPUT}

# 1. Make directories
mkdir -p ${INPUT}/trimmed
mkdir -p ${INPUT}/trimmed/quality_control
mkdir -p ${INPUT}/trimmed/quality_control/raw

# 2. perform basic trim_galore on each file in specified directory

for file in ${DATA}/*; do
    trim_galore $file \
    --cores 4 \
    -o ${INPUT}/trimmed
done


# 2. Perform QC on trimmed data as final sanity check
for file in ${DATA}/trimmed/*; do
    fastqc $file \
    -t 4 \
    --outdir ${INPUT}/trimmed/quality_control/raw
done

multiqc ${INPUT}/trimmed/quality_control/raw -n raw_reads -o ${INPUT}/trimmed/quality_control
