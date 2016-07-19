#!/bin/bash

set -euo pipefail
source setup_svtools.sh

svtools lmerge -i "$1" -f 20 --product
