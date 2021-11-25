#!/bin/bash

/usr/lib/squid/security_file_certgen -c -s /var/spool/squid/ssl_db -M 4MB
exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
