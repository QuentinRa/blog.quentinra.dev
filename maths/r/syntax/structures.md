# Structures

[Go back](../index.md)

In R, you should consider using function rather than these structures, but the if/for statements are quite convenient.

You can use

* `next`: in a loop, go to the next iteration
* `break`: in a loop, exit the loop

<hr class="sl">

**if**

```r
if (condition) {
  # code
}

if (condition) {} else {}

# res = condition ? if_true : if_false
res <- ifelse(condition, if_true, if_false)
```

<hr class="sr">

**while**

```r
while(condition) {}

# use break to exit
repeat {}
```

<hr class="sl">

**foreach / for i in**

```r
for (var in vector){
  
}
```


<hr class="sr"> 

**switch**

```r
res <- switch(value, case_1, case_2, case_n)
```

<hr class="sl"> 

## Apply functions

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