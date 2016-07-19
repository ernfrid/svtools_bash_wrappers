#!/bin/bash
set -ueo pipefail

# Expects that there are environment variables set that it is to use
# Source this in other scripts to ensure that svtools is present on your path
# Set the environment variables before running or on the command line
PATH=${SVTOOLS_CONDA_PATH}:$PATH
set +u
source activate ${SVTOOLS_CONDA_ENV}
set -u
