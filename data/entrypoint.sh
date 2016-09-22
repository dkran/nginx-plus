#!/bin/bash

# Entry point file to populate the empty mounted directories.

bootstrapDir="/usr/share/nginx-bootstrap"

if [ -e "$bootstrapDir/new-flag" ]
then
  echo "Extracting files"
  gosu root chown -R 1010:1010 /etc/nginx /var/log/nginx /srv/http /usr/share/nginx-bootstrap
  gosu root chmod -R 775 /etc/nginx /var/log/nginx /srv/http /usr/share/nginx-bootstrap
  gosu nginx tar xvf $bootstrapDir/etc-nginx.tar.gz -C /etc/nginx
  gosu nginx tar xvf $bootstrapDir/srv-http.tar.gz -C /srv/http
  gosu nginx rm $bootstrapDir/new-flag
fi

exec gosu nginx nginx -g daemon-off;