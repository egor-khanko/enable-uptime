FROM ruby:3.1.2

ARG BASE_DIR=/enable-uptime

RUN apt-get update -qq && apt-get install -y libffi-dev libpq-dev

ENV RAILS_ENV=production

WORKDIR $BASE_DIR
COPY Gemfile ${BASE_DIR}/Gemfile
COPY Gemfile.lock ${BASE_DIR}/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh", "/enable-uptime"]
EXPOSE 3000

COPY . $BASE_DIR

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
