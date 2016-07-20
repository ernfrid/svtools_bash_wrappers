#!/bin/bash

set -eo pipefail
source setup_svtools.sh

FILE_OF_FILES=$1
MASTER_VCF=${2-}

MERGE=''
if [ "$MASTER_VCF" ]; then
    MERGE="-m $MASTER_VCF"
fi

svtools vcfpaste $MERGE -q -f $FILE_OF_FILES
