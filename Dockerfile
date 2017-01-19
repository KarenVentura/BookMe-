FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy postgresql-client vim
RUN npm install -g phantomjs

RUN mkdir /bookme

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /bookme
WORKDIR /bookme
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
