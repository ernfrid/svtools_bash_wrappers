#!/bin/bash

set -euo pipefail
source setup_svtools.sh

svtools lsort "$@"
