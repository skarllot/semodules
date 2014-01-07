#!/bin/bash

semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/owncloud/config(/.*)?"
restorecon -R -v /var/www/owncloud/config
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/owncloud/apps(/.*)?"
restorecon -R -v /var/www/owncloud/apps
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/owncloud/data(/.*)?"
mkdir /var/www/owncloud/data
chown -R apache. /var/www/owncloud/data
restorecon -R -v /var/www/owncloud/data

chmod -R o-w /var/www/owncloud
