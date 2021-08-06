# Likehood functions (examples)

[Go back](../index.md#estimators-and-likehood)

You may replace any usage of the Likehood function
by the Log-Likehood function.

...

<hr class="sl">

## Bernoulli

```r
# first does not matter since we added bounds
first <- 0.0

r <- optim(
  fn = L_bern, par = first, x = x,
  method = 'L-BFGS-B', lower = 0.0, upper = 1.0
)
```