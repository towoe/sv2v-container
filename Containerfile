FROM ubuntu:18.04 AS build

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    git

WORKDIR /build
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN git clone https://github.com/zachjs/sv2v.git
WORKDIR /build/sv2v
RUN make


FROM ubuntu:18.04 AS dev

ENV DEBIAN_FRONTEND noninteractive

COPY --from=build /build/sv2v/bin/sv2v /usr/bin/

COPY --from=towoe/yosys /usr/local/ /usr/local/

RUN apt-get update \
    && apt-get install -y \
    libffi-dev \
    libtcl8.6 \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
