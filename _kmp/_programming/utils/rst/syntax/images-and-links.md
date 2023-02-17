# Images and links

[Go back](..#writing-rst-documents)

This is quite more wordy than in Markdown, but you can do more things, such as given a width/height to an image, storing a link in a variable, or create a download link.

```rest
I can load an image like this

.. image:: example.png
    :alt: alt message

.. image:: example.png
   :align: center

.. image:: example.png
   :width: 100%
   
.. image:: example.png
    :target: URL

I can write some inline links
like this `name <URL>`_  with will be rendered as
"<a href="URL">name/<a>".

I can create a download link using 
:download:`name <relative/path/to/file>`.

.. _a name here: URL

As you saw above, we could make `name <url>`_. 
But, if you declared name as we did with "a name here", 
then you could omit the URL, giving us `a name here`_.

The declaration can be either before or after your first usage
of your variable.
```