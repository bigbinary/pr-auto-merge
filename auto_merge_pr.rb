require 'octokit'
require_relative 'src/github_graphql'
require_relative 'src/pull_request'
require_relative 'src/enable_pr_auto_merge'

p ENV

client = Octokit::Client.new(access_token: ENV["INPUT_GITHUB_TOKEN"])

owner,repo = ENV["GITHUB_REPOSITORY"].split("/")
pr_number  = ENV["GITHUB_REF"].split("/")[2].to_i

# if status checks are still pending
pr_id = GithubGraphql::PullRequest.find(owner, repo, pr_number).id
GithubGraphql::EnablePRAutoMerge.mark! pr_id

# if status checks have already completed and is successs
if client.status(ENV["GITHUB_REPOSITORY"], ENV["GITHUB_HEAD_REF"])[:state] == "success"
  client.merge_pull_request(repo, pr_number)
end
