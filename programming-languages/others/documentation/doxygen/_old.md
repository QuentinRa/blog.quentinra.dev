# Write documentation

The main idea is writing comments like this one in a `.h`

```c
/*!
 * \file my_file.h
 * \author your name(s) here
 * \version 0.0.0
 * \date a date (the format is up to you)
 * \see a type/a class/a file we might need to check along this one
 * \see ...
 * \brief some brief description
 *
 * This is a long and fully explained description
 * of this file that can include HTML
 * such as the "ul" or the "ol" tags for
 * lists...
 */
```

Note that `\file`, `\author`, ... are a list of `keywords` that will allow `doxygen` to give some style to your documentation. They start either with a `\` or a `@` like in `Java`.

* [Write documentation in C](docs/c.md)
* [Write documentation in Object-Oriented Languages](docs/oo.md)

<hr class="sl">

## Make your documentation beautiful

If you want to have beautiful documentation such as this one [magnum](https://doc.magnum.graphics/magnum/) then here is my tutorial, but you got the official one here [m.css](https://mcss.mosra.cz/documentation/doxygen/) that will **quite** help you.

* download these files from [https://github.com/mosra/m.css](https://github.com/mosra/m.css)

  * folder `documentation/templates`
  * files `documentation/__init__.py`, `documentation/_search.py`, `documentation/doxygen.py`, and `documentation/python.py`
  * file `documentation/favicon-dark.png` and `documentation/favicon-light.png`
  * file `documentation/search.js`
  * folder `plugins`
  * folder `css`
  
Put everything in a `style` folder, mine looks like this [style folder](https://github.com/lgs-games/prim/tree/master/version_c/style) or this screen <a target="_blank" href="/courses/tools/doxygen/mcss_folder.png">style folder</a>.

Next

* if `python` and `pip` are not installed, then install them
* `pip3 install jinja2 Pygments`
* create `DoxyfileCSS`
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
# "<a href=\"a_page.html\">Functions</a>" \
# "<a href=\"un_lien">GitHub</a>"
```

* on Linux `chmod +x style/doxygen.py`
* then do `style\doxygen.py DoxyfileCSS` (or `/` on Linux)
* check your usual output folder for your `ìndex.html`

<hr class="sr">

## Make your documentation great

I think we should think carefully about how to make our documentation. Here is some advice, I hope it helps you find ideas about what would make documentation great.

* document `imports`, one line, why are you using them
* document `variables`, at their initialization, why do you need it
* group some part of your code (all `getters`, all `setters`, all `utilities`, all `constructors`, ...)

* do **not** write `@return int, a number` or `@param int a number`: in most cases it's useless

  * maybe tell us the range of the variable
  * some values that may trigger a different behavior

* don't copy-paste, use `@see` or whatever, but don't copy-paste.
* a "big" description at the beginning of a file, to tells us why you are using this file so that we know if we should read it or not.
* don't use `\date` or `\version` unless you really intend to modify them, otherwise, they are not useful

In general,

* don't forget non-doxygen documentation, one per line or block is helpful
* show some examples of your function is called, that might help a lot
* create a `README.md` summarizing some usages might be good

<hr class="sl">

## Sources

* [JetBrains tutorial](https://www.jetbrains.com/help/clion/creating-and-viewing-doxygen-documentation.html#assistance)
* [Official website](https://www.doxygen.nl/manual/index.html)
* [Official website - commands](https://www.doxygen.nl/manual/commands.html)
* [JetBrains doxygen](https://stackoverflow.com/questions/62038742/modify-doxygen-template-in-clion)
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