# Remote Git Server features 🏹

<div class="row row-cols-md-2 mt-4"><div>

#### 🏹 Issues

When someone finds a bug/problem with the project, they will usually create an issue. [See GitHub tutorial](https://guides.github.com/features/issues/).

On GitHub/GitLab/???, you can create issue templates.

> See <kbd>Options > Features > Issues</kbd> on GitHub.<br>
> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

<br>

#### 🏹 Wiki

The wiki is used by developers to write some primitive documentation that is stored "near" your project. You can add images inside, that are stored in your repository <small>(try with/without a leading `/`)</small>.

You can clone your wiki with `.wiki.git` instead of `.git`!

<br>

#### 🏹 Forks

Usually, repositories do not allow everyone to contribute. Instead, they can fork the repository, which will create a copy that they own. They will work on it, and they will be able to create a Pull Request to the original repository, that may be merged by the original repository's maintainers. [See GitHub tutorial](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
</div><div>

#### 🏹 Pull Requests (PR) / Merge requests

In most cases, developers establish a formal procedure to merge branches into main. Anyone will have to create a Pull Request asking if they can merge. Then, reviewers will check the code, and allow master/main to be modified. [See GitHub tutorial](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

On GitHub/GitLab/..., you can create pull request templates.

> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

<br>

#### 🏹 References

Every issue/pull request has an ID, for instance, `#1`. You can reference this ID anywhere else, for instance, inside a commit! On GitHub, on the issue/pull request page, we will see the referencing commit SHA1.

> On GitHub, you can also reference a user with `@username`.

</div></div>


<hr class="sep-both">

## ✍️ Less commonly used features ✍️

<div class="row row-cols-md-2 mt-4"><div>

#### ✍️ Co-authors

*Available at least on: GitHub*

If you know someone else's email, then you can include them as the author of a commit. Note that the one creating the commit (you) will be marked as a committer, so there will always be at least two names unless you directly edit the GIT configuration 🚓.

```bash
git commit -m "xxx

Co-authored-by: name <name@example.com>"
```

<br>

#### ✍ Reference code in issues

*Available at least on: GitHub*

There is a nice way of referencing code from the same repository inside an issue/a pull request. See [GitHub tutorial](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-code).

* Open the target file
* Click on the line number of the line you want to reference
* Hold Shift and press another line to select an interval
* Click on "..."
* Copy permalink
* Then simply paste the permalink inside an issue/a pull request

> It won't always work. In such cases, simply click on "..." on a file, get the permalink, and append to it `#LX` <small>(line X)</small> or `#LX-LY` <small>(line X to line Y)</small>.

#### ✍️ Pages

*Available at least on: GitHub*

GitHub allows us to create a repository called after our username or an organization name. The [tutorial is here](https://pages.github.com/). The URL to access it is: `https://username.github.io/`.

See [Jekyll](https://jekyllrb.com/docs/deployment/automated/) or [Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-github/) tutorials too.
</div><div>

#### ✍️ CODEOWNERS

*Available at least on: GitHub, GitLab*

This file is a dictionary with patterns associated with GitHub/... usernames. Repositories can be configured so that if a file owned by a code owner is modified, then inside the Pull Request, the CodeOwner will be asked for a review. See [GitHub tutorial](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).

```
*       @QuentinRa
```

<br>

#### ✍️ Git attributes

*Available at least on: GitHub*

While the file `.gitattribute` is not exclusive to GitHub/..., it is used by GitHub [linguist](https://github.com/github/linguist/tree/master/docs) if we want to edit the rules that GitHub uses to determine the languages used by our project.

```
# Ex: add Markdown files in the language list
*.md linguist-documentation=false linguist-detectable=true
```

<br>

#### ✍️ Projects

*Available at least on: GitHub*

This is a feature that includes Agile-Scrum Scrum boards. It's actually a bit more complex and less convenient. You can create **tasks**, but you can't do much with them. Once you convert them to **issues**, you can assign people to them along with tags. They are useful for tracking, sorting **issues**, and keeping track of **milestones**.

👉 GitLab has something similar called [Issue boards](https://docs.gitlab.com/ee/user/project/issue_board.html).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [CITATION files](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files) (👻)
* Templates ([git-repository-template](https://github.com/misitebao/template-git-repository) / [opensource-template](https://github.com/EmbarkStudios/opensource-template))
* Digital Object Identifiers (see [GitHub article](https://guides.github.com/activities/citable-code/))
* GitHub Discussions
* [.gitlab](https://docs.gitlab.com/ee/development/features_inside_dot_gitlab.html)
</div><div>

* [Introduction to GitHub](https://github.com/skills/introduction-to-github) + [Git/Github Milestones](https://github.com/omundy/learn-git-milestones)
* [GitHub Cheatsheet](https://github.com/tiimgreen/github-cheat-sheet)
* [Branch protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule)
* [Documentation on GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
* [Code Review](https://github.com/ryanmcdermott/code-review-tips)
* [GitHub for Collaboration](https://mozillascience.github.io/working-open-workshop/github_for_collaboration/)
</div></div>