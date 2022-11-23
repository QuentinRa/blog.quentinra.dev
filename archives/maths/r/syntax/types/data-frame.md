# Data.frame

[Go back](../../index.md)

A data.frame is a type used to store a sort of Excel table. You got columns, rows, and values, so that's exactly the same. This is the type you will get after reading a CSV file, if not, a lot of datasets are Data.frames, so it's used quite a lot.

The format is `data.frame(column_name = values, ... )`. If the
values for a column are not enough to fill the longest column, then the values are recycled.

```r
df <- data.frame(number = sample(1:100, 6), name = "Rosé")
df
#   number name
# 1     78 Rosé
# 2     47 Rosé
# 3     55 Rosé
# 4     74 Rosé
# 5     21 Rosé
# 6     53 Rosé
df <- data.frame(number = sample(1:100, 6), name = c("Rosé", "John"))
df
#   number name
# 1     20 Rosé
# 2     96 John
# 3     70 Rosé
# 4     18 John
# 5     65 Rosé
# 6     73 John
```

> **Note**: A data.frame is a list so you can use `df$column_name`.