FROM rubylang/ruby:2.7.2-bionic

RUN gem install octokit

WORKDIR /app
COPY . .

CMD ["ruby", "/app/auto_merge_pr.rb"]
