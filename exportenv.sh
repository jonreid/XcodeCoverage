#   XcodeCoverage by Jon Reid, http://qualitycoding/about/
#   Copyright 2014 Jonathan M. Reid. See LICENSE.txt

DIR="${SRCROOT}"
export | egrep '( BUILT_PRODUCTS_DIR)|(CURRENT_ARCH)|(OBJECT_FILE_DIR_normal)|(SRCROOT)|(OBJROOT)' > ${DIR}/env.sh
