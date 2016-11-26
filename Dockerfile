FROM ubuntu:14.04
MAINTAINER dev@alex-web.ru

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /var/run/proftpd \
  && apt-get update \
  && apt-get install -f -y proftpd proftpd-mod-mysql

COPY templates/ /templates
COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
