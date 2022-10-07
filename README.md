<div align="center">
<br>

![icon](.github/icon64.png)

<h1>Memorize V5</h1>

**Memorize** was made for people to share notes, links, tutorials, experiences, along with exercises, to help each other. We are providing programming, mathematical, projects-related and tools-related courses.

Anyone can contribute, and you are more than welcome! There is a small gift for each contribution 😘!

Provided by `Legendary Games Studio`, [memorize@lgs-games.com](mailto:memorize@lgs-games.com).
</div>

<div align="center">

[![GitHub](https://img.shields.io/github/license/lgs-games/memorize)](LICENSE)
[![GitHub pull requests](https://img.shields.io/github/issues-pr-closed/lgs-games/memorize?color=%23a0)](https://github.com/lgs-games/memorize/pulls)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/lgs-games/memorize)](https://github.com/lgs-games/memorize)
[![Custom badge](https://img.shields.io/endpoint?label=views&logoColor=success&url=https%3A%2F%2Fmemorize.be%2Fcounter)](https://github.com/lgs-games/memorize)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](.github/CODE_OF_CONDUCT.md)
</div>

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

## Notes

The website's backgrounds were made by [kronbits](https://kronbits.itch.io/backgrounds). If you want to add/remove one, feel free to submit a request using issues.

If you are enjoying the website, please ⭐ the repository on GitHub to support us.

We backed references in another repository [here](https://github.com/memorize-code/memorize-references).

The usual files are here

* [LICENSE](LICENSE)
* [CONTRIBUTING.md](CONTRIBUTING.md)
* [CHANGELOG.md](.github/CHANGELOG.md)
* [CODE_OF_CONDUCT.md](.github/CODE_OF_CONDUCT.md)
* [SECURITY.md](.github/SECURITY.md)