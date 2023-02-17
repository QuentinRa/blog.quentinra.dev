# Workflow

[Go back](..#starting-your-web-project)

You got some templates you may use later, in the web project. Aside from that, we are showing you the usual workflow for an HTML/CSS/JS project, but I doubt you will need that.

<hr class="sl">

## Simple HTML-CSS-JS-only project

If you are making an HTML-CSS-JS-only project, then the usual workflow is

```bash
# your project root
simple_html_project/
├── assets
│   ├── css # your css files
│   │   ├── print.css
│   │   └── style.css
│   ├── files # your files (pdf, txt, ...)
│   │   ├── example.pdf
│   │   └── example.txt
│   ├── img # images
│   │   └── example.png
│   ├── js # scripts
│   │   └── example.js
│   └── pages # other html pages
│       └── another_html.html
└── index.html # index
````

<hr class="sr">

## PHP Project

**My template**

I created a simple PHP template [here](https://github.com/memorize-code/web-project-template). To use it efficiently, you should check out the JetBrains course and PHPStorm course. 

* MVC
* Databases (example of simple/prepared request, PDO)
* Separation of header/nav/main/footer
* composer file (if needed)
* translations
* tests
* framework-like <small>(simplified version, inspired of CodeIgniter)</small>

**2018/2019 template**

This template was used in 2019-2020 by a lot of students. [The Kirouane template is here](https://github.com/Kirouane/ensiie-project). It's easy to use but, the MVC isn't set in place and some basic knowledge about composer/docker knowledge is required (easy to learn).

* Docker
* composer
* Databases (example of simple request, PDO)
* tests

**TP template**

You may also use the **tp2** as a template, that's what a lot of students did, but be **great and don't do that**. Okay? Anyway, [the template is here](https://github.com/memorize-code/memorize-references/raw/main/special/web/template-tp.zip).