# Qualitative explanatory variables

[Go back](../index.md#regression)

I told you that $X$ or the explanatory variables, are either quantitative or qualitative. Well, for quantitative variables you won't any problems but for qualitative it's a bit more complicated.

<hr class="sr">

## Binary variables

Let's say you want to find the dependency between 

* Y=height
* with X=age
* and G=Gender (Considering only Women/Men since it's a binary variable)
* $Y = a + bX + cZ$

You can't interpret the result $b$ as always, since it makes no sense having a coefficient $c$ before a gender since it's not something countable.

Well the solution is easy, we can use a boolean like this $Y = a + bX + cW + dM$ giving us

* $Y = a + bX + 0 * W + 1 * M$ (observing Men)
* $Y = a + bX + 1 * W + 0 * M$ (observing Women)

That's why when you have binary variables, you will have two results, so you can read a result as "for women, an increase of 1 for the age tend to increase the size by $b$" (resp. men).

<hr class="sr">

## Other qualitative variables

The idea is the same. If you have a variable $Z \in ['worker', 'miner', 'artisan']$ then you will consider three results $Y = a + bX + W + bM + cA$ with $b,c \in [0,1]$.

But you noticed, right? Why there isn't a coefficient before the $W$? Well, you are comparing the results, so you need a reference, and that's the first one by default (unless you used `rlevels(qual, ref="artisan")`).

This means that $b$ is interpreted as "if the person is not a worker but a miner, then ...".

You may want to check the impact of $Z$ on $Y$, and you can do that with

```r
drop1(model, .~., test="F")
```
