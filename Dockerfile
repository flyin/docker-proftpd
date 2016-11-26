FROM ubuntu:14.04
MAINTAINER dev@alex-web.ru

ENV DEBIAN_FRONTEND noninteractive

COPY configs/modules.template /templates/
COPY configs/proftpd.template /templates/
COPY configs/sql.template /templates/

RUN mkdir -p /var/run/proftpd \
  && apt-get update \
  && apt-get install -f -y proftpd proftpd-mod-mysql gettext-base

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
