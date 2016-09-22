# nginx dockerfile to expose volumes for certs, the main config (nginx.conf),
# and including all of a sites-available folder for virtual hosts.  This will suit my needs

FROM nginx

MAINTAINER Daryl Kranec <dkranec@gmail.com>

ENV DKRAN_NGX 0.1

CMD ["rm","-rf","/etc/nginx/conf.d"]

# These commands will be phased out by the archive files I will extract on first run.

#COPY data/nginx.conf /etc/nginx/nginx.conf
#COPY data/http /srv
#COPY data/sites-enabled /etc/nginx/
#CMD ["mkdir","/etc/nginx/certs"]

CMD ["rm","-rf","/user/share/nginx"]

VOLUME ["/srv/http","/etc/nginx/","/var/log/nginx/"]


CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
EXPOSE 443
