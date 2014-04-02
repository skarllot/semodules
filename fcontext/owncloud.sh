#!/bin/bash

if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

mkdir ${BASE_DIR}/data
chown -R apache:apache ${BASE_DIR}/data
chmod -R o-w ${BASE_DIR}

semanage -i - <<EOF
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/config(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/apps(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/data(/.*)?"
EOF
restorecon -R -v ${BASE_DIR}

