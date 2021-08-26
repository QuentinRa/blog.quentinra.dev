# Lists

[Go back](../../index.md)

This is a vector that can take values having different types. The syntax is `list(key = value, value, ...)` (this is the same as for vectors, with named indexes or not). A lot of functions are returning a list because they want to return an "object"=a lot of values having different types.

```r
l <- list(age = 42, id = 13, name = "Joseph")
l
# $age
# [1] 42
# 
# $id
# [1] 13
# 
# $name
# [1] "Joseph"
```

<hr class="sl">

## Indexes

You can use the operator `[[index]]` which is only taking **1** value (vector of size 1). Since a list is still a vector, you can use `[]` too. For named indexes, you can use the operator `$`.

```r
l$name
# [1] "Joseph"

# 
l[c("id", "name")]
# $id
# [1] 13
# 
# $name
# [1] "Joseph"

# by value
> l[[1]]
42
```