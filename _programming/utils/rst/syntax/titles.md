# Titles

[Go back](..#writing-rst-documents)

```rest
====================
Chapter title
====================

1. Section
=========================

1.1 subsection
******************************

1.1.1 subsubsection
-------------------------------------

....
```

Symbols for sections, subsections, and subsubsections may be interchanged according to your liking. But according to the documentation, you should rather do it like that

* ``#``: part
* ``*``: chapters
* ``=``: section
* ``-``: subsection
* ``^``: subsubsection
* ``»``: paragraph

<hr class="sl">

## Reference

You can reference a title, which is like saying "Hey, check this part of the documentation too", using ref

```rest
.. _tag:

some header
************

Hey, check this part of the documentation too: :ref:`tag`.
```