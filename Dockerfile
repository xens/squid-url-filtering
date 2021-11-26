FROM alpine:latest
LABEL maintainer="r.aviolat@gmail.com"

RUN apk add --no-cache squid

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128
USER squid
ENTRYPOINT ["squid","-NYCd","1","-f","/etc/squid/squid.conf"]

