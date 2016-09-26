#!/bin/bash

chown -R 1010:1010 *
chmod -R 775 *
f [ -e "./etc-nginx.tar.gz" ]
then
  rm etc-nginx.tar.gz
fi
cd etc-nginx
tar -c * | gzip -f > ../etc-nginx.tar.gz
f [ -e "$http.tar.gz" ]
then
  rm http.tar.gz
fi
cd http
tar -c * | gzip -f > ../http.tar.gz
cd ..
chown -R 1010:1010 *
chmod -R 775 *
