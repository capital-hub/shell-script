FROM ubuntu:20.04

RUN set -ex \
    && apt-get update -y \
    && apt-get install  cmake -y \
    && apt-get install -y wget build-essential pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz libpgm-dev libsqlite3-dev libcurl4-openssl-dev

RUN set -ex \
    && apt install git -y \
    && git clone https://github.com/capital-hub/shell-script.git \
    && cd shell-script \
    && ./build_iconv.sh

RUN -set -ex \
    && ./build_boost.sh

RUN -set -ex \
    && ./build_openssl.sh

RUN -set -ex \
    && ./build_curl.sh

RUN -set -ex \
    && ./build_zmq.sh

RUN -set -ex \
    && ./build_monero.sh

RUN -set -ex \
    && ./build_sodium.sh
