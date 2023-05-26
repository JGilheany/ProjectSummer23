#!/usr/bin/env bash

#first input is the directory to copy directories from
#second is the directory to copy them to

INPUT=$1
OUTPUT=$2
DATAOUT="$PWD"/${OUTPUT}

cd ${INPUT}

for DIREC in */ ; do

	echo "Found directory: " "${DIREC}"
	echo "Making new directory: " "${DATAOUT}/${DIREC}"	
	mkdir -p ${DATAOUT}/${DIREC}
	echo "Done"
	echo " "
cd ../
done


