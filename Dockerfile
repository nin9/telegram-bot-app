FROM ruby:2.5.1-alpine AS builder

ENV BUNDLER_VERSION=2.0.2
RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update build-base \
      linux-headers sqlite-dev tzdata
WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.0.2
RUN bundle check || bundle install
COPY . ./
###################################################
FROM ruby:2.5.1-alpine

WORKDIR /app

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update build-base \
      linux-headers sqlite-dev nodejs tzdata

ENV BUNDLER_VERSION=2.0.2
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app /app
