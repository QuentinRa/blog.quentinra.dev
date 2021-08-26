# Vectors

[Go back](../../index.md)

A vector is a set of values, like an array in C or lists in python. This is also literally a vector in math. You can use `c` (concatenate function) to merge values and create a vector. They **must have the same type**.

```r
c(1,2,3,4,5)
# vector
# [1] 1 2 3 4 5

# empty numeric vector of length=5
v <- vector(mode = "numeric", 5)
# you can fill it
# (random values between [1,5])
sapply(v, function (unused){ return(sample(1:5, 1)) })
# [1] 2 5 2 3 4
```

You can also easily create a sequential vector with `n:m`

```r
1:5
# [1] 1 2 3 4 5
```

<hr class="sl">

## Operations

You can add two vectors, BUT if one is smaller than the second one, then the values are recycled. You will get a warning if the size of one isn't a multiple of the other's size.

```r
c(1, 2, 3, 4) + c(0,10)
# recycling
# 1=1+0, 12=2+10, 3=3+0 et 14=4+10
[1]  1 12  3 14
```

<hr class="sr">

## Indexes (unnamed)

You can use `vector[index]` or `vector[indexes]` but note that the **INDEXES START AT 1** (not 0).

* you can give one index

```r
vector <- 1:25
vector[1]
# [1] 1
vector[0]
# integer(0)
vector[26]
# [1] NA
vector[-1]
# all aside "1"
```

* you can give a vector of indexes

```r
vector[c(1,2)]
# 1 and 2
vector[seq(1,10)]
# seq <=> 1:10, the first 10th values
```

* you can give negative indexes (will return every other index aside from these)

```r
vector[-c(1,2)]
# everything aside 1 and 1
vector[c(-1,-2)]
# same as above
```

<hr class="sl">

## Indexes (named)

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

<hr class="sr">

## Conditions

You can find value by a condition

```r
# generate 10 integers within [0,100]
vect <- round(runif(10,0,100))
# notice that the function is actually applying
# round to each element of the vector returned
# by runif.
vect
# [1] 73  9 36 76 67 30 89 44 60 75
```

Let's say we want all even values, we will do

```r
vect[vect %% 2 == 0]
# vect[vect %% 2 != 0] for odd
# vect[vect > 50] for values greater than 50
```

The idea is simple, since `vect %% 2 == 0` is returning a vector, then you can pass it to `vect[]` since the `[]` operator is taking a vector of indexes.

Something weird in R is that you can replace any values, so if you want to replace the even values by the mean, you could do

```r
vect[vect %% 2 == 0] <- mean(vect)
vect <- round(vect)
vect
# 73  9 56 56 67 56 89 56 56 75
```

You can also use `which` to get the indexes matching a criterion

```r
which(vect < 30)
# [1] 2
```