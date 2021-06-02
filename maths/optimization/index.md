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
* [Minimum (global)](points/minl.md)
* [Point Selle / saddle point](points/saddle.md)
* [Critical point](points/critical.md)

## unconstrained optimization

Here some methods used in unconstrained optimization,
please **note** that some constrained optimization problems
may be solved using unconstrained optimization methods,
and if you got more than one result, then check the conditions
or you will have to do a constrained optimization method.

* [Hessian/Gradient](uo/hessian.md)
* [Least squares methods](uo/least-squares.md)
* [Geometric programming](uo/geometric.md)

## constrained optimization

Here some constrained optimization methods.

* [Constrained polygon](co/polygon.md)
* [Simplex](co/simplex.md)
* [Lagrange](co/lagrange.md)

## optimization : examples in R

Here may not be the language that you would use to do
optimization. Still here you have some examples.

...

## Sources

Credits

* Alain FAYE ([ENSIIE](https://www.ensiie.fr/) teacher)
* Dariush GHORBANZADEH ([ENSIIE](https://www.ensiie.fr/) teacher)
* Anonymous
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

[List of references](ref.md)