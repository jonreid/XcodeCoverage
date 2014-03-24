#!/bin/sh
#
#   Copyright 2014 Jonathan M. Reid. See LICENSE.txt
#   Created by: Jon Reid, http://qualitycoding.org/
#   Source: https://github.com/jonreid/XcodeCoverage
#

if [ "$1" = "-v" ]; then
    echo "llvm-cov-wrapper 4.2.1"
    exit 0
else
    /usr/bin/gcov $*
fi
