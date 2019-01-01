From ruby:2.5

COPY *gemspec /usr/src/app/
COPY Gemfile /usr/src/app/
COPY lib/graphml2json/version.rb /usr/src/app/lib/graphml2json/
COPY bin /usr/src/app/
COPY bin/* /usr/src/app/bin/
 

WORKDIR /usr/src/app
RUN bin/setup 

COPY . /usr/src/app/

CMD ["bundle", "exec", "rspec", "--color", "--format", "doc"]
