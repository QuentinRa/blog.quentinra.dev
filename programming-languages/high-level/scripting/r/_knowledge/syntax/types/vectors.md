# Indexes (named)

You can use the `=` operator and give a label/name to a value.

```r
r <- c(yes = 1, no = 0)
r["yes"]
# yes
# 1

# yes and no values
match(c("yes", "no"), names(r))
# [1] 1 2

# adding a value
r <- c(r, 2)
# adding a name for the 3rd value
names(r) <- c("yes", "no", "idk")
r
# yes  no idk
# 1   0   2 
```