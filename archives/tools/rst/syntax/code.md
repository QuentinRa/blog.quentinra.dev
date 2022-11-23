# Code

[Go back](..#writing-rst-documents)

You could use `code-block` directive, but `code` is still used quite a lot. You can include a whole file with `literalinclude`, or simply use some inline code with `:code:`.

```rest
.. code-block:: language

    Here I can write some code in a language
    and I will have syntax highlight.
    
.. code:: language

    Alternative to code-block, should not be used
    but still being used.
    
And I can even write some :code:`inline code` using
this inline code directive.

You can include a file

.. literalinclude:: configuration.json
    :language: JSON
    
```