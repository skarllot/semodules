#!/bin/bash

if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

chown -R apache:apache ${BASE_DIR}/data/cache
chmod -R o-w ${BASE_DIR}

semanage -i - <<EOF
fcontext -a -t httpd_cache_t "${BASE_DIR}/data/cache(/.*)?"
EOF
restorecon -R -v ${BASE_DIR}

