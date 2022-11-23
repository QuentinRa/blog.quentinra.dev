# Optimization

We know in a graph how to find the shortest path <small>(graph=circles and lines linking them, for instance cities=circles and lines=roads)</small>. Now we want to do the same thing with a **function** (ex: a pricing function), and we want to know the highest (**maximum**) or the lowest (**minimum**) value that this function would take (they are called **extremum**).

So here you will have

* optimization without constraints (unconstrained)
* optimization under constraints (constrained)
* optimization in R

<hr class="sl">

## the problem

We got a function `f` and will try to minimize it. If you want to maximize a function `g` then that's the same as minimizing `f = -g` (trace some function then reverse it with - and you will see it). We will minimize instead of maximizing, as a lot of algorithms are made for minimizing rather than maximizing.

Before starting, you need to **check that the function got a minimum**! That's the case

* if $f$ is continuous on X (a compact space)
* if $f$ is a coercive function
* if the limit in +infinite of $f$ tends to a value, a.k.a. we got a lower bound

If you draw the curve for $x^2$, and you will see that the minimum is when $x=0$. We usually have more parameters like $f(x,y)$, or $f(x,y,z)$, so we are writing $x^\*$ the minimum (ex: for $f(X)=x^2,\ x^\* = (0)$, or $f(X)=|x+y|,\ x^\* = \\begin{pmatrix}0\\\\0\\end{pmatrix}$). $X$ is the vector of parameters of the function, sometimes used instead of writing $f(x)$ or $f(x,y)$ etc. Since $x^\*$ is also a vector, you may also write $X^\*$.

* [Minimum (local)](points/minl.md)
* [Minimum (global)](points/ming.md)

<hr class="sr">

## unconstrained optimization

Here are some methods used in unconstrained optimization, please **note** that some constrained optimization problems may be solved using unconstrained optimization methods, and if you got more than one result, then check the conditions, or you will have to do a constrained optimization method.

* [Hessian/Gradient](uo/hessian.md)
* [Using the gradient/hessian](uo/use-hessian.md)

Other methods

* [Least squares methods](uo/least-squares.md)
* [Geometric programming](uo/geometric.md)
* [Conjugate gradient method](uo/conjudate.md)
* [Quadratic problems](uo/quadratic.md)

<hr class="sl">

## constrained optimization

Here are some constrained optimization methods.

* [Constrained polygon](co/polygon.md)
* [Simplex](co/simplex.md)
* [Primal and dual](co/lagrange.md)

<hr class="sr">

## optimization: examples in R

Here may not be the language that you would use to do optimization. Still, here you have some examples.

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
> Note that this is the values we found a while back.

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
# all positives so hessian positive definite
# so the point is a minimum local (strict)
```

<hr class="sl">

## Sources

[References](ref.md)