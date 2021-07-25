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
* $\overline{A}$ or $A^c$ means the opposite
  event of A, called complementary event and
  read as "not A".
* $\emptyset$ (empty set)
  means an impossible event.
* $Card(E) \Leftrightarrow |E| \Leftrightarrow \\#E$ is the cardinal of
  a set E, meaning the number of elements.

You may see/use these too

* an event set of one element (singleton) is called
  an elementary event
* events that's can't happens simultaneously are
  called incompatible/disjoints/mutually exclusive events ([wiki](https://fr.wikipedia.org/wiki/%C3%89v%C3%A9nements_incompatibles))
* an event that will certainly happens is called a certain event.

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

We are calling **mass function** (`Fonction de masse`)
the function giving us the value for $\mathbb{P}(X=k)$.
A mass function is valid if

* the sum of the probabilities is **1**
* probabilities are in $[0,1]$

A lot of persons are also calling this
function the density function (implicitly
"discrete density function") but I think
this is confusing since the density function
is associated with continuous variables.

Let's dig more into it

* [Calculate a discrete probability](discrete/calculate.md)
* [Counting techniques](discrete/counting.md)
* [Independence](discrete/independence.md)
* [Expected value E(X)](discrete/expected-value.md)
* [Variance V(X)](discrete/variance.md)
* [Cumulative distribution function](discrete/cdf.md)

Now practice,

* [Exercises](discrete/exercises.md)

<hr class="sr">

## Continuous probability

When $\Omega$ isn't finite,
then we are using continuous probabilities.
That means the support is
in $\mathbb{R}$.

The probability of taking a value is 0 for
a continuous probability: $P(X=k)=0$. That's because
theses elementary events are converging to 0
because the sum of all elementary events is converging
to 1.

We need to introduce the **(probability) density function** (PDF)
or ``fonction de densité/de masse/marginale`` $f_X(x)$. The function is defined
by 

<div>
\[
\displaylines{
\mathbb{P}(x \in X) = \int_{x \in \Delta X}^{} f_X(x)dx \\
or\ \mathbb{P}(a \le X \le b) = \int_{a}^{b} f_X(x)dx \\
or\ \mathbb{P}(x \le a) = \mathbb{P}(x \lt a) = \int_{a}^{+\infty} f_X(x)dx \\
or\ \mathbb{P}(x \ge b) = \mathbb{P}(x \gt b) = \int_{-\infty}^{b} f_X(x)dx
}
\]
</div>

The density function **is valid if**

* $\int_{-\infty}^{+\infty} f_X(x)dx = 1$.
  <span class="tms">
  Sometimes
  you have some restrictions like $\lambda>0$ so you can
  reduce the interval.
  </span>
* $\forall{x},\ f(x) \ge 0$
* the function is continue

Let's dig more into it

* [Cumulative distribution function](continuous/cdf.md)
* [Expected value and variance](continuous/moments.md)
* [Moment-generating function](continuous/mgf.md)
* the idea behind the independence is the same

<hr class="sr">

## Joint probability (NEED TO BE REMADE :3)

We are calling Joint probability distribution (X,Y)
or ``loi d’un couple/conjointe`` a distribution
of two (or more) variables jointed.

The joint mass function is

@
\forall{i,j}\hspace{1cm} \mathbb{P}(X = x_i \cap Y = y_j)
@

the joint density function is a bit complicated but
that's the same idea but using the repartition function.
Still, the usual distribution properties must be fulfilled

* the sum of all probabilities is **1**
* all values are in $[0,1]$

Note that $\mathbb{P}(X = x_i \cap Y = y_j)$
is also written $\mathbb{P}(x_i,\ y_j)$ or
$\mathbb{P}(X = x_i,\ Y = y_j)$.

* [Contingency table](jp/table.md)
* [Marginal Distribution](jp/marginal.md)
* [Conditional probability distribution](jp/cpd.md)
* the independence between two distributions
  is defined like the independence between two variables.

<hr class="sl">

## Distributions

Here are some well-known distributions
(Functions/Laws also called ``Fonctions`` or ``Lois`` in French)

We usually write $X \sim L$
that you should read as
"X follows a L distribution" (with L a distribution
like Poisson/...).

Discrete distributions

* [Bernoulli distribution](dist/bernoulli.md)
* [Binomial distribution](dist/binom.md)
* [Discrete Uniform distribution](dist/uniform.md)
* [Hypergeometric distribution](dist/hyper-geometric.md)

Continuous distributions

* [Geometric distribution](dist/geometric.md)
* [Poisson distribution](dist/poisson.md)

<hr class="sl">

## Sources

* <https://en.wikipedia.org/wiki/Expected_value>
* <https://en.wikipedia.org/wiki/Variance>
* <https://en.wikipedia.org/wiki/Chebyshev%27s_inequality>
* <https://en.wikipedia.org/wiki/Probability_mass_function>
* <https://en.wikipedia.org/wiki/Cumulative_distribution_function>
* <https://en.wikipedia.org/wiki/Quantile_function>
* <https://en.wikipedia.org/wiki/Moment-generating_function>
* <https://en.wikipedia.org/wiki/Indicator_function>
* <https://towardsdatascience.com/moment-generating-function-explained-27821a739035>
* <https://math.stackexchange.com/questions/597008/exponential-distribution-moment-generating-function-to-find-the-mean>
* <https://en.wikipedia.org/wiki/Chebyshev%27s_inequality>
* <https://en.wikipedia.org/wiki/Conditional_expectation>

Distributions

* <https://en.wikipedia.org/wiki/Marginal_distribution>
* <https://en.wikipedia.org/wiki/Joint_probability_distribution>
* <https://en.wikipedia.org/wiki/Bernoulli_distribution>
* <https://en.wikipedia.org/wiki/Binomial_distribution>
* <https://en.wikipedia.org/wiki/Poisson_distribution>
* <https://en.wikipedia.org/wiki/Geometric_distribution>
* <https://en.wikipedia.org/wiki/Exponential_distribution>
* <https://en.wikipedia.org/wiki/Hypergeometric_distribution>
* <https://en.wikipedia.org/wiki/Discrete_uniform_distribution>
* <https://en.wikipedia.org/wiki/Continuous_uniform_distribution>

[other references](refs.md)