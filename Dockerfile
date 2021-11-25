FROM debian:stable
LABEL maintainer="r.aviolat@gmail.com"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
 && apt-get install -y squid-openssl \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128
ENTRYPOINT ["/sbin/entrypoint.sh"]
