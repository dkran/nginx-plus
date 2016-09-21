# nginx dockerfile to expose volumes for certs, the main config (nginx.conf),
# and including all of a sites-available folder for virtual hosts.  This will suit my needs

FROM nginx

MAINTAINER Daryl Kranec <dkranec@gmail.com>

ENV DKRAN_NGX 0.1

CMD ["rm","-rf","/etc/nginx/conf.d"]

COPY data/nginx.conf /etc/nginx/nginx.conf

COPY data/http /srv

COPY data/sites-enabled /etc/nginx/

CMD ["rm","-rf","/user/share/nginx"]

CMD ["mkdir","/etc/nginx/certs"]

VOLUME ["/srv/http","/etc/nginx/nginx.conf","/etc/nginx/sites-enabled","/etc/nginx/certs"]


CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
EXPOSE 443