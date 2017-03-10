FROM ubuntu:16.04
MAINTAINER dev@alex-web.ru

RUN mkdir -p /var/run/proftpd \
  && apt-get update \
  && apt-get install -f -y proftpd proftpd-mod-mysql openssl gettext-base

EXPOSE 20 21
CMD ["/entrypoint.sh"]

COPY entrypoint.sh /
COPY configs/ /templates/
