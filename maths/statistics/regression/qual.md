# Qualitative explanatory variables

[Go back](..)

I told you that $X$ (or the explanatory variables)
are either quantitative or qualitative. Well, for
quantitative variables you won't any problems
but for qualitative it's a bit more complicated.

<hr class="sr">

## Binary variables

Let's say you want to find the dependency
between 

* Y=height
* with X=age
* and G=Gender (Considering only Women/Men since
  it's a binary variable)
* $Y = a + bX + cZ$

You can't interpret the result $b$ as
always since it make not sense having a coefficient
$c$ before a gender since it's not something countable.

Well the solution is easy, we can use a boolean
like this $Y = a + bX + cW + dM$ giving us

* $Y = a + bX + 0 * W + 1 * M$ (observing Men)
* $Y = a + bX + 1 * W + 0 * M$ (observing Women)

That's why when you have a
binary variables, you will have two results
so you can read a result as
"for women, an increase of 1 for the age tend to increase
the size by $b$" (resp. men).