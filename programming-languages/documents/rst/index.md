# reStructuredText

<div class="row row-cols-md-2"><div>

reStructuredText <small>(a.k.a. reST or RST)</small> is an enhanced markdown with additional syntax for complex documents.

It's mainly used in documentation as an alternative to Markdown. It's quite used with the documentation generator "sphinx" 🦁 and the well-known [readthedocs](https://docs.readthedocs.io/en/stable/index.html) 📚  theme.
</div><div>

What you can do in RST that you can't in Markdown:

* 👉 Write LaTeX <small>(math formulas...)</small>
* 👉 Generate UML diagrams <small>(plantuml)</small>
* 👉 Generate Plots <small>(graphviz)</small>

➡️ See the [official documentation](https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html).
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

#### Titles

Titles are text underlined, or over- and underlined with symbols. Any non-alphanumeric can be used as long as the syntax is consistent, and that they are longer than the text. Two examples:

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
</div><div>

#### Code Blocks

```js!
.. code-block:: language

   // Some code here
       
.. literalinclude:: configuration.json
    :language: JSON
    
Inline Code: :code:`inline code`
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

You can use [Graphviz](https://graphviz.org/). Ensure that the executable was added to the path, and that `dot.exe -c`/`dot -c` was called at least once.

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
</div></div>