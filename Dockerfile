FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends dnsmasq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create hosts file location
RUN mkdir -p /etc/kubernetes && \
    touch /etc/kubernetes/hosts

EXPOSE 5353/tcp 5353/udp

ENTRYPOINT ["dnsmasq"]
CMD ["--no-daemonize"]
