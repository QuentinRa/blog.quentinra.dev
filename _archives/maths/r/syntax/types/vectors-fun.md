# Vectors (functions)

[Go back](../../index.md)

Here is a summary of all functions you can use on a vector $v$ (they should work for most likely anything else too, like a data.frame, ...).

<hr class="sl">

* `head(v)`: first values
* `tail(v)`: last values
* `View(v)`: visual of the vector content
* `length(v)`: size
* `attributes(v)`: get attributes (dim, ...)

<hr class="sr">

**Utilities**

* `value %in% v`: true if value is in v
* `is.element(e,v)`: true if e is in v
* `rev(v)`: reverse
* `sort(v)`/`order(v)`: sort
* `identical(v1,v2)`: true if they are the same
* `any(v opérateur valeur)`: true if at least one value make the condition true
* `all(v opérateur valeur)`: true if all values make the condition true
* `duplicated(v)`: true if a value is duplicated, for each value

<hr class="sl">

**Math**

* `which.min(v)`: index of the min value
* `which.max(v)`: index of the max value
* `sum(v)`: sum of all elements
* `prod(v)`: product of all elements
* `intersect(x,y)`
* `union(x,y)`
* `setdiff(x,y)`
* `mlv` (library `modeest`): get the mode