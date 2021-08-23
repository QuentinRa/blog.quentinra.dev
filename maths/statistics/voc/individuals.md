# Individuals

[Go back](..)

Individuals are the lines of your matrix.

<hr class="sr">

## Individuals in R

```r
# get the first individual
iris[1,]
# Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa

# the 1st and the 10th
iris[c(1,10),]
# ...

# from 10th to 29th
iris[10:29,]
# ...

# value at i=1 j=1
iris[1,1]
```