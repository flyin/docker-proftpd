FROM ubuntu:14.04
MAINTAINER dev@alex-web.ru

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /var/run/proftpd \
  && apt-get update \
  && apt-get install -f -y proftpd proftpd-mod-pgsql


COPY proftpd.conf /etc/proftpd
COPY modules.conf /etc/proftpd
COPY sql.conf /etc/proftpd
COPY entrypoint.sh /usr/local/bin/

EXPOSE 20-21
EXPOSE 50000-55000

CMD ["entrypoint.sh"]
