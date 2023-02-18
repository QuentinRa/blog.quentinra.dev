# RST

`rst` or `reST` means `reStructuredText`, file with extension `.rst`. It's a language that is great to write technical documentation for your code, as you may have seen the usual [Sphinx+Readthedocs template](https://docs.readthedocs.io/en/stable/index.html). You could have seen it in Python too, or on GitHub (ex: README.rst). 

We will focus on Readthedocs, a continuous integration system that allows you

* to write code (you write .rst files by yourself)
* you link the git where the documentation is hosted with Readthedocs
* then when changes are made in the documentation, automatically, the website will have the new docs.
* like git, you can have different branches, so one can switch to a version of the documentation easily
  
I started using it after seeing a lot of programmers using it, such as

* <http://docs.mathjax.org/en/latest/>
* <https://codeigniter.com/user_guide/index.html>

<hr class="sl">

## Installing sphinx

Sphinx is creating a website from your documentation. This is what Readthedocs will use. For python comments, you can skip this section.

* `pip install -U sphinx` (pip should be installed)
* `sphinx-build --version` (check your PATH)
* I'm using `make html` to compile in HTML on Windows from the cmd

Sphinx uses a tree-like system, we need to link the pages together. We do that with `toctree directive`

```rest
.. toctree::
 :maxdepth:

    Name printed     <file_rst_without_extension>
```

<hr class="sr">

## Writing RST documents

Here is a list of the most commons directives

* [titles](syntax/titles.md)
* [text](syntax/text.md)
* [code](syntax/code.md)
* [images and links](syntax/images-and-links.md)
* [math](syntax/math.md) (latex)
* [UML](syntax/uml.md) (plantuml)
* [table](syntax/table.md)
* [notes, ...](syntax/special.md)
* [lists](syntax/lists.md)
* [graphviz](syntax/graphviz.md)
* [class or methods](syntax/class-or-methods.md)
* [side note](syntax/side-note.md)

As a side note, space and indents are quite important in `rst`, so be sure to check your indents if the compiler fails somewhere, and you don't know what's the error.

<hr class="sl">

## Sources

* <https://docs.anaconda.com/restructuredtext/detailed/>
* <https://docutils.sourceforge.io/docs/user/rst/quickref.html>
* <https://sublime-and-sphinx-guide.readthedocs.io/en/latest/code_blocks.html>
* <https://pandoc.org/>
* <https://rst2pdf.org/>
* <https://sublime-and-sphinx-guide.readthedocs.io/en/latest/index.html>
* <https://gist.github.com/dupuy/1855764>
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