require 'octokit'

p ENV
client = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
p client.user

