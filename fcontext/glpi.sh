#!/bin/bash

#BASE_DIR=${BASE_DIR}
if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

chmod -R 0000 ${BASE_DIR}
chmod -R u+rwX ${BASE_DIR}
chmod -R g+rX ${BASE_DIR}
chown -R root:apache ${BASE_DIR}
chown -R apache:apache ${BASE_DIR}/files
chown -R apache:apache ${BASE_DIR}/config

semanage -i - <<EOF
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/files(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/config(/.*)?"
EOF
restorecon -R -v ${BASE_DIR}

