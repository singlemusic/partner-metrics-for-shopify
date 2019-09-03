FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    curl

# for postgres
RUN apt-get install -y

ENV APP_HOME /metrics
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

ADD Gemfile* ${APP_HOME}/
RUN bundle install

ADD . $APP_HOME

CMD [ "foreman", "start" ]
