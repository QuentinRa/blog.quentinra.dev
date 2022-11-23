# Contingency tables

[Go back](../../index.md)

A contingency table (`tableau de contingenc/à double entrées`) is a table of **the unique values of a vector** by **the number of times this value is present**.

```r
# picking 50 values within [0,10]
vect <- sample(0:10, 50, replace = TRUE)
table(vect)
# 0  1  2  3  4  5  6  7  8  9 10
# 4  6  4  6  5  5  5  6  6  1  2
```

You can read that each of your eleven values was at least picked once. For instance, we picked $10$ twice.

<hr class="sl">

## Frequencies table

You can use `prop.table` to get the frequency of each value instead of the number of occurrences.

* `prop.table(table(v), 1)` (line only)
* `prop.table(table(v), 2)` (column only)

<hr class="sr">

## More complex tables

If you are calling a table like the code above, so while providing a qualitative variable (the unique values), and a quantitative variable (the values)

```r
table(ech$qual, ech$quant)
```

Then you may try to use

```r
xtabs(~ qual + quant, ech)
```

The main difference is that `xtabs` is using formulas, so when you learned them, you will be able to do quite the great contingency tables.