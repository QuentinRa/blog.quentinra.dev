# Arrays

[Go back](..)

Arrays are almost working like in C. 

* Their size can't be changed
* you can declare without a size and the values instead
* you can declare an empty tab with a size
* the ``[]`` are after to the **type** not the variable

Like this

```java
int[] tab;

// some calls
tab = new int[4];
tab = new int[]{1,2,3,4};
tab = new int[4]{1,2,3,4};
```

> Note that if you don't enter some values, then
> the default value will be used
> * 0 for int, float, double, ...
> * null for objects
> * false for booleans

Then you can get an element using ``[index]``
like ``tab[0]`` (return 1 for the last value of tab).

You can get the size of an array using the public
``length`` attribute like `tab.length` (returns 4).

You can iterate using a foreach (example
for structures).

```java
for (Integer e: new Integer[]{5,6,7}) {
    // some code
    // e=5 then e=6 then e=7
}
```

If you try to use an index that do not exists, you
will got an Exception (sort of Error) 
``IndexOutOfBoundsException``.