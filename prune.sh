#!/bin/bash

set -euo pipefail
source setup_svtools.sh

INPUT_VCF=$1
zcat $INPUT_VCF | svtools afreq | svtools vcftobedpe | svtools bedpesort | svtools prune -d 100 -e "AF" -s | svtools bedpetovcf | svtools vcfsort | bgzip -c
