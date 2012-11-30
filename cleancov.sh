#
#   Copyright 2012 Jonathan M. Reid. See LICENSE.txt
#

source envcov.sh

# Clean out the old data
"${LCOV_PATH}/lcov" -d "${OBJ_DIR}" --zerocounters
