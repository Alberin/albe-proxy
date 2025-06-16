FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y build-essential wget && \
    wget https://github.com/z3APA3A/3proxy/archive/refs/tags/0.9.4.tar.gz && \
    tar -xvzf 0.9.4.tar.gz && \
    cd 3proxy-0.9.4 && \
    make -f Makefile.Linux && \
    mkdir -p /etc/3proxy && \
    cp src/3proxy /usr/bin/3proxy && \
    cd .. && rm -rf 3proxy* && \
    apt-get remove -y build-essential wget && \
    apt-get autoremove -y && \
    apt-get clean

COPY 3proxy.cfg /etc/3proxy/3proxy.cfg

EXPOSE 3128 1080

ENTRYPOINT ["3proxy", "/etc/3proxy/3proxy.cfg"]
