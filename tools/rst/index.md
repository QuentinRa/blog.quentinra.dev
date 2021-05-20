# RST

`rst` or `reST` means ``reStructuredText``, file with
extension ``.rst``.

To put it simply, its a language that is great to make
``documentations`` since 
looking like this [readthedocs](https://docs.readthedocs.io/en/stable/index.html).

That's a language you will find in documentations
such as in python, but the link above ``readthedocs``
is a continuous integration system that allow you

* to write code (by yourself)
* write documentation using `sphinx`, in ``rst``
* then when changes are made in the documentation,
automaticaly, the website will have the new docs.
* like git, you can have different branches so
one can switch to a version of the code easily
  
I started using it after seing a lot of programmers
using it such as

* <http://docs.mathjax.org/en/latest/>
* <https://codeigniter.com/user_guide/index.html>

# Installing sphinx

Please take note that sphinx is only required
if you are planning to write a documentation website.
For python command, skip this part.

... some explanation here ...

Sphinx use a ``tree`` system, we we need to link
the pages together. We do that with ``toctree directive``

```rest
.. toctree::
 :maxdepth:

    Nom printed     <file_rst_without_extension>
```

# Writing RST documents

Here a the most commons elements of syntax

* [titles](syntax/titles.md)
* [text](syntax/text.md)
* [code](syntax/code.md)
* [images and links](syntax/images-and-links.md)
* [math (latex)](syntax/math.md)
* [uml (plantuml)](syntax/uml.md)
* [table](syntax/table.md)
* [notes, ...](syntax/special.md)
* [lists](syntax/lists.md)
* [graphviz](syntax/graphviz.md)
* [class or methods](syntax/class-or-methods.md)

As a side node, space and indents are quite important
in ``rst``, so be sure to check your indents if the compiler
fails on a line and you don't know where is the error.

# Sources

* Quentin RAMSAMY–AGEORGES (ENSIIE student)

References
* <https://docs.anaconda.com/restructuredtext/detailed/>
* <https://docutils.sourceforge.io/docs/user/rst/quickref.html>
* <https://sublime-and-sphinx-guide.readthedocs.io/en/latest/code_blocks.html>
* <https://pandoc.org/>
* <https://rst2pdf.org/>
* <https://sublime-and-sphinx-guide.readthedocs.io/en/latest/index.html>
* Sphinx
    * <https://docs.readthedocs.io/en/latest/guides/adding-custom-css.html>
    * <https://matplotlibguide.readthedocs.io/en/latest/Matplotlib/basic.html>
    * <https://plantuml.com/>
    * <https://graphs.grevian.org/example>
    * <https://www.sphinx-doc.org/en/master/usage/extensions/graphviz.html>
    * <https://sphinx-tutorial.readthedocs.io/step-1/>
    * <http://docs.mathjax.org/en/latest/basic/a11y-extensions.html>
    * <https://sphinx-doc-zh.readthedocs.io/en/latest/ext/math.html>
    * <https://documentation.help/Sphinx/math.html>
    * <https://fr.wikipedia.org/wiki/ReStructuredText>
    * <https://docs.readthedocs.io/en/stable/intro/getting-started-with-sphinx.html>