FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    unbound \
    dns-root-data \
    bind9-dnsutils \
    tcpdump \
    tshark \
    curl \
    iproute2 \
    iputils-ping \
    python3 \
    procps \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/unbound/unbound.conf.d/*

COPY unbound.conf /etc/unbound/unbound.conf
COPY entrypoint-resolver.sh /entrypoint-resolver.sh
COPY entrypoint-client.sh /entrypoint-client.sh
RUN chmod +x /entrypoint-resolver.sh /entrypoint-client.sh

WORKDIR /captures
CMD ["sleep", "infinity"]
