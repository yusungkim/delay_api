FROM ruby:3.2

WORKDIR /usr/src/app

COPY Gemfile* .

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["ruby", "app.rb", "-p 3000"]