# Constrained polygon

[Go back](..)

It's most likely the easiest method, but it won't
works if you got more than 2 parameters.

Rewrite all of your constraints to you
have constraints like this

<p>
\[
x \le 10
y \le 15
y \le 3/5 * x + 7
\]
</p>

You may use greater, greater equals or lesser/lesser
equals but you can't have something like ``x + y < 5``
since we want only one variable on the left-side.

<hr class="sr">

## constrained space

On you have all of your inequalities, simple trace
the lines corresponding to each ones like. Remember
to add a small arrow to visualize the constrained
space

If you have a constraint ``y < 3`` and `x > 2` it would
look like this

![](lines.png)

You should remember that something like that 
``y <= 3/5 * x + 7`` means that
    * you got a point at x=0, y=7
    * if x increase by 5, then y increase by 3
    * so you can guess the next point

<hr class="sl">

## Minimum / Maximum

The critical points are the edges of our
``constrained space`` like `C` in the screenshot.

You had a function ``f(x,y)=...``, and since each
point is got ``(x,y)``, then replace each critical
point in the function. Take the highest (maximum)
or the lowest (minimum) value and you're done.