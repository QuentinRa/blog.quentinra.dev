# In this course

* you will learn how to use write ``doxygen`` comments
* how to generates documentation with `doxygen`,
  so how to write a ``Doxyfile``
* how to generate GREAT documentation with ``doxygen`` (
  with a beautiful theme
  )
* some advice about comments

Based on ``doxygen`` version `1.9.1`.

<div class="sr"></div>

## Starting with doxygen

Doxygen is working like the Javadoc in JAVA if you
know what I mean to

* write documentation using a special syntax
* use a command to generates a website
* open a file called ``index.html`` in your
browser and check it out!
  
Here some [installation tutorial](install.md)
or if **needed** you can check their documentation
here [doxygen.nl](https://www.doxygen.nl/index.html)
but for me, it's a bit **unreadable** and your
documentation should not be like that,
hopefully.

<div class="sl"></div>

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

> Also before starting, note that you will have
to say what you are commenting, before actually
starting the comment. An example would be above,
you must use a ``\file`` to say that
you are commenting this file. So you would
have to use ``\enum`` in the comment of an enum
...

* [Write documentation in C](docs/c.md)
* [Write documentation in Object-Oriented Languages](docs/oo.md)

All tags can be found in this great reference sheet

  * official link : [DoxyReference.pdf](https://www.mitk.org/images/1/1c/BugSquashingSeminars$2013-07-17-DoxyReference.pdf)
  * permanent link : [DoxyReference.pdf](download:docs/DoxyReference.pdf)

<div class="sr"></div>

## Generate your documentation website

You will need a file called
``Doxyfile`` to compile your documentation.

You can create one with default values
with ``doxygen -g``.

When created, you should check these lines
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

<div class="sl"></div>

## Make your documentation beautiful

If you want to have beautiful documentation
such as this one [magnum](https://doc.magnum.graphics/magnum/)
then here is my tutorial
but you got the official one here
[m.css](https://mcss.mosra.cz/documentation/doxygen/)
that will help you (**really**).

* download theses files from [https://github.com/mosra/m.css](https://github.com/mosra/m.css)

  * folder ``documentation/templates``
  * files ``documentation/__init__.py``,
    ``documentation/_search.py``,
   ``documentation/doxygen.py``,
    and ``documentation/python.py``
  * file ``documentation/favicon-dark.png`` and 
    ``documentation/favicon-light.png``
  * file ``documentation/search.js``
  * folder ``plugins``
  * folder ``css``
  
Put everything in the folder ``style``, I have
a folder like this one
[style folder](https://github.com/lgs-games/prim/tree/master/version_c/style)
or this screen [style folder](download:mcss_folder.png).

Next

  * if ``python`` and `pip` are not installed then install them
  * ``pip3 install jinja2 Pygments``
  * create ``DoxyfileCSS``
  *

```bash
# used to become a god
# style\doxygen.py DoxyfileCSS
    
# include original file
@INCLUDE                = Doxyfile
    
# modify some values
GENERATE_HTML           = NO
GENERATE_LATEX          = NO
GENERATE_XML            = YES
XML_PROGRAMLISTING      = NO
XML_NS_MEMB_FILE_SCOPE  = YES
    
# If you want to change the navbar
# to find a special name such as a_page.html
# check the usual output folder then link
# 
# M_LINKS_NAVBAR1 = \
# "<a href=\"a_page.html\">User documentation</a>" \
# "annotated"
# M_LINKS_NAVBAR2 = \
# "files" \
# "<a href=\"a_page.html\">Fonctions</a>" \
# "<a href=\"un_lien">GitHub</a>"
```

* on Linux `chmod +x style/doxygen.py`
* then do `style\doxygen.py DoxyfileCSS` (or `/` on Linux)
* check your usual output folder for your ``ìndex.html``

<div class="sr"></div>

## Make your documentation great

I think we should think carefully about how to make
our comments. Here is some advice, I hope
it helps you find ideas about what would
make documentation great.

* comments ``imports``, one line, why are you using them
* comment ``variables``, at their initialization,
why do you need it
* group some part of your code (all ``getters``
  , all ``setters``, all ``utilities``, all ``constructors``,
  ...)
  
* do **not** write ``@return int, a number``
or ``@param int a number``: in most case it's useless
  
  * maybe tell us the range of the variable
  * some values that may trigger a different behavior

* don't copy-paste, use ``@see`` or whatever but don't.
* a "big" description at the beginning of a file,
to tells us why you are using this file and so that
  we know if we should read it or not.
* don't use ``\date`` or `\version` unless you really
intend to modify them otherwise they are not useful
  
In general

* don't forget non-doxygen comments, one per line or block
is helpful
* show some examples of your function is called,
that might help a lot
* make some ``README.md`` to summarize some usages might be good

<div class="sl"></div>

## Sources

* Anonymous
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

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