# Math

[Go back](../index.md)

This page list functions that you may use when doing some math. Each course using R will give you more functions/explanations.

<hr class="sl">

## General functions

* **summary(x)** (mean, min, ...)
* **mean(x)**
* **median(x)**
* **var(x)** (variance)
* **cov(x)** (covariance)
* **cor(x)** (correlation)

And you may use

* **runif(n)**: n random values between 0 and 1
* **choose(n,k)**: $C^k_n$ (picking $k$ elements among $n$)
* **factorial(n)**: $n!$
* **min(v)**, **max(v)**

<hr class="sr">

## Dealing with vectors

* **seq(from = x, to = y, length = n)**

Create $n$ values inside $[x,y]$. It's something like $step=\frac{y-x}{n-1}$ then you got 

<div>
\[
\sum_{i=0}^{n-1} x + step*i
\]
</div>

* **rep(v, n)**: repeat $v$ (vector) $n$ times
* **sample(v, n)**: extract $n$ elements from $v$
* **sample(v, n, replace = T)**: with replacement
* **subset(d, cond, var)**: extract elements for which condition is true
    * for instance if we have d\\$var, and we want d\\$var > 10
    * **subset(d, var > 10, var)**
* **cut(x, breaks = v,include.lowest = TRUE)**

Cut a vector in intervals. Like  $v=c(1,3,5)$ will be $[min,1] \cup ]1,3] \cup ]3,5]$.

<hr class="sl">

## Unused

* **circular** (`cercle trigonométrique`)
* **outer** (Truth table)
* **iqr** (interquartile range)
* **Re**, **Mod**, **Img**, **Arg**, **Conj**
* **crossprod**: scalar product
* **iconv**: deal with accents
* **Sys.Date**, **Sys.Timezone**, **format**, **weekdays**, **months**, **difftime**
* **dist**: distance
* **polyroot**: roots of a polynomial equation
* **uniroot**: $f(x) = 0$
* **integrate(f, lower = 0, upper = 1)**
* **taylor** (package pracma)