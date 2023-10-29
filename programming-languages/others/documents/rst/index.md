# reStructuredText

<div class="row row-cols-md-2"><div>

reStructuredText <small>(a.k.a. reST or RST)</small> is an enhanced markdown with additional syntax for complex documents.

It's mainly used in documentation as an alternative to Markdown. It's quite used with the documentation generator "sphinx" 🦁 and the well-known [readthedocs](https://docs.readthedocs.io/en/stable/index.html) 📚  theme. More information [here](/tools-and-frameworks/others/documentation/index.md).
</div><div>

What you can do in RST that you can't do in Markdown:

* 👉 Write LaTeX <small>(math formulas...)</small>
* 👉 Generate UML diagrams <small>(plantuml)</small>
* 👉 Generate Plots <small>(graphviz, matplotlib)</small>

➡️ See the [official documentation](https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html)/[QuickRef](https://docutils.sourceforge.io/docs/user/rst/quickref.html).
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

#### Titles

Titles are text underlined, or over- and underlined with symbols. Any non-alphanumeric characters can be used as long as the syntax is consistent, and they are longer than the text. Two examples:

<div class="row row-cols-md-2"><div>

```
Document Title
=================
Section Title
-----------------
Subsection Title
^^^^^^^^^^^^^^^^^^^
Subsubsection Title
""""""""""""""""""""
Paragraph Title
***************
Subparagraph Title
++++++++++++++++++
```
</div><div>

```
###########
PART TITLE
###########
****************
Chapter Title
****************
Section Title
===============
Subsection Title
-----------------
Subsubsection Title
^^^^^^^^^^^^^^^^^^^^^
Paragraph Title
"""""""""""""""""""
```
</div></div>

#### Paragraph

<div class="row row-cols-md-2 mt-3"><div>

```md
This is a
paragraph.

Here is another paragraph
with **text in bold** and 
text in *italic*.

| One Line
| Another Line
```
</div><div>

This is a paragraph.

Here is another paragraph with **text in bold** and text in *italic*.

One Line<br>Another Line
</div></div>
</div><div>

#### Links and Images

```js!
.. image:: example.png
    :alt: alt message
    :align: center
    :width: 100%
    :height: 100
    :target: URL_ON_CLICK

Link: `link text <https://example.com>`_
DownloadLink: :download:`name <relative/path/to/file>`
ReusableLink: `reusable`_

.. _reusable: SOME_URL
```

#### Lists

<div class="row row-cols-md-2 mt-3"><div>

```md!
* unordered list item
* unordered list item
 + unordered list item
 + \
  unordered list item
  
- unordered list item
- unordered list item
```
</div><div>

```text!
1. ordered list item
2. ordered list item

a. ordered list item
b. ordered list item

#. auto ordered list item
#. auto ordered list item
```
</div></div>

</div></div>

<hr class="sep-both">

## Intermediate

<div class="row row-cols-md-2"><div>

#### Comments

```text
.. this is a comment
```

#### Notices/Alerts

You may add a `note`, `warning`, `hint`, or an `important` notice to your documentation. For instance, for a `hint`:

```js!
.. hint::

    some hint here.
```

#### Side notes/references

```text!
Side notes for a word such as xxx [#1]_ are usually
shown at the bottom of the page.

.. [#1] explain the word
```

➡️ You don't have to use numbers, you can use any value you want.

You can reference a section by adding a tag before the header.

```js!
.. _some_tag:

some section
===============

[...] :ref:`some_tag` [...]
```
</div><div>

#### Code Blocks

We can insert inline code within a text, or use a code block.

```js!
:code:`some inline code here`

.. code-block:: language

   // Some code here
       
.. literalinclude:: configuration.json
    :language: JSON
```

#### Classes and methods

You can document classes/methods/attributes using the syntax below. Note that methods or other directives can be used outside a class.

```js!
.. class:: ClassName

   description...

   .. method:: some_method(arg)

      description...

      :param arg: description...
      :type arg: str

      :return: description...
      :rtype: bool

   .. attribute:: some_attribute

      description...

      :type: str
```
</div></div>

<hr class="sep-both">

## Advanced

<div class="row row-cols-md-2"><div>

#### Math

```js!
Some inline latex formula :math:`a \gt b`.

.. math::

    \text{some block-level latex formula.}
```

#### Plots

You can use [Graphviz](/tools-and-frameworks/projects/modeling/graphviz/index.md) diagrams:

```js!
.. graphviz::

    digraph {
        size="10,8";
        rankdir="LR";
        "Bourse" -> "Opéra" [ label="5" ];
        a [style=filled,color=red];
        a -> b [arrowhead = none];
    }
```
</div><div>

#### UML

Refer to [PlantUML](https://plantuml.com/) for the syntax.

```
.. uml::

    @startuml
    class User {
        {field} <u>ID
        {field} name
        {field} first_name
        {field} address
        {field} ∗ email
        {field} cellphone
    }
    @enduml
```

#### Tables

<div class="row row-cols-md-2 mt-3"><div>

Tables are a pain to write. You need the number of equals (`=`) below the title of the column to be higher than any value inside the table.

```md!
=====  =====  =======
A      B      A and B
=====  =====  =======
False  False  False
True   False  False
False  True   False
True   True   True
=====  =====  =======
```
</div><div>

👉 use `\ ` to render an empty cell.

👉 A trick to avoid increasing the column size:

```rest
=====  ======= =======
...    ...     ...
=====  ======= =======
...    some    False
\      long    \
\      content \

XXX    YYY     ZZZ

...    ...     ...
=====  ======= =======
```
</div></div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [anaconda](https://docs.anaconda.com/restructuredtext/detailed/)
* [dupuy](https://gist.github.com/dupuy/1855764)
* [rst2pdf](https://rst2pdf.org/)
</div><div>


</div></div>