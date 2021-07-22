# Probabilities

In this course, we will cover all the basics about
probabilities and some advanced concepts that
will be used in other courses.

* $\omega$ (small-omega)
  is a result possible 
  <span class="tms">such as 1 for a dice</span>
* $\Omega$ (big-omega)
  is a set of all possible results
  <span class="tms">such as {1,2,3,4,5,6} for a dice
  or {$\ x \mid x \in [1,6]\ $}</span>.
* $A$ is an event included in <span>
  $\Omega$. <span class="tms">
  It's almost everytime defined
  by a sentence like "the result is pair".
  </span>
* $\overline{A}$ means the opposite
  event of A.
* $\emptyset$ (empty set)
  means an impossible event.
* $Card(E) = |E| = \\#E$ is the cardinal of
  a set E, meaning the number of elements.

<hr class="sl">

## Vocabulary and properties

$\mathbb{P}(A)$ 
means the probability of A
happening and that's a value in
$[0,1]$

* $\mathbb{P}(\Omega) = 1$ and $\mathbb{P}(\emptyset) = 0$
* $\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)$
* $\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) -
  \mathbb{P}(A \cap B)$
* $A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)$

We call **distribution function**, a strictly positive
function where the sum of all values (=probabilities) is 1.
It's a function associating each value of
$\Omega$ to their probability.

We call **support** a set where the distribution function is defined. The probability
outside the support is 0. You can use that to make a sum on the support.

<hr class="sl">

## Discrete probability

When $\Omega$ is a finite set then we are dealing
with discrete probability. That's the case when $\Omega$
is taking values in $\mathbb{N}$ or $\mathbb{Z}$.

We are defining $\mathbb{P}_{X_w}{k} = \mathbb{P}(X_w=k)$
the probability that a random variable $X_w$
is taking the value $k$.

* We could write $P(X = 1) = y$ for a dice where y is
  the probability that we got 1.
* $w$ may be omitted if you got only one variable called $X$

Let's dig more into it

* [Calculate a discrete probability](discrete/calculate.md)
* [Counting](discrete/counting.md)
* [Independence](discrete/independence.md)