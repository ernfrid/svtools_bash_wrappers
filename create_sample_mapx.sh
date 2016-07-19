#!/bin/bash
set -ueo pipefail

# This creates a single table for each sample (sample.map eXtended)

check_file_exists() {
    if [ ! -e "$1" ]
    then
        echo "warning: $1 doesn't exist." 1>&2
    fi
}

# From http://stackoverflow.com/questions/17577093/how-do-i-get-the-absolute-directory-of-a-file-in-bash
function abspath() {
    (
    cd $(dirname "$1")
    DIR=$PWD/$(basename "$1")
    echo $DIR
    )
}

SAMPLE_MAP=$1
LUMPY_DIR=$2

#echo -e "Sample\tBAM\tSPLITTER"
while read SAMPLE BAM
do 
    check_file_exists $(abspath $BAM)

    SPL=$(abspath ${BAM%.*}.splitters.bam)
    check_file_exists $SPL

    HIST=$(abspath $LUMPY_DIR/$SAMPLE/temp/cnvnator-temp/${BAM##*/}.hist.root)
    check_file_exists $HIST

    echo -e "$SAMPLE\t$BAM\t$SPL\t$HIST"
done < $SAMPLE_MAP

