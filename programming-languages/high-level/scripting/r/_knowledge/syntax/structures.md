# Apply functions

* `lapply(v, f)`

Apply `f` on each element of `v`, the result is an element of a list.

* `sapply(v, f)`

Same, but returns a vector.

* `aapply(m, f, 1)`

Apply a function on each element of a matrix and returns the matrix.

* `tapply(v, indexes, f)`

The $n$th values in $v$ is used as an argument to the function $f$ to create the $n$th value of the resulting array.

* `by(v, indexes, f, na.rm=TRUE)`

A wrapper for `tapply`. You got the result of each call.

* `aggregate(quant~qual, FUN=function)`

Group the quantitative values by the qualitative factor (stats). The value associated with each value of the qualitative variable is the `mean` of the quantitative values of each group. 