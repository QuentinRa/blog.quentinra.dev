<div align="center">
<br>

![icon](.github/icon64.png)

<h1>Memorize</h1>

``Memorize`` was made for students to create courses to help 
others sail easier in the courses they struggled with.

Since we are still learning, we could have made mistakes 
so please kindly correct or report them. Thanks!

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

If you choose ``info``, then create in
``/info/`` a folder named `course-name`. Then create
a file ``index.md`` that will be used as the entry
point for your course. You may check the others files if you wondering
how you should write yours.

If you want to edit a course, simply edit the ``.md``
file.

## TODO List 

Last updated: 2021-07-28

**Website**

* [ ] add create course page/button
* [ ] add go back to #titleID instead of #linkID
* [ ] replace all goBack by goBackWithID
* [ ] edit: show formulas
* [ ] edit: open link

**Next content**

* [ ] Complete R course
* [ ] Graphs course
* [ ] Complete Statistics course
* [ ] Matrix course
* [ ] First-order logic course
* [ ] Languages theory course
* [ ] Numerical analysis course
* [ ] General mathematical knowledge course
* [ ] Microeconomic course
* [ ] Macroeconomic course
* [ ] Complete Java course (notes, javafx)
* [ ] Cyber security course
* [ ] Complete JS course
* [ ] Complete Bootstrap course
* [ ] Complete C course
* [ ] Complete Linux course
* [ ] Complete Network course
* [ ] Complete Python course
* [ ] Complete SQL course