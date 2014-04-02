#!/bin/bash

if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

chown -R apache:apache ${BASE_DIR}/conf
chown -R apache:apache ${BASE_DIR}/data
chmod -R o-rwx ${BASE_DIR}
chmod -R g-w ${BASE_DIR}
chgrp -R apache ${BASE_DIR}

semanage -i - <<EOF
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/conf(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/data(/.*)?"
EOF
restorecon -R -v ${BASE_DIR}

