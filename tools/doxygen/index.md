# In this course

* you will learn how to use write ``doxygen`` comments
* how to generates documentation with `doxygen`,
  so how to write a ``Doxyfile``
* how to generate a GREAT documentation with ``doxygen`` (
  with a beautiful theme
  )
* some advices about comments

Based on ``doxygen`` version `1.9.1`.

## Starting with doxygen

Doxygen is working like the javadoc in JAVA if you
know what I mean to

* write documentation using a special syntax
* use a command to generates a website
* open a file called ``index.html`` in your
browser and check it out !
  
Here some [installation tutorial](install.md)
or if **needed** you can check their documentation
here [doxygen.nl](https://www.doxygen.nl/index.html)
but for me it's a bit **unreadable** and your
documentation should not be like that,
hopefully.

## Write documentation

The main idea is writing comments like this one
in a ``.h``

```c
/*!
 * \file my_file.h
 * \author your name(s) here
 * \version 0.0.0 for instance
 * \date a date
 * \see a type/a class/a file we might need to check
 * \brief some brief description
 *
 * This is a long and fully explained description
 * of this file that can include html
 * such a <ul> or <li> for
 * lists.... 
 */
```

Note that ``\file``, `\author`, ... are a list of `keywords`
that will allow ``doxygen`` to give some style to your
documentation. They start either with a ``\``
or a ``@`` like in `Java`.

* [Write documentation in C](docs/c.md)
* [Write documentation in Java](docs/java.md)

## Generate your documentation website

You will need a file called
``Doxyfile`` in order to compile your documentation.

You can create one with default values
with ``doxygen -g``.

When created, you should check theses lines
and modify them if wanted

* ``PROJECT_NAME = "..."`` : project name
* ``PROJECT_NUMBER = "..."`` : a version such as `0.0.5`
* ``PROJECT_BRIEF = "desc"`` : project description
* ``PROJECT_LOGO = "path"`` : project logo
* ``OUTPUT_DIRECTORY = "path"`` : where the **generated website**
  is stored.
* ``OUTPUT_LANGUAGE = "English"`` : documentation language
* ``QUIET = YES`` : **do not show hundred of messages**
* ``WARN_IF_UNDOCUMENTED`` : show warning of not
* ``WARN_IF_DOC_ERROR`` : show warning of not
* ``INPUT = path`` : **add a file/folder** only theses may 
  have a documentation generated unless the file
  extension is excluded.
* ``INPUT += path`` : **add more files/folder**,
  each time add this line, since only one path per line.
* ``RECURSIVE = YES`` : **recursive search** of INPUT
  folders
* ``EXCLUDE = path`` : exclude some path
* ``IMAGE_PATH = path`` : if you do have a folder
of images that you use in your documentation.
  
and some ``HTML`` specifics options

* ``LAYOUT_FILE = "path"`` : a layout to change documentation layout
* ``HTML_HEADER = ./header.html`` : add an header, `header.html`
  is a file that you created
* ``HTML_FOOTER = ./footer.html`` : add a footer, `footer.html`
  is a file that you created
* ``HTML_EXTRA_STYLESHEET = style.css`` : add a CSS file
* ``HTML_EXTRA_FILES = file.js`` : add a JS file

and if you want to enable latex

* ``USE_MATHJAX = TRUE`` : enable mathjax.js

then you have to use

```bash
doxygen Doxyfile
```

to generates your documentation. Check your
``OUTPUT_DIRECTORY`` for the index.html that
you must open in your browser to look at
your HTML documentation.

## Sources

* Anonymous
* Quentin RAMSAMY–AGEORGES (ENSIIE student)

References

* [Jetbrains tutorial](https://www.jetbrains.com/help/clion/creating-and-viewing-doxygen-documentation.html#assistance)
* [Official website](https://www.doxygen.nl/manual/index.html)
* [Official website - commands](https://www.doxygen.nl/manual/commands.html)
* [Jetbrains doxygen](https://stackoverflow.com/questions/62038742/modify-doxygen-template-in-clion)
* [Doxygen Reference](https://www.mitk.org/images/1/1c/BugSquashingSeminars$2013-07-17-DoxyReference.pdf)
* [Doxygen french tutorial](https://franckh.developpez.com/tutoriels/outils/doxygen/)
* [Doxygen make index page](https://stackoverflow.com/questions/9502426/how-to-make-an-introduction-page-with-doxygen)
* themes lookup
  * [doxygen-theme](https://gitlab.ti.bfh.ch/doxygen-theme/doc)
  * [doxygen-theme](  https://gitlab.ti.bfh.ch/doxygen-theme/doc)
  * [doxygen-bootstrapped](https://github.com/Velron/doxygen-bootstrapped)
  * [doxygen-bootstrapped](https://github.com/cellcortex/doxygen-bootstrapped)
  * [Change doxygen theme](https://stackoverflow.com/questions/9629779/change-the-theme-of-doxygen)
  * [Improved doxygen](https://blog.magnum.graphics/meta/improved-doxygen-documentation-and-search/)
  * [m.css doxygen](https://mcss.mosra.cz/documentation/doxygen/#basic-usage)
  * [m.css](https://github.com/mosra/m.css)