#!/bin/bash

# Entry point file to populate the empty mounted directories.

bootstrapDir="/usr/share/nginx-bootstrap"

if [ -e "$bootstrapDir/new-flag" ]
then
  echo "Extracting files"
  gosu nginx tar xvf $bootstrapDir/etc-nginx.tar.gz -C /etc/nginx
  gosu nginx tar xvf $bootstrapDir/srv-http.tar.gz -C /srv/http
  gosu nginx rm $bootstrapDir/new-flag
fi

exec gosu nginx nginx -g daemon-off;