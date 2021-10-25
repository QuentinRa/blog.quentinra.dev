# Arrays

[Go back](../index.md#beginner)

Arrays are working almost like in C, aside the fact that the symbol `[]` is after the **type**, not the name of the variable.

* Their size can't be changed
* you can declare one without giving size, but you must give the values instead
* you can declare an empty array with a size

```java
int[] tab;

// some calls
tab = new int[4];
tab = new int[]{1,2,3,4};
tab = new int[4]{1,2,3,4};
```

<hr class="sl">

## Default values

Note that if you are giving a size, but you aren't giving values, then the default value will be used

* 0 for int, float, double, ...
* null for objects
* false for booleans

<hr class="sr">

## Indexes

Then you can get an element using `[index]` like `tab[0]` (return 1 for the last value of tab).

<hr class="sl">

## Length

You can get the size of an array using the public `length` attribute like `tab.length` (returns 4).

<hr class="sr">

## Iterate an array

You can iterate using a foreach (example for structures).

```java
for (Integer e: new Integer[]{5,6,7}) {
    // some code
    // e=5 then e=6 then e=7
}
```

If you try to use an index that does not exist, you will get an Exception (sort of Error) `IndexOutOfBoundsException`.