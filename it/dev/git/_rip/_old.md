# Version-control using Git

* General
  * [Wikis](wiki.md): write documentation
  * [Actions](actions.md): continuous integration (**ci**)
    * [Heroku](notes/heroku.md): preconfigured continuous integration and deployment
    * [External websites for reviews](notes/tools.md): a bunch of tools such as tools to get automated feedback on your code
    * [Dependabot](dependabot.md): get pull requests to update your dependencies when new versions are available
  * [Pull requests (PR)](pull-requests.md): ask before merging
  * [Issues](issues.md): got a question? Report a bug?
  * [Pages](pages.md): host your website on GitHub
  * [Project board](project.md): you can have your scrum board directly on GitHub
  * [Discussions](https://docs.github.com/en/discussions): you can allow discussions on GitHub
  * [Fork](fork.md): you want to submit a pull request on a repository, but you can't create a branch (nor commit)
* Special
  * [Referencing code in PR/issues](ref-code.md): reference a line or a block of code in a PR or an issue
* Commits
  * [Multiples authors](notes/multiples.md): add multiples authors to a commit
  * [Referencing ...](notes/reference.md): reference a user, an issue, or a pull request

Note: I'm putting a lot of files in a folder `.github`, because it makes my root folder cleaner, but you can put the files directly in your root folder (😐). You can also replace UPPER_CASE names with lowercase names. You can use `docs` instead of `.github`.

* As you could see with [Memorize](https://github.com/lgs-games/memorize), the repository's language is Markdown, which is unusual as Markdown isn't considered to be a programming language. You do that by tweaking the file [.gitattributes](https://github.com/lgs-games/memorize/blob/master/.gitattributes) while following [linguist documentation](https://github.com/github/linguist/tree/master/docs).