<div align="center">
<br>

![icon](.github/icon64.png)

<h1>Memorize V5</h1>

`Memorize` was made for students to create courses to help
other students. We are gathering notes, exercises, links, etc.
that helped us understand what we are learning in school.

Since we are still learning, we could have made mistakes. 
Please kindly correct or report them. Thanks!

Provided by `Legendary Games Studio`,
[memorize@lgs-games.com](mailto:memorize@lgs-games.com).
</div>

<div align="center">

![GitHub](https://img.shields.io/github/license/lgs-games/memorize)
![GitHub pull requests](https://img.shields.io/github/issues-pr-closed/lgs-games/memorize?color=%23a0)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/lgs-games/memorize)
![Custom badge](https://img.shields.io/endpoint?label=views&logoColor=success&url=https%3A%2F%2Fmemorize.lgs-games.com%2Fen%2Fcounter)
</div>

## How to contribute

If you want to add a new course, add an entry in
``.summary``, in the JSON of your course category.

```json
{
  "tag": "course-name",
  "name": "Name",
  "desc": "...",
  "icon": "null or a boostrap icon like <i class=\"bi bi-sim\"></i>"
}
```

If you choose ``info``,
then create in ``/info/`` a folder named `course-name`.
Inside, create a file ``index.md`` that will be used as the entry
point for your course.
You may check others' files if you wondering
how you should write yours.

If you want to edit a course, simply edit the ``.md``
file.

## TODO List 

Last updated: 2021-08-06

**Website tasks**

* [ ] add go back to #titleID instead of #linkID
* [ ] edit: show formulas
* [ ] edit: open link
* [ ] set title/description from JS
* [ ] add "create link" kind of button
* [ ] replacing links with [here] by something better

**Next content**

* [ ] Complete Statistics course
* [ ] Matrix course
* [ ] First-order logic course
* [ ] General mathematical knowledge course
* [ ] Complete Java course (notes, javafx)
* [ ] Cyber security course
* [ ] Complete Bootstrap course
* [ ] Complete C course
* [ ] Complete Linux course
* [ ] Complete Network course
* [ ] Complete SQL course

## Notes

The website's backgrounds were made
by [kronbits](https://kronbits.itch.io/backgrounds).
If you want to add/remove one, feel free to submit
a request using issues.

If you are enjoying the website, please don't forget
to star the repository on GitHub to support us.

We backed references in another
repository [here](https://github.com/memorize-code/memorize-references).