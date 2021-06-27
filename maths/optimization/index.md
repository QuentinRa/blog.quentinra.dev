# Optimization

The main idea is that we know
in a graph (for instance like a graph a all cities) how
to find the shortest path. Now we are not using
graph and nodes but a **function** (ex: a pricing function)
and we want to know the highest (**maximum**)
or the lowest (**minimum**) value that this function would take.

So here you will have

* optimization without constraints (unconstrained)
* optimization under constraints (constrained)
* optimization in R

<div class="sl"></div>

## the problem

We got a function ``f`` and will try to minimize it. If you want to maximize
a function ``g`` then that's the same as minimizing `f = -g` (trace some function
then reverse it with - and you will see it). We will minimize instead of maximizing
since a lot of algorithms are made for minimizing rather than maximizing.

Before starting, you need to check that the ``function`` got a minimum!
That's the case

* if ``f`` is continue on X (a compact space)
* if ``f`` is a coercive function
* if the limit in +infinite of ``f`` tends to a value, a.k.a. we got a lower bound

<div>
Since we are manipulating a function, the minimum is a "point", for a
function with one parameter that's x,y. If we got 3 parameters that's x,y,z etc.
We will note this vector of coordinates
<span>\(x^*\)</span>. But we will find different kind of "points" using our
methods.
</div>

<br>

* [Minimum (local)](points/minl.md)
* [Minimum (global)](points/ming.md)

[comment]: <> (* [Point Selle / saddle point]&#40;points/saddle.md&#41;)

[comment]: <> (* [Critical point]&#40;points/critical.md&#41;)

<div class="sr"></div>

## unconstrained optimization

Here some methods used in unconstrained optimization,
please **note** that some constrained optimization problems
may be solved using unconstrained optimization methods,
and if you got more than one result, then check the conditions
or you will have to do a constrained optimization method.

* [Hessian/Gradient](uo/hessian.md)
* [Using the gradient/hessian](uo/use-hessian.md)
* [Least squares methods](uo/least-squares.md)
* [Geometric programming](uo/geometric.md)

<div class="sl"></div>

## constrained optimization

Here some constrained optimization methods.

* [Constrained polygon](co/polygon.md)
* [Simplex](co/simplex.md)
* [Lagrange](co/lagrange.md)

<div class="sr"></div>

## optimization : examples in R

Here may not be the language that you would use to do
optimization. Still here you have some examples.

```r
function_to_optimize <- function(param) {
  x <- param[1]
  y <- param[2]
  # evaluates
  return(
    2*x^2 + y^2 - 2 * x * y + 4 * x
  )
}

# first value ("random")
first <- c(0, 0)

# optimize
r <- optim(fn = function_to_optimize, par = first, hessian = TRUE)

if (r$convergence > 0){
  stop("can't optimize this function")
} else {
  cat("minimum:", r$value, "\n");
  cat("hessian:", r$hessian, "\n");
  cat("par:", r$par, "\n");
}
```

> <pre class="mb-0">minimum: -4
> hessian: (4, -2; -2, 2)
> par: -2 -2</pre>
> Note that this is the hessian we calculated a while
> back.

We can do some verifications

```r
library('numDeriv')
# check the result, (-2,-2) is a critical point
grad(func=function_to_optimize,x=c(-2, -2))
# (0,0) : ok
hessian(func=function_to_optimize,x=c(-2, -2))
# (4, -2; -2, 2) : ok
eigen(hessian(func=function_to_optimize,x=c(-2, -2)))$values
# [1] 5.236068 0.763932
# all positives so hessian definite positive
# so the point is a minimum local (strict)
```

<div class="sl"></div>

## Sources

[References](ref.md)