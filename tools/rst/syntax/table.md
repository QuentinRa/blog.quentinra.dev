# Table

[Go back](..)

Here is the basic syntax of a table,
but there is another one [add it please].

```rest
=====  =====  =======
A      B      A and B
=====  =====  =======
False  False  False
True   False  False
False  True   False
True   True   True
=====  =====  =======
```

Please take note that you may have to increase to
number of ``=`` since the content of a column
can't be larger that the number of ``=`` of this
column.

You may use ``\ `` to set a column as empty.

If you want to make write a lot but don't increase column
size, then this idea might help, but that's theorical code

```rest
=====  ======= =======
...    ...     ...
=====  ======= =======
...    some    False
\      content \

...    ...     ...
=====  ======= =======
```