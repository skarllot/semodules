#!/bin/bash

BASE_DIR=/var/www/webacula

semanage fcontext -a -t httpd_cache_t "${BASE_DIR}/data/cache(/.*)?"
restorecon -R -v ${BASE_DIR}/data/cache

chmod -R o-w ${BASE_DIR}
