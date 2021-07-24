# Probabilities

In this course, we will cover all the basics about
probabilities and some advanced concepts that
will be used in other courses.

* $\omega$ (small-omega)
  is an outcome possible 
  <span class="tms">such as 1 for a dice</span>
* $\Omega$ (big-omega)
  is a set of all possible outcomes,
  also called sample/probability space
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
* $Card(E) \Leftrightarrow |E| \Leftrightarrow \\#E$ is the cardinal of
  a set E, meaning the number of elements.

You may see/use these too

* an event set of one element (singleton) is called
  an elementary event
* events that's can't happens simultaneously are
  called incompatible events ([wiki](https://fr.wikipedia.org/wiki/%C3%89v%C3%A9nements_incompatibles))

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
* $A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)$ (A included in B)
* $A \subset B \to \mathbb{P}(A \cap B) = \mathbb{P}(A)$
* $A \subset B \to \mathbb{P}(A \cup B) = \mathbb{P}(B)$

We call **distribution function**, a strictly positive
function where the sum of all values (=probabilities) is 1.
It's a function associating each value of
$\Omega$ to their probability.

We call **support** $\bigtriangleup$ 
a set where the distribution function is defined
(=domain). The probability
outside the support is 0. You can use that to make a sum
on the support.

<hr class="sl">

## Discrete probability

When $\Omega$ is a finite set, 
then we are using discrete probabilities.
That means the support is
in $\mathbb{N}$ or $\mathbb{Z}$.

We are defining $\mathbb{P}(X=k)$ the probability that a random variable 
(``variable aléatoire discrète``, v.a.d.) $X$ is taking the value $k$.

* We could write $P(X = 1) = y$ for a dice where y is
  the probability that we got 1 (<span class="tms">it's 1 out of 6 so y=1/6</span>).
* we may add a number $w$: $\mathbb{P}(X_w=k)$
  if someone is using lazy naming like $X_1$, $X_2$, ...

Let's dig more into it

* [Calculate a discrete probability](discrete/calculate.md)
* [Counting](discrete/counting.md)
* [Independence](discrete/independence.md)
* [Expected value E(X)](discrete/expected-value.md)
* [Variance V(X)](discrete/variance.md)

And here are some well-known distributions
(also called ``Fonctions`` or ``Lois`` in French)

* [discrete distribution requirements](discrete/dist/requirements.md)
* [Bernoulli distribution](discrete/dist/bernoulli.md)
* [Binomial distribution](discrete/dist/binom.md)
* [Poisson distribution](discrete/dist/poisson.md)
* [Geometric distribution](discrete/dist/geometric.md)

Now practice,

* [Exercises](discrete/exercises.md)

<hr class="sr">

## Continuous probability

When $\Omega$ isn't finite,
then we are using continuous probabilities.
That means the support is
in $\mathbb{R}$.

The probability of $P(X=k)=0$ because taking
one value

* [Cumulative distribution function](continuous/cdf.md)
* [Moment-generating function](continuous/mgf.md)

<hr class="sr">

## Sources

* <https://en.wikipedia.org/wiki/Expected_value>
* <https://en.wikipedia.org/wiki/Variance>
* <https://en.wikipedia.org/wiki/Chebyshev%27s_inequality>
* <https://en.wikipedia.org/wiki/Probability_mass_function>
* <https://en.wikipedia.org/wiki/Cumulative_distribution_function>
* <https://en.wikipedia.org/wiki/Quantile_function>
* <https://en.wikipedia.org/wiki/Moment-generating_function>

Distributions

* <https://en.wikipedia.org/wiki/Bernoulli_distribution>
* <https://en.wikipedia.org/wiki/Binomial_distribution>
* <https://en.wikipedia.org/wiki/Poisson_distribution>
* <https://en.wikipedia.org/wiki/Geometric_distribution>