#!/bin/bash
#
#   XcodeCoverage by Jon Reid, http://qualitycoding/about/
#   Copyright 2014 Jonathan M. Reid. See LICENSE.txt

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/env.sh"

# Change the report name if you like:
LCOV_INFO=Coverage.info

XCODECOVERAGE_PATH="${SRCROOT}/XcodeCoverage"
LCOV_PATH="${DIR}/lcov-1.11/bin"
OBJ_DIR="${OBJECT_FILE_DIR_normal}/${CURRENT_ARCH}"

# Fix for the new LLVM-COV that requires gcov to have a -v paramter
LCOV() {
	"${LCOV_PATH}/lcov" "$@" --gcov-tool "${DIR}/llvm-cov-wrapper.sh"
}
