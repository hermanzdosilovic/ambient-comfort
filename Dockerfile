FROM ruby:2.4.1

RUN apt-get update && apt-get install -y \
      nodejs-legacy \
      npm

RUN gem install \
      rails:5.1.1 \
      bundler

WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
RUN bundle

EXPOSE 3000
ENV RAILS_ENV production

COPY . /usr/src/app
RUN bundle && rails assets:precompile
CMD rm -f tmp/pids/server.pid && \
    rails db:create db:migrate && \
    rails s -b 0.0.0.0
