#!/bin/bash

#BASE_DIR=${BASE_DIR}
if [ -z $BASE_DIR ]; then
    echo "Error: \$BASE_DIR is undefined"
    exit 1
fi

chmod -R 0000 ${BASE_DIR}
chmod -R u+rwX ${BASE_DIR}
chmod -R g+rX ${BASE_DIR}
chown -R apache:apache ${BASE_DIR}

semanage -i - <<EOF
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/config_db.php"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/config.php"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/installed_extensions.php"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/company(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/lang(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/tmp(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/modules(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/themes(/.*)?"
fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/sql(/.*)?"
EOF
restorecon -R -v ${BASE_DIR}

