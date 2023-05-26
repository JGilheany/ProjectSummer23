#!/usr/bin/env bash

# set path to analysis files
#User inputs directory they wish to analyse e.g. SIvG_Female
INPUT=$1

#User then inputs the location of the index directory they wish to use
INDEX=$2 

#Location of script
SCRIPTLOC="$PWD"

#makes a directory to store the sf files
mkdir -p ${SCRIPTLOC}/${INPUT}/sf_files	

cd ${INPUT}

for DIREC in */ ; do
	cd ${DIREC}
	
	echo "Processing sample: ${DIREC}"
		salmon quant -i ${SCRIPTLOC}/${INDEX} -l A \
        	-1 *_R1_001_val_1.fq.gz \
        	-2 *_R2_001_val_2.fq.gz \
        	-p 8 --validateMappings -o ${SCRIPTLOC}/${INPUT}/rawquants/${DIREC}

#removes trailing slash from end of directory(hopefully)
DIRNAME=${DIREC%/}


#renames and moves .sf files to somewhere more useful
	echo "Creating copy of .sf file in: ""${SCRIPTLOC}/${INPUT}/sf_files"
	cp -b ${SCRIPTLOC}/${INPUT}/rawquants/${DIRNAME}/quant.sf \
	${SCRIPTLOC}/${INPUT}/sf_files/${DIRNAME}_quant.sf
		cd ../



done 

cd ${SCRIPTLOC}
