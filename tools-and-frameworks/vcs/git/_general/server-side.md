# Server-side features

<hr class="sep-both">

## 🔑 SSH/GPG Keys 🔑

<div class="row row-cols-md-2"><div>
</div><div>

GPG keys are a bit different. They are used to sign your commits, and prove that you were the one that committed. It's possible for someone that has your email to usurp your identify after all.

* [GitHub tutorial](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)

<details class="details-e">
<summary>Increase the delay between passphrase prompts</summary>

You will need to **write a passphrase almost every time you are committing**, unless you provided your passphrase in the last **10 minutes**. You can increase the time your passphrase is cached

```bash
# note the location of the file
# this is usually ~/.gnupg/gpg-agent.conf
$ gpg-agent --gpgconf-list | head -n1
# create the file, or edit it
# cached 8 hours
$ echo "max-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
$ echo "default-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
# reload
$ gpg-connect-agent reloadagent /bye
```
</details>

On GitHub, verified commits are tagged with a tag "verified" next to them:

<div class="text-center">

![Verified commit](_images/gpg.png)
</div>
</div></div>

<hr class="sep-both">

## 🏹 Server-side features 🏹

<div class="row row-cols-md-2 mt-4"><div>

#### 🏹 Issues

When someone found a bug/problem with the project, they will usually create an issue. [See GitHub tutorial](https://guides.github.com/features/issues/).

On GitHub/GitLab/???, you can create issue templates.

> See <kbd>Options > Features > Issues</kbd> on GitHub.<br>
> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

<br>

#### 🏹 Wiki

The wiki is used by developers to write some primitive documentation that is store "near" your project. You can add images inside, that are stored in your repository <small>(try with/without a leading `/`)</small>.

You can clone your wiki with `.wiki.git` instead of `.git`!

<br>

#### 🏹 Forks

Usually, repositories do not allow everyone to contribute. Instead, they can fork the repository, which will create a copy that they own. They will work on it, and they will be able to create a Pull Request to the original repository, that may be merged by the original repository's maintainers. [See GitHub tutorial](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
</div><div>

#### 🏹 Pull Requests (PR) / Merge requests

In most cases, developers establish a formal procedure to merge branches into main. Anyone will have to create a Pull Request asking if they can merge. Then, reviewers will check the code, and allow master/main to be modified. [See GitHub tutorial](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

On GitHub/???, you can create pull requests templates.

> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

<br>

#### 🏹 References

I'm still not sure if this is only available on GitHub or not, but every issue/pull request as an Id, for instance, `#1`. You can reference this Id anywhere else, for instance, inside a commit! At least on GitHub, on the issue/Pull request page, we will see the referencing commit SHA1.

> On GitHub, you can also reference a user with `@username`.

</div></div>


<hr class="sep-both">

## ✍️ GitHub exclusive features ✍️

<div class="row row-cols-md-2 mt-4"><div>

<br>

#### ✍️Co-authors

If you know someone else email, then you can include them as author of a commit. Note that the one creating the commit (you) will be marked as commiter, so there will always be at least two names, unless you directly edit the GIT configuration 🚓.

```bash
git commit -m "xxx

Co-authored-by: name <name@example.com>"
```

<br>

#### ✍ Reference code in issues

There is a nice way of referencing code from the same repository inside an issue/a pull request. See [GitHub tutorial](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-code).

* Open the target file
* Click on the line number of the line you want to reference
* Hold Shift and press another line to select an interval
* Click on "..."
* Copy permalink
* Then simply paste the permalink inside an issue/a pull request

> It won't always work. In such cases, simply click on "..." on a file, get the permalink, and append to it `#LX` <small>(line X)</small> or `#LX-LY` <small>(line X to line Y)</small>.

</div><div>

#### ✍️CODEOWNERS

This file is a dictionary with patterns associated with GitHub usernames. Repositories can be configured so that if a file owned by a codeowner is modified, then inside the Pull Request, the CodeOwner will be asked for a review. See [GitHub tutorial](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).

```
*       @QuentinRa
```

<br>

#### ✍️Git attributes

While the file `.gitattribute` is not exclusive to GitHub, it is used by GitHub [linguist](https://github.com/github/linguist/tree/master/docs) if we want to edit the rules that GitHub uses to determine languages used by our project.

```
# Ex: add Markdown files in the language list
*.md linguist-documentation=false linguist-detectable=true
```

<br>

#### ✍️Projects

This is a feature that includes Agile-Scrum Scrum boards. It's actually a bit more complex and less convenient. You can create **tasks**, but you can't do much with them. Once you convert them to **issues**, you can assign people to them along with tags. They are useful to track/sort **issues** and keep track of **milestones**.

<br>

#### ✍️Random

List of stuff that I have yet to test out.

* [CITATION files](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files) (👻)
* **Templates**: see [git-repository-template](https://github.com/misitebao/template-git-repository) / [opensource-template](https://github.com/EmbarkStudios/opensource-template)
</div></div>

<hr class="sep-both">

## 🎉 Fancy GitHub 🎉

<div class="row row-cols-md-2 mt-4"><div>

General

* [Skyline with your contributions](https://skyline.github.com/)

* [GitHub User Profile](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme)

* [GitHub Organization Profile](https://github.blog/changelog/2021-09-14-readmes-for-organization-profiles/)

* [GitHub Profile Achievements](https://github.com/Schweinepriester/github-profile-achievements)

</div><div>

Cards (usually added on a profile/...)

* [GitHub Stats Card](https://github.com/anuraghazra/github-readme-stats)
    * User stats
    * Repository Card
    * Most used languages
    * WakaTime
* [GitHub Profile Streak](https://github-readme-streak-stats.herokuapp.com/demo/)
* [GitHub Profile Trophy](https://github.com/ryo-ma/github-profile-trophy)
* [metrics](https://github.com/lowlighter/metrics) (really nice cards, see [omBratteng profile](https://github.com/omBratteng/omBratteng))
* [Jokes' Cards](https://readme-jokes.vercel.app/api)
* Profile View: [antonkomarev](https://github.com/antonkomarev/github-profile-views-counter) or [arturssmirnovs](https://github.com/arturssmirnovs/github-profile-views-counter)
</div></div>