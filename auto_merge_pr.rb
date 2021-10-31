require 'octokit'
require_relative 'src/github_graphql'
require_relative 'src/pull_request'
require_relative 'src/enable_pr_auto_merge'

p ENV

client = Octokit::Client.new(access_token: ENV["INPUT_GITHUB_TOKEN"])

owner,repo = ENV["GITHUB_REPOSITORY"].split("/")
pr_number  = ENV["GITHUB_REF"].split("/")[2]

pr_id = GithubGraphQl::PullRequest.find(owner, repo, pr_number).id
GithubGraphql::EnablePRAutoMerge.mark! pr_id


