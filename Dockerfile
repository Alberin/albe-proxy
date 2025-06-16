FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y squid && \
    mkdir -p /var/log/squid && \
    touch /var/log/squid/access.log

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128

CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]
