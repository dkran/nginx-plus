# nginx dockerfile to expose volumes for certs, the main config (nginx.conf),
# and including all of a sites-available folder for virtual hosts.  This will suit my needs

FROM nginx

MAINTAINER Daryl Kranec <dkranec@gmail.com>

COPY data/nginx.conf /etc/nginx/nginx.conf

COPY data/http /srv

COPY data/sites-enabled /srv/

CMD ["nginx"]

EXPOSE 80
EXPOSE 443