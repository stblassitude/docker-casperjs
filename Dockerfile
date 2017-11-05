FROM debian:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        bzip2 \
        fontconfig \
        gnupg \
        libfontconfig \
        lsb-release \
        python \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN set -x \
  && curl -fLs https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | \
    tar xjf - -C /usr --strip-components=1 phantomjs-2.1.1-linux-x86_64/bin/phantomjs

RUN set -x \
  && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
  && apt-get install -y --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN set -x \
  && npm install -g casperjs \
  && echo /usr/lib/node_modules/casperjs/bin/casperjs selftest

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/usr/bin/casperjs"]

LABEL version="1.0.0" \
  maintainer="stb@lassitu.de" \
  phantomjs.version="2.1.1" \
  casperjs.version="1.1.4"
