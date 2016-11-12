FROM ruby:2.1
RUN apt-get update -qq && apt-get install -y build-essential

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

RUN apt-get install -y mongodb

COPY SmartNetwork/Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV app /app
RUN mkdir $app
WORKDIR $app
ADD SmartNetwork $app

EXPOSE 3000

CMD bundle exec rails s -p 3000 -b '0.0.0.0'