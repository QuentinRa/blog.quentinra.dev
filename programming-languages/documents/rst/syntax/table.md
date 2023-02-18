# Table

[Go back](..#writing-rst-documents)

Here is the basic syntax of a table, but there is another one more user-friendly, yet less convenient.

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

Please take note that you may have to increase the number of ``=`` since the content of a column can't be larger than the number of ``=`` of this column.

You may use ``\ `` to set a column as empty.

If you want to write a lot but don't increase the column size, then this idea might help,

```rest
=====  ======= =======
...    ...     ...
=====  ======= =======
...    some    False
\      content \

...    ...     ...
=====  ======= =======
```