FROM ruby:3.0.1
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client && npm install --global yarn
WORKDIR /www
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
COPY . .
RUN rails assets:precompile
EXPOSE 3000
ENTRYPOINT [ "bundle", "exec", "puma", "-t", "5:5", "-b", "tcp://0.0.0.0:3000", "-e", "production" ]
