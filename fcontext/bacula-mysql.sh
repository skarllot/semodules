#!/bin/bash

if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

chown -R bacula:bacula ${BASE_DIR}
chmod -R o-rwx ${BASE_DIR}

semanage -i - <<EOF
fcontext -a -t bacula_store_t "${BASE_DIR}(/.*)?"
EOF
restorecon -R -v ${BASE_DIR}

