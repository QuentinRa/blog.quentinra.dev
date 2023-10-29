# Factors

[Go back](../../index.md)

Factors are used for qualitative variables. It's a variable taking a finite number of values like an answer: $Yes$ or $No$. The factor function will create a vector with levels. You will be able to use this later, for instance for grouping those that answered $Yes$ and those who answered $No$.

```r
# format: factor(v, levels = levels)
f <- factor(c("yes", "yes", "no", "idk", "yes","no"), levels = c("yes","no", "idk"))
f
# [1] yes yes no  idk yes no
# Levels: yes no idk

# implicit levels (unique values), per alphabetical order
f <- factor(c("yes", "yes", "no", "idk", "yes","no"))
f
# [1] yes yes no  idk yes no
# Levels: idk no yes
```

<hr class="sl">

## Levels

You can get the levels with `levels` (😄).

```r
levels(f)
# [1] "yes" "no"  "idk"
```

You can get a variable drop a level with `droplevels`.

```r
droplevels(f, "idk")
# [1] yes  yes  no   <NA> yes  no
# Levels: yes no
```

You can use this trick to add a level

```r
# set levels properpies for f
# as the previous levels vector concatenated with "???"
levels(f) <- c(levels(f), "idk")
levels(f)
# [1] "yes" "no"  "idk"
```