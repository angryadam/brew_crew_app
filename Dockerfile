FROM ruby:2.7.2

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash \
     && apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* \
     && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
     && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
     && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/* \
     && apt-get update && apt-get install -y vim nano


RUN mkdir /project
WORKDIR /project
COPY . /project

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
