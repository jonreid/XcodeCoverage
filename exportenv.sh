#
#   Copyright 2014 Jonathan M. Reid. See LICENSE.txt
#   Created by: Jon Reid, http://qualitycoding.org/
#   Source: https://github.com/jonreid/XcodeCoverage
#

DIR="${SRCROOT}"
export | egrep '( BUILT_PRODUCTS_DIR)|(CURRENT_ARCH)|(OBJECT_FILE_DIR_normal)|(SRCROOT)|(OBJROOT)' > ${DIR}/env.sh
