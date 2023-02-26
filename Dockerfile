FROM node:16.0-alpine as node

ENV YARN_VERSION 1.22.15

RUN apk add --no-cache bash curl && \
    curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version $YARN_VERSION

FROM ruby:3.1.0-alpine

ENV TZ Asia/Tokyo
RUN mkdir /app

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /opt/yarn-* /opt/yarn
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn
RUN apk add --no-cache git build-base libxml2-dev libxslt-dev mysql-dev mysql-client tzdata bash less graphviz && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apk --update add imagemagick

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

# bundle install
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

ENV BUNDLER_VERSION 2.3.4

RUN gem install --no-document bundler -v $BUNDLER_VERSION
RUN bundle config --global build.nokogiri --use-system-libraries
RUN bundle config --global jobs 4
RUN bundle install

ADD . $APP_ROOT

EXPOSE  3000
