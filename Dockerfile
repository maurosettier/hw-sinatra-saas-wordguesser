FROM ruby:2.6.6-alpine3.10
WORKDIR /app
COPY . .
#COPY Gemfile Gemfile.lock ./

RUN apk add build-base
RUN gem install bundler
RUN bundle install



# Application dependencies


# Serve the application
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true
CMD rackup -o 0.0.0.0
EXPOSE 9292
#dckr_pat_mZDtjgVyuff2fZK5JsQMREGLm4c - Dockerhub key
name: Check Test

on: 
  pull_request:
    branches: [ main ]

jobs:
  test:
      steps:
        - uses: actions/checkout@v3
        - uses: ruby/setup-ruby@ec02537da5712d66d4d50a0f33b7eb52773b5ed1
          with:
              ruby-version: '2.6' # Not needed with a .ruby-version file
        - run: bundle install
        - run: bundle exec rake