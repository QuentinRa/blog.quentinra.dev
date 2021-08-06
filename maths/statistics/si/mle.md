# Maximum Likehood estimation

[Go back](..)

In the likehood function example, we had $\theta= (p=0.7)$.
We tested all the values of $p$ from 0 to 1, and
we are able to see clearly a maximum for $p=0.6$
giving us $\hat{\theta}= (p=0.6)$.

Will call this value, the maximum Likehood
estimation. This is a mix of statistics and optimization,
because we have to maximize the likehood function.

Steps

* write your likehood function
* get the first parameter
* optimize the function, starting from the first parameter

<hr class="sl">

## First parameter

Well, in my school, we are

* generating a sample $Bern(0.7)$
* then the first parameter used is $p=0.7$

That's cheating... You are not supposed to know the
real parameters otherwise you would not have to look for them,
but well...

<hr class="sr">

## Optimize a function

In R, you may use ``optim`` or `optimize`. I enjoying
``optim``. For the `L_bern` function we created,
the maximum likehood estimation would be evaluated
like this

```r
# first value of theta-hat
first <- p

r <- optim(
  # the function and the first value of theta
  fn = L_bern, par = first,
  # our function L_bern is taking x,
  # this is our sample
  x = x,

  ## --- this is not used everytime ---

  # we are using upper/lower, we need
  # to add method = 'L-BFGS-B'
  method = 'L-BFGS-B',
  # p is within [0.0,1.0]           
  lower = 0.0, upper = 1.0
)

# the value of theta is in
r$par
```

The result is changing a lot, sometimes you
got a value close to $0.7$ and sometimes not.
If you are increasing $n$ like $n=25$, $n=100$ then
you will see that the value will converge to $0.7$.