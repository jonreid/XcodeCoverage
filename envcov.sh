#!/bin/bash
#   XcodeCoverage by Jon Reid, https://qualitycoding.org
#   Copyright 2021 Quality Coding, Inc. See LICENSE.txt

scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${scripts}/env.sh"

# For New Build System, hard-code to 64-bit simulator
if [ ${CURRENT_ARCH}  = "undefined_arch" ]
then
    ARCHITECTURE="x86_64"
else
    ARCHITECTURE=${CURRENT_ARCH}
fi

LCOV_PATH="${scripts}/lcov-1.14/bin"
OBJ_DIR="${OBJECT_FILE_DIR_normal}/${ARCHITECTURE}"

# Fix for the new LLVM-COV that requires gcov to have a -v parameter
LCOV() {
    "${LCOV_PATH}/lcov" "$@" --gcov-tool "${scripts}/llvm-cov-wrapper.sh"
}
