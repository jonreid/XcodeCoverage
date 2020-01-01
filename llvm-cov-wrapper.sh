#!/bin/bash
#   XcodeCoverage by Jon Reid, https://qualitycoding.org/
#   Copyright 2020 Quality Coding, Inc. See LICENSE.txt

if [ "$1" = "-v" ]; then
  echo "llvm-cov-wrapper 4.2.1"
  exit 0
else
  /usr/bin/gcov "$@"
fi
