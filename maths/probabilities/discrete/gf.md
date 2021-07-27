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

<hr class="sl">

## Example (1)

Let's say you are rolling two dices.
You got $m=2$ and each experiment
goes from $k_1=k_2=1$ to $n_1=n=2=6$.
We will have 

<div>
\[
\displaylines{
G(x) = (\sum_{i=1}^{6} x^i) * (\sum_{i=1}^{6} x^i)
= (x+x^2+x^3+x^4+x^5+x^6)^2 \\
= 
x^2 + 
2 x^3 +
3 x^4 + 
4 x^5 + 
5 x^6 + 
6 x^7 + 
5 x^8 + 
4 x^9 + 
3 x^{10} + 
2 x^{11} + 
x^{12}
}
\]
</div>

If you are asked the number of distributions or
the cardinal for when the num is $7$ then the answer
is $6$ etc.

You can develop easily using websites
like [wolframalpha](https://www.wolframalpha.com/input/?i=%28x%2Bx%5E2%2Bx%5E3%2Bx%5E4%2Bx%5E5%2Bx%5E6%29%5E2).