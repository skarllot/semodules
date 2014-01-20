#!/bin/bash

#BASE_DIR=${BASE_DIR}
if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

semanage fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/conf(/.*)?"
chown -R apache:apache ${BASE_DIR}/conf
restorecon -R -v ${BASE_DIR}/conf
semanage fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/data(/.*)?"
chown -R apache:apache ${BASE_DIR}/data
restorecon -R -v ${BASE_DIR}/data

chmod -R o-rwx ${BASE_DIR}
chmod -R g-w ${BASE_DIR}
chgrp -R apache ${BASE_DIR}
