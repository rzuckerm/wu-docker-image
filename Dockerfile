FROM rust:1.71.1-alpine3.18

COPY WU_* /tmp/
RUN apk add openssl-dev zlib-dev musl-dev lua5.4 cmake make && \
    ln -s /usr/bin/lua5.4 /usr/bin/lua && \
    cargo install wu@$(cat /tmp/WU_VERSION) && \
    mv /usr/local/cargo/bin/wu /usr/local/bin/wu && \
    rm -rf /usr/local/cargo && \
    apk del cmake make
