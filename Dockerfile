FROM ubuntu:14.04
MAINTAINER dev@alex-web.ru

ENV DEBIAN_FRONTEND noninteractive

COPY configs/modules.template /templates/
COPY configs/proftpd.template /templates/
COPY configs/sql.template /templates/

RUN mkdir -p /var/run/proftpd \
  && apt-get update \
  && apt-get install -f -y proftpd proftpd-mod-mysql gettext-base \
  && ln -sf /dev/stdout /var/log/proftpd/sql.log \
  && ln -sf /dev/stdout /var/log/proftpd/wrap2.log \
  && ln -sf /dev/stdout /var/log/proftpd/xferlog \
  && ln -sf /dev/stdout /var/log/proftpd/proftpd.log \
  && ln -sf /dev/stdout /var/log/proftpd/controls.log

EXPOSE 20 21
COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
