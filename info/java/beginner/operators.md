# Operators

[Go back](../index.md#beginner)

We got every usual operator, which mean most of the ones you got in `C`, but we also have new operators such as `+` to concatenate strings, and `==` isn't working as we are expecting for objects.

<hr class="sr">

## Operations

* `=`: assignation
* `+`, `-`, `*`, `/`
* `!`: not, invert a boolean
* `+`: concatenation (for strings)

<hr class="sl">

## Comparison

* `>`, `>=`, `<`, `<=`
* `!=`: different
* `&&`, `||`
* `^` (xor)

<hr class="sr">

## Utilities

* `+=`, `-=`, `*=`, `/=`
* `var++`: we are increase the value after doing any operation
* `++var`: we are increase the value before doing any operation
* `a >> b` : divide by 2 power b
* `a << b` : multiply by 2 power b

<hr class="sl">

## Equality

We are using `==` to compare if two primitives types
have the same value. Also if an object is null, we are
using `obj == null`. But in all other cases, using `==`
with object means that we are testing whether they have
the same address. Some you would see the use of the 
methods `equals` that will be explained in the `Object`
part.