#!/usr/bin/env bash

# set path to analysis files
#User inputs directory they wish to analyse e.g. SIvG_Female
INPUT=$1
DATALOC="$PWD"/${INPUT}

# 1. Make directories
mkdir -p ${DATALOC}/_trimmed
mkdir -p ${DATALOC}/_trimmed/quality_control
mkdir -p ${DATALOC}/_trimmed/quality_control/raw

cd ${INPUT}


# 2. For each directory inside the selected directory, finds appropriate files for paired end analysis
for DIREC in */ ; do
	cd ${DIREC}

	F1=*R1_001.fastq.gz
	F2=*R2_001.fastq.gz
	echo "In directory: " "${DIREC}"
	echo "Identified Files:"
	echo ${F1}
	echo ${F2}
	echo " "
	
#3. Passes it to Trim_Galore	
		trim_galore ${F1} ${F2}\
		--paired \
    		--cores 4 \
    		-o ${DATALOC}/_trimmed
	
	cd ../
done

# 2. Perform MultiQC on trimmed data
for file in ${DATALOC}/_trimmed/*; do
    fastqc $file \
    -t 4 \
    --outdir ${DATALOC}/_trimmed/quality_control/raw
done

multiqc ${DATALOC}/_trimmed/quality_control/raw -n raw_reads -o ${DATALOC}/_trimmed/quality_control
