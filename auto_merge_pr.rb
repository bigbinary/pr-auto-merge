require 'octokit'

p ENV

client = Octokit::Client.new(access_token: ENV["INPUT_GITHUB_TOKEN"])

repo      = ENV["GITHUB_REPOSITORY"]
pr_number = ENV["GITHUB_REF"].split("/")[2]

if client.status(ENV["GITHUB_REPOSITORY"], ENV["GITHUB_HEAD_REF"])[:state] == "success"
  client.merge_pull_request(repo, pr_number)
end

