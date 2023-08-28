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

<hr class="sr">

## Make your documentation great

I think we should think carefully about how to make our documentation. Here is some advice, I hope it helps you find ideas about what would make documentation great.

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