# nginx dockerfile to expose volumes for certs, the main config (nginx.conf),
# and including all of a sites-available folder for virtual hosts.  This will suit my needs

FROM nginx

MAINTAINER Daryl Kranec <dkranec@gmail.com>

ENV GOSU_VERSION 1.7
RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true \
	&& apt-get purge -y --auto-remove ca-certificates wget

CMD ["rm","-rf","/etc/nginx/conf.d"]

CMD ["mkdir", "/usr/share/nginx-bootstrap"]

COPY data/etc-nginx.tar.gz /usr/share/nginx-bootstrap/

COPY data/srv-http.tar.gz /usr/share/nginx-bootstrap/

COPY data/new-flag /usr/share/nginx-bootstrap/

COPY data/entrypoint.sh /

CMD ["chmod","700","/entrypoint.shdo"]
# These commands will be phased out by the archive files I will extract on first run.

#COPY data/nginx.conf /etc/nginx/nginx.conf
#COPY data/http /srv
#COPY data/sites-enabled /etc/nginx/
#CMD ["mkdir","/etc/nginx/certs"]

CMD ["rm","-rf","/usr/share/nginx"]

VOLUME ["/srv/http","/etc/nginx/","/var/log/nginx/"]

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80
EXPOSE 443
