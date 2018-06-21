FROM ruby:2.5.1
MAINTAINER Shogo Ishikura

ENV PROJECT_NAME luida
ENV APP_ROOT /usr/src/$PROJECT_NAME

WORKDIR $APP_ROOT
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
 apt-get update && \
 apt-get install -y nodejs mysql-client postgresql-client sqlite3 --no-install-recommends

RUN \
 echo 'gem: --no-document' >> /etc/gemrc && \
 chmod uog+r /etc/gemrc && \
 bundle config --global build.nokogiri --use-system-libraries && \
 bundle config --global jobs 4 && \
 bundle install

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]
