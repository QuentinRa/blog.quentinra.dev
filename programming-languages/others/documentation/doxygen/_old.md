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