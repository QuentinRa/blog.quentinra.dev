# Titles

[Go back](..)

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

Symbols for sections, subsections and subsubsections
may be interchanged according to your linking.
But according to the documentation you should rather
do it like that

* ``#``: part
* ``*``: chapters
* ``=``: section
* ``-``: subsection
* ``^``: subsubsection
* ``»``: paragraph

You can reference a title, meaning say "Hey check
this part of the documentation" using ref

```rest
.. _tag:

some header
************

Hey check this part of the 
documentation : :ref:`tag`.
```