# Strings

[Go back](../../index.md)

There is no concatenation operator in R, use the paste function.

```r
paste("Hello", "World");
# merge a vector of strings with the separator "\n"
paste(s1, ..., collapse = "\n")
# merge strings with the separator "\n"
paste(s1, ..., sep = "\n")
```

<hr class="sl">

## Other functions

* **print**: print
* **cat**: concatenate and print
* **substring**: substr
* **strsplit**: split string
* **nchar**: length
* **toupper**, **tolower**
* **gsub**: tr (=replace char)
* **trimws**: trim (remove useless spaces at the start and the end)