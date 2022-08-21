FROM debian
LABEL version="23.0"

COPY rootfs /
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && mkdir -p /opt/bitcoin \
    && curl -L https://bitcoincore.org/bin/bitcoin-core-23.0/bitcoin-23.0-x86_64-linux-gnu.tar.gz \
        | tar -xzvC /opt/bitcoin --strip-components 1

EXPOSE 8332
VOLUME [ "/data" ]

ENTRYPOINT ["/entrypoint.sh"]
CMD [ "/opt/bitcoin/bin/bitcoind", "-datadir=/data" ]