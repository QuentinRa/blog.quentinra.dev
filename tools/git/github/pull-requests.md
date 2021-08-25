# Pull request

[Go back](../index.md#advanced-github-concepts)

In most cases, before a merge, we need to ask if we can merge. We do that by creating a `Pull request` for our branch, then wait for the reviewers' approvals. If everything is okay, you can merge it into master/main. Usually, the programmer setup "checks" that must be verified before merging a pull request. Here is the official [GitHub tutorial](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

You can define the format of a pull request by creating a template file `.github/PULL_REQUEST_TEMPLATE/pull_request_template.md`. Inside, simply write the code that will be used to prefill a pull request's message.