# Maximum Likelihood estimation (MLE)

[Go back](..)

In the likelihood function example, we had $\theta=(p=0.7)$ (we are usually writing $\theta = (0.7)$, but I added p for you). We tested all the values of $p$ from 0 to 1, and we are able to see clearly a maximum for $p=0.6$ giving us $\hat{\theta} = (0.6)$. We call this value, the maximum likelihood estimation (MLE). This is a mix of statistics and optimization, because we have to maximize the likelihood function.

Steps

* write your likelihood function
* pick your first parameters
* optimize the function, starting from the first parameter

If you are on paper, you have to do the derivative of the likelihood function, and solve $\hat\theta$ (from my understanding, that is). Check the optimization course if needed.

<hr class="sl">

## Note

In my school, we are

* generating a sample $Bern(0.7)$
* then the first parameter used in the optimization is $p=0.7$

That's cheating... You are not supposed to know the real parameters otherwise you would not have to look for them, but well... If you don't want to do that, I managed to found some parameters values in the example section. For instance, the first parameter for a Bernoulli distribution could be

* the number of successes in the sample
* divided by the size of the sample

And now you got your first value without cheating.

<hr class="sr">

## Bernoulli MLE (1)

We found in the previous example that for $(1,0,1,1,0)$, the likelihood function was $L(x,p)=p^3 * (1-p)^2$. Since $p \in [0,1]$, we can write

```r
# test with values from 0 to 1 (0.1, 0.2, ...)
for(p in seq(from = 0, to = 1, length = 11))
  print(paste("L(x,", p, ")=", p^3 * (1-p)^2))
# [1] "L(x, 0 )= 0"
# [1] "L(x, 0.1 )= 0.00081"
# [1] "L(x, 0.2 )= 0.00512"
# [1] "L(x, 0.3 )= 0.01323"
# [1] "L(x, 0.4 )= 0.02304"
# [1] "L(x, 0.5 )= 0.03125"
# [1] "L(x, 0.6 )= 0.03456"
# [1] "L(x, 0.7 )= 0.03087"
# [1] "L(x, 0.8 )= 0.02048"
# [1] "L(x, 0.9 )= 0.00729"
# [1] "L(x, 1 )= 0"
```

It seems that the maximum likelihood estimation is around $p=0.6$. The real value was $p=0.5$, so it's not that bad. The sample is small (n=$5$), so an error (be it small like here or not) was to be expected.

Of course, this is not very accurate since we are only testing $10$ values, so we should do something accurate like you will see below or in the optimization course.

<hr class="sl">

## Bernoulli MLE (2)

In R, you may use ``optim`` or `optimize`. I'm enjoying ``optim``. For the `L_bern` function we created, the maximum likelihood estimation would be evaluated like this

```r
# first value of theta-hat
# we are "cheating" and using the p we used
# to generate the sample (p=0.7)
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

The result is changing a lot, sometimes you got a value close to $0.7$ and sometimes not. If you are increasing $n$ like $n=25$, $n=100$ then you will see that the value will converge to $0.7$.