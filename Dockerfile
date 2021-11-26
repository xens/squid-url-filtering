FROM alpine:latest
LABEL maintainer="r.aviolat@gmail.com"

RUN apk add --no-cache \
        squid

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128
ENTRYPOINT ["/sbin/entrypoint.sh"]
