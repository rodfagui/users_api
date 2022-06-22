FROM ruby:2.6.9

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /usr/src/app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN gem install bundler:2.3.5
RUN bundle install

COPY . .

# Add a script to be executed every time the container starts.
COPY ./scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]