# Variables

[Go back](../index.md)

In R, a variable is either a function
or a value.

You must use ``a <- ...`` to assign `...` to the varaible
``a``.

You can also use ``=`` but you should not since that overusing an
operator supposed to do something else.

Note that you must give a value to a variable. But you can
do something like this

```r
r <- NULL
```

Then print a value

```r
r # implicit

print(r) # explicit
```