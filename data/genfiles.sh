#!/bin/bash

chown -R 1010:1010 *
chmod -R 775 *
if [ -e "./etc-nginx.tar.gz" ]
then
  echo "Deleting etc-nginx.tar.gz"
  rm etc-nginx.tar.gz
fi
cd etc-nginx
tar -c * | gzip -f > ../etc-nginx.tar.gz
if [ -e "$http.tar.gz" ]
then
  echo "Deleting http.tar.gz"
  rm http.tar.gz
fi
cd http
tar -c * | gzip -f > ../http.tar.gz
cd ..
chown -R 1010:1010 *
chmod -R 775 *
