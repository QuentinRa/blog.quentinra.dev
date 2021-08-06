# Code

[Go back](..#writing-rst-documents)

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