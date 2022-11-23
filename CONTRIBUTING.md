# How to contribute

First, you can edit a course directly on the website. You will have to solve a captcha, but this is easy.

You can also [fork the repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository). Then simply edit the file(s) you wanted to, and [submit a pull request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork).

You should check this guide about the [syntax you may use in our files](https://memorize.be/syntax).

---

## Commits

You should name your commits as follows `emoji: description`.

* keep the description short (you may add a long description after two newlines)
* do not make a lot of changes per commit
* emoji is one of these
  * 😎: added a section/content to a course
  * 🤓: improving content/rewording
  * 😱: fixing dead links
  * 🧐: fixing mistakes/fixing typos
  * 😏: improving the code (replace HTML by Markdown, or Markdown by HTML, adding/removing spaces, splitting files, etc.)
  * 🚀: adding/proposing feature(s) or content (todo)
  * 🙄: removing/moving content temporarily
  * 🥲: removing content

---

## How to contribute

If you want to add a new course, add an entry in `.summary`, in the JSON of your course category.

```json
{
  "tag": "course-name",
  "name": "Name",
  "desc": "...",
  "icon": "null or a boostrap icon like <i class=\"bi bi-sim\"></i>"
}
```

If you choose `info`, then create in `/info/` a folder named `course-name`. Inside, create a file `index.md` that will be used as the entry point for your course. You may check others' files if you're wondering how you should write yours.

If you want to edit a course, simply edit the `.md` file.