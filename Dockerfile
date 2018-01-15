FROM ruby:alpine

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile .
COPY nib-crypt.gemspec .
COPY lib/nib/crypt/version.rb ./lib/nib/crypt/version.rb

RUN \
  apk add --no-cache build-base git openssh ruby-dev && \
  gem install bundler && \
  bundle install -j5 && \
  apk del build-base ruby-dev

COPY . /usr/src/app
