FROM debian:stretch

MAINTAINER me

RUN apt-get update && \
    apt-get install -y ca-certificates wget netbase make perl --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget -O- https://www.dy.fi/files/dyfi-update-pl-1.2.0.tar.gz | tar xfz - 
COPY dyfi-update.conf /tmp/
CMD /tmp/dyfi-update-pl-1.2.0/dyfi-update.pl -f /tmp/dyfi-update.conf
