require 'octokit'

p ENV
client = Octokit::Client.new(access_token: ENV["INPUT_GITHUB_TOKEN"])
p client.user

