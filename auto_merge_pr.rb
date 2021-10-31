require 'octokit'

p ENV
client = Octokit::Client.new(access_token: ENV["INPUT_GITHUB_TOKEN"])

repo      = ENV["GITHUB_REPOSITORY"]
pr_number = ENV["GITHUB_REF"].split("/")[2]

client.merge_pull_request(repo, pr_number)

