#!/bin/bash
#
#   Copyright 2014 Jonathan M. Reid. See LICENSE.txt
#   Created by: Jon Reid, http://qualitycoding.org/
#   Source: https://github.com/jonreid/XcodeCoverage
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ENV_DIR="${DIR}"

if [[ "$DIR" == *Pods/XcodeCoverage* ]]
then
   echo "Using Cocoapods!"
   cd "${DIR}"
   cd ..
   cd ..
   
   #The env.sh file will be in the project root.
   ENV_DIR="$(pwd)"
fi

source "${ENV_DIR}/env.sh"

# Change the report name if you like:
LCOV_INFO=Coverage.info

XCODECOVERAGE_PATH="${SRCROOT}/XcodeCoverage"

if [[ "$DIR" == *Pods/XcodeCoverage* ]]
then
   echo "Using Cocoapods!"
   #The current directory will be where XcodeCoverage is living, not in SRCROOT
   XCODECOVERAGE_PATH="${DIR}"
fi

LCOV_PATH="${XCODECOVERAGE_PATH}/lcov-1.11/bin"
OBJ_DIR="${OBJECT_FILE_DIR_normal}/${CURRENT_ARCH}"

# Fix for the new LLVM-COV that requires gcov to have a -v paramter
LCOV() {
	"${LCOV_PATH}/lcov" "$@" --gcov-tool "${XCODECOVERAGE_PATH}/llvm-cov-wrapper.sh"
}
