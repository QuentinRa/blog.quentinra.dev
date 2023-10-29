# Expressions

You can do comments with `#`. You may or not add a `;` at the end of a line.

If a line is evaluated to be a **value** then R will print it. For example, when I do `x <- 5` I assign something so that's not a value. But if I write `x` or `"test"` **it's a value** so R will print it.

```r
# will print 5
x
# explicit call to print
print("test")
```

<hr class="sl">

## Functions

You can write a function using the keyword `function`. Parameters can have a default value and they can be passed in whatever order you want if you use named arguments.

```r
my_function <- function (x, y=2){
  return(x + y)
}

my_function(5) # y = 2
my_function(y=3, x=5) # use names
```

<hr class="sl">

## Vectors

In R, all values are a vector. In fact `5` is considered as a vector of size 1. A vector is like an array, but when you do something like `vector * 2` or `function(vector)` then the operation is applied <small>(or most likely will, in case of functions, since that's up to the one coding)</small> to every element of a vector.

```R
# shortcut to create a vector from [[1,10]]
one_to_ten <- 1:10
# get first value (INDEXES START AT 1)
one_to_ten[1] # print 1
one_to_ten[length(one_to_ten)] # print 10

# for i in
# print 1 then 2 ...
for (i in one_to_ten) { print(i) }

# In R, it's preffered that you use the "apply"
# function instead of a loop
sapply(one_to_ten, function (i) { print(i) } )
```

R is guessing the type of a variable but you can use a constructor to explicitly create a variable having a type. 

```r
# create a vector of 10 numerics (=float or int) values
numeric(10)
```