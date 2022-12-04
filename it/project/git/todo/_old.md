Note: I'm putting a lot of files in a folder `.github`, because it makes my root folder cleaner, but you can put the files directly in your root folder (😐). You can also replace UPPER_CASE names with lowercase names. You can use `docs` instead of `.github`.

As you could see with [Memorize](https://github.com/lgs-games/memorize), the repository's language is Markdown, which is unusual as Markdown isn't considered to be a programming language. You do that by tweaking the file [.gitattributes](https://github.com/lgs-games/memorize/blob/master/.gitattributes) while following [linguist documentation](https://github.com/github/linguist/tree/master/docs).

---

https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-code

# Good practices

https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes

As a student, you may enjoy the benefits of the [GitHub student pack](https://education.github.com/pack).

**Atomic commits**: one commit means one change, such as adding one functionality. Do not make hundreds of changes in one commit, making it hard to find what you did. You can select the lines of a file you want to commit using `git add -p file`.

**Short-Long description**: you should make a short and a long description of your commits, like that

```bash
git commit -m "a short inline description

A long description, where I further describe
what I did
"
```

**README.md**: put a README in all of your projects, that is the start of a great adventure.

**LICENSE**: you may also put a LICENSE even if you don't want to put restrictions on your code, to protect yourself from complaints (MIT LICENSE is good for that, or The Unlicense). You should [pick your license here](https://choosealicense.com/).

**.gitignore**: you may not want to commit some files like high-churn ones or big files... Create a file called "gitignore" is a good practice, you can

* [generate a gitignore here](https://www.toptal.com/developers/gitignore).
* [use a template here](https://github.com/github/gitignore)