# Doxygen

<div class="row row-cols-md-2"><div>

Doxygen is a widely used documentation generator tool, especially for C/C++ projects. It generates documentation from specially formatted comments within the source code ✨.

* [GitHub](https://github.com/doxygen/doxygen) <small>(4.9k ⭐)</small>
* [Manual](https://www.doxygen.nl/manual/index.html) <small>(⛪)</small>
* [Quick reference](https://www.mitk.org/images/1/1c/BugSquashingSeminars$2013-07-17-DoxyReference.pdf) <small>(unofficial, 💎)</small>

You can download doxygen from the [GitHub Release page](https://github.com/doxygen/doxygen/releases). You can also download the manual as a PDF from there 📚.

➡️ Doxygen folder on Windows: `C:\Program Files\doxygen\bin`.
</div><div>

To get started, generate doxygen configuration file.

```ps
$ doxygen -g Doxyfile  # generate
$ less Doxyfile        # to look at the contents 
                       # use "more" on Windows
```

To build the documentation, use:

```ps
$ doxygen Doxyfile
```

Open the `index.html` file in your browser <small>(ex: double-click on it)</small>.
</div></div>

<hr class="sep-both">

## Doxyfile

<div class="row row-cols-md-2"><div>

#### Project metadata

* `PROJECT_NAME = "..."` : project name
* `PROJECT_NUMBER = "..."` : a version such as `0.0.5`
* `PROJECT_BRIEF = "desc"` : project description
* `PROJECT_LOGO = "path"` : project logo

#### Verbose

* `WARN_IF_UNDOCUMENTED` : show warning of not
* `WARN_IF_DOC_ERROR` : show warning of not
* `QUIET = YES` : not verbose, keep it quiet
</div><div>

#### Input/Output settings

Input

* `INPUT = path` and `INPUT += path`: you need to add your source folders here for their documentation to be generated.
* `RECURSIVE = YES`: recursively browser input folders

Output

* `OUTPUT_DIRECTORY = "path"` : generate website folder
* `OUTPUT_LANGUAGE = "English"` : documentation language

Others

* `EXCLUDE = path` and `EXCLUDE += path` : exclude some path
* `IMAGE_PATH = path` : to use image in your documentation, the folder with images must be added to IMAGE_PATH.

#### HTML settings

* `USE_MATHJAX = TRUE` : enable mathjax.js (for LaTeX)
* `LAYOUT_FILE = "path"` : a layout to change documentation layout
* `HTML_HEADER = ./header.html` : add a header, `header.html` is a file that you created
* `HTML_FOOTER = ./footer.html` : add a footer, `footer.html` is a file that you created
* `HTML_EXTRA_STYLESHEET = style.css` : add a CSS file
* `HTML_EXTRA_FILES = file.js` : add a JS file
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>


</div></div>