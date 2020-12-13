FROM debian:stretch

MAINTAINER me

RUN apt-get update && \
    apt-get install -y ca-certificates wget netbase make perl --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget -O/tmp/dyfi.tar.gz https://www.dy.fi/files/dyfi-update-pl-1.2.0.tar.gz 
RUN [ "297aaf3f0056bc7d850a4ff2c9195177647bbad8ff10d03130315fb85111b1db  /tmp/dyfi.tar.gz" = "$(sha256sum /tmp/dyfi.tar.gz)" ]
RUN tar xfz /tmp/dyfi.tar.gz
CMD /tmp/dyfi-update-pl-1.2.0/dyfi-update.pl -f /etc/dyfi-update.conf
