# Generating function

[Go back](..)

When dealing with combinatorics, generating
functions (`Fonction génératrice`)
can make your life easier!

You will write a function, where
$a_k * x^k$ means that you if you 

* if you have $n=k$
* then the number of distributions $a_k$

For instance, let's say your result is
$5 x^2 + 4 x^3 + ...$ then that's means that
if $n=2$ then the number of distributions is $5$...

It's usually defined like this

<div>
\[
G(x) = \sum_{k \in N} a_k * x^k
\]
</div>

<hr class="sl">

## Creating a generating function

If we got $k$ issues
and $m$ experiments ($m = Card(X)$ for instance)
then we would have

<div>
\[
G(x) = \prod_{j=1}^{m} \sum_{i=k_j}^{n_j} x^i
\]
</div>

* this is a product of sums
* for each value of X (indexed by $j$)
* we calculate a sum,
* from $k_j$ (the minimum of times you want this value)
* to $n_j$ (the maximum of times you want this value)
* once you multiplied and factorized the result, $x^n$ if the number of distributions for $n$.