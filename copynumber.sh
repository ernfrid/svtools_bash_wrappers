#!/bin/bash

set -euo pipefail
source setup_svtools.sh
set +u
source $SVTOOLS_THIS_ROOT
set -u

CNVNATOR_PATH=$1
GENOTYPE_VCF=$2
COORDINATES_FILE=$3
SAMPLE=$4
COPYNUMBER_HIST=$5

svtools copynumber --cnvnator $CNVNATOR_PATH -s $SAMPLE -w 100 -r $COPYNUMBER_HIST -c $COORDINATES_FILE -v $GENOTYPE_VCF
