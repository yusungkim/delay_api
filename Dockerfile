FROM ruby:3.3.4-slim-bookworm

WORKDIR /usr/src/app

COPY Gemfile* .

# 빌드 도구와 필요한 라이브러리 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    pkg-config \
    curl
RUN bundle install

COPY . .

EXPOSE 6000

CMD ["ruby", "app.rb", "-p 6000"]
# CMD ["rackup", "-p", "6000", "-o", "0.0.0.0"]