From ruby:2.5

COPY .  /usr/src/app/
WORKDIR /usr/src/app
RUN gem install bundler
RUN bundle install

CMD ["bundle", "exec", "graphml2json"]
