#!/bin/bash

# Entry point file to populate the empty mounted directories.

bootstrapDir="/usr/share/nginx-bootstrap"

if [ -e "$bootstrapDir/new-flag" ]
then
  echo "Extracting files"
  gosu root tar xvf $bootstrapDir/etc-nginx.tar.gz -C /etc/nginx
  gosu root tar xvf $bootstrapDir/srv-http.tar.gz -C /srv/http
  gosu root rm $bootstrapDir/new-flag
fi

exec gosu www-data nginx -g daemon-off;