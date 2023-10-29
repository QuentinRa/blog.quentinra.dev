# Sphinx 🦁

<div class="row row-cols-lg-2"><div>

Sphinx is a well-known documentation generation tool, mainly used in Python projects. It generates documentation from special comments within the source code ✨ or from separate [ReStructured Text](/programming-languages/others/documents/rst/index.md) files ✍️.

* [GitHub](https://github.com/sphinx-doc/sphinx) <small>(5.6k ⭐)</small>
* [Manual](https://www.sphinx-doc.org) <small>(⛪)</small>

You can install it using `pip`:

```shell!
$ pip install -U sphinx
$ sphinx-build --version
```
</div><div>

Sphinx is commonly used with [ReadTheDocs](https://docs.readthedocs.io/en/stable/) for instance: [here](https://sublime-and-sphinx-guide.readthedocs.io/en/latest/index.html) 👀.

Refer to the [docstring](https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html) section to extract code comments 🚀.

Sphinx uses a tree-like system, we need to link the pages together. We do that with `toctree` RST directive 🌳.
</div></div>