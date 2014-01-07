#!/bin/bash

BASE_DIR=${BASE_DIR}

semanage fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/config(/.*)?"
restorecon -R -v ${BASE_DIR}/config
semanage fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/apps(/.*)?"
restorecon -R -v ${BASE_DIR}/apps
semanage fcontext -a -t httpd_sys_rw_content_t "${BASE_DIR}/data(/.*)?"
mkdir ${BASE_DIR}/data
chown -R apache. ${BASE_DIR}/data
restorecon -R -v ${BASE_DIR}/data

chmod -R o-w ${BASE_DIR}
