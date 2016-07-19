#!/bin/bash
set -ueo pipefail

# This creates a single table for each sample (sample.map eXtended)

check_file_exists() {
    if [ ! -e "$1" ]
    then
        echo "warning: $1 doesn't exist." 1>&2
    fi
}

SAMPLE_MAP=$1
LUMPY_DIR=$2

#echo -e "Sample\tBAM\tSPLITTER"
while read SAMPLE BAM
do 
    check_file_exists $BAM

    SPL=${BAM%.*}.splitters.bam
    check_file_exists $SPL

    HIST=$LUMPY_DIR/$SAMPLE/temp/cnvnator-temp/${BAM##*/}.hist.root
    check_file_exists $HIST

    echo -e "$SAMPLE\t$BAM\t$SPL"
done < $SAMPLE_MAP

