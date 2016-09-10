FROM ruby:2.2

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs

# Prepare app
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Expose and setup start command
EXPOSE 3000
CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0"]
