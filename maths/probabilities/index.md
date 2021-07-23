# Probabilities

In this course, we will cover all the basics about
probabilities and some advanced concepts that
will be used in other courses.

* $\omega$ (small-omega)
  is a result possible 
  <span class="tms">such as 1 for a dice</span>
* $\Omega$ (big-omega)
  is a set of all possible outcomes,
  also called sample space
  <span class="tms">such as {1,2,3,4,5,6} for a dice
  or {$\ x \mid x \in [1,6]\ $}</span>.
* $A$ is an event included in <span>
  $\Omega$. <span class="tms">
  It's almost everytime defined
  by a sentence like "the result is pair"
  giving a set like {2,4,6} for a dice.
  </span>
* $\overline{A}$ means the opposite
  event of A.
* $\emptyset$ (empty set)
  means an impossible event.
* $Card(E) = |E| = \\#E$ is the cardinal of
  a set E, meaning the number of elements.

We are calling **elementary events**, events sets
made of only one outcome (singletons) in
the sample space.

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
the probability that a random variable 
(``variable aléatoire discrète``, v.a.d.) $X_w$ is taking the value $k$.

* We could write $P(X = 1) = y$ for a dice where y is
  the probability that we got 1 <span class="spoiler tms">it's 1 out of 6 so y=1/6</span>.
* $w$ may be omitted if you got only one variable called $X$

Let's dig more into it

* [Calculate a discrete probability](discrete/calculate.md)
* [Counting](discrete/counting.md)
* [Independence](discrete/independence.md)
* [Expected value E(X)](discrete/expected-value.md)
* [Variance V(X)](discrete/variance.md)

And here are some well-known distributions
(also called ``Fonctions`` or ``Lois`` in French)

* [Bernoulli distribution](dist/bernoulli.md)
* [Binomial distribution](dist/binom.md)
* [Poisson distribution](dist/poisson.md)
* [Geometric distribution](dist/geometric.md)

And

* [Exercises](discrete/exercises.md)

<hr class="sr">

## Sources

* <https://en.wikipedia.org/wiki/Expected_value>
* <https://en.wikipedia.org/wiki/Variance>
* <https://en.wikipedia.org/wiki/Chebyshev%27s_inequality>

Distributions

* <https://en.wikipedia.org/wiki/Bernoulli_distribution>
* <https://en.wikipedia.org/wiki/Binomial_distribution>
* <https://en.wikipedia.org/wiki/Poisson_distribution>
* <https://en.wikipedia.org/wiki/Geometric_distribution>