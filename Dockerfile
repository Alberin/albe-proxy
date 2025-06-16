FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Installer les dépendances
RUN apt-get update && \
    apt-get install -y wget gcc make build-essential curl && \
    wget https://github.com/z3APA3A/3proxy/archive/refs/tags/0.9.4.tar.gz && \
    tar -xvzf 0.9.4.tar.gz && \
    cd 3proxy-0.9.4 && \
    make -f Makefile.Linux && \
    cp src/3proxy /usr/bin/3proxy && \
    cd .. && rm -rf 3proxy* && \
    mkdir -p /etc/3proxy

# Copier la config
COPY 3proxy.cfg /etc/3proxy/3proxy.cfg

# Exposer les ports du proxy
EXPOSE 3128 1080

# Lancer 3proxy avec la configuration
CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]
