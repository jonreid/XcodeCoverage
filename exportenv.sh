#
#   Copyright 2012 Jonathan M. Reid. See LICENSE.txt
#

export | egrep '( BUILT_PRODUCTS_DIR)|(NATIVE_ARCH=)|(OBJECT_FILE_DIR_normal)|(SRCROOT)' > XcodeCoverage/env.sh
