# Types

[Go back](../index.md)

In R, all types are vectors. For instance, `5` (number) is a vector of size 1.

* **numeric**: 1, 1.3 
* **complex**: i
* **logical**: TRUE, FALSE, T, F
* NULL, NA (not defined), Inf (infinite)
* **character**: "a text", 'a text'
* **vector**
* **matrix**
* **data.frame** (~=an Excel table)
* **list**: a vector, with named indexes and that can have different types

<hr class="sr">

## Types methods
  
You have a lot of methods for each type, having this syntax

* **is.xxx(x)**: return true if x is from the class xxx
* **class(x)**: return x class
* **mode(x)**: return x mode
* **identical(x, y)**: true if x equals y
* **as.xxx(x)**: convert x to xxx class
* **xxx(...)**: create an empty vector having the type xxx

<hr class="sl">

## Examples

```r
# create an empty vector of 3 characters
str <- character(3)
# return true
is.character(str)
# character
class(str)
# character
mode(str)
# try to convert to Date
as.Date(str) # will "fail" since empty
```