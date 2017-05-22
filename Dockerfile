FROM ruby:2.3-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH


ENV BUNDLE_GEMFILE=$INSTALL_PATH/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/box

COPY Gemfile Gemfile.lock ./

COPY . .

