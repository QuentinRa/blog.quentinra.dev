# Probabilities

Probabilities are a way to evaluate how much likely something is true, or likely to happens. For instance, if you're playing dice, you may want to know how much likely it is that you got 3 times "6" in a row.

* $\omega$ (small-omega) is an outcome possible <small>(such as 1 for a dice)</small>
* $\Omega$ (big-omega) is a set of all possible outcomes, also called sample/probability space <small>(such as {1,2,3,4,5,6} for a dice or {$\ x \mid x \in [1,6]\ $})</small>.
* $A$ is an event included in <span>$\Omega$. <small>It's almost everytime defined by a sentence like "the result is pair" giving a set like {2,4,6} for a dice.</small>
* $\overline{A}$ or $A^c$ means the opposite event of A, called complementary event and read as "not A".
* $\emptyset$ (empty set) means an impossible event.
* $Card(E) \Leftrightarrow |E| \Leftrightarrow \\#E$ is the cardinal of a set E, meaning the number of elements.

You may see/use these too

* an event of one element (singleton) is called an elementary event
* events that's can't happen simultaneously are called incompatible/disjoints/mutually exclusive events ([wiki](https://fr.wikipedia.org/wiki/%C3%89v%C3%A9nements_incompatibles))
* an event that will certainly happen is called a certain event.

<hr class="sl">

## Vocabulary and properties

$\mathbb{P}(A)$ means the probability of A happening and that's a value in $[0,1]$

* $\mathbb{P}(\Omega) = 1$ and $\mathbb{P}(\emptyset) = 0$
* $\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)$
* $\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) - \mathbb{P}(A \cap B)$
* $A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)$ (A included in B)
* $A \subset B \to \mathbb{P}(A \cap B) = \mathbb{P}(A)$
* $A \subset B \to \mathbb{P}(A \cup B) = \mathbb{P}(B)$

We call **distribution function**, a strictly positive function where the sum of all values (=probabilities) is 1. It's a function associating each value of $\Omega$ to their probability of happening ($f(x) \to \Omega$). When $x$ is taking finite values, we are using discrete probability otherwise, we are using continuous probabilities.

We call **support of X** $\bigtriangleup_X$ or $X(\Omega)$ the domain of the distribution function of X. The probability outside the support is 0. You can use that to make a sum on the support.

* [Counting techniques / combinatorics](discrete/counting.md)
* [Generating Functions](discrete/gf.md)

<hr class="sr">

## Discrete probability

When $\Omega$ is a finite set, then we are using discrete probabilities. That means the support is in $\mathbb{N}$ or $\mathbb{Z}$.

We are defining $\mathbb{P}(X=k)$ the probability that a discrete random variable (`variable aléatoire discrète`, v.a.d.) $X$ is taking the value $k$.

* We could write $P(X = 1) = y$ for a dice where y is the probability that we got 1 (<small>it's 1 out of 6 so y=1/6</small>).
* we may add a number $w$: $\mathbb{P}(X_w=k)$ if someone is using lazy naming like $X_1$, $X_2$, ...

We are calling **mass function** (`Fonction de masse`) the function giving us the value for $\mathbb{P}(X=k)$. A mass function is valid if

* the sum of the probabilities is **1**
* $\forall{x},\ f(x) \ge 0$

A lot of people are also calling this function the density function (implicitly "discrete density function") but I think this is confusing since the density function is associated with continuous variables. You could also see "(continuous) mass function" used with continuous variables, and my opinion is the same.

Let's dig more into it.

* [Calculate a discrete probability](discrete/calculate.md)
* [Independence](discrete/independence.md)
* [Expected value E(X)](discrete/expected-value.md)
* [Variance V(X)](discrete/variance.md)
* [Cumulative distribution function](discrete/cdf.md)

Now practice,

* [Exercises](discrete/exercises.md)

<hr class="sl">

## Continuous probability

When $\Omega$ isn't finite, then we are using continuous probabilities. That means the support is in $\mathbb{R}$.

The probability of taking a value is 0 for a continuous probability: $P(X=k)=0$. That's because the probability of each elementary event is converging to 0. And, the sum of every elementary event is converging to 1.

We need to introduce the **(probability) density function** (PDF) or `fonction de densité` $f_X(x)$ (or $f(x)$). The function is defined by

<div>
\[
\begin{split}
\mathbb{P}(x \in X) = \int_{x \in \Delta X}^{} f_X(x)dx \\
or\ \mathbb{P}(a \le X \le b) = \int_{a}^{b} f_X(x)dx \\
or\ \mathbb{P}(x \le a) = \mathbb{P}(x \lt a) = \int_{a}^{+\infty} f_X(x)dx \\
or\ \mathbb{P}(x \ge b) = \mathbb{P}(x \gt b) = \int_{-\infty}^{b} f_X(x)dx
\end{split}
\]
</div>

The density function **is valid if**

* $\int_{-\infty}^{+\infty} f_X(x)dx = 1$. <small>Sometimes you have some restrictions like $\lambda>0$, so you can reduce the interval.</small>
* $\forall{x},\ f_X(x) \ge 0$
* $f_X$ is continuous

The random variable $X$ is called continuous random variable (`variable aléatoire continue/réelle`).

* [Cumulative distribution function](continuous/cdf.md)
* [Expected value and variance](continuous/moments.md)
* [Moment-generating function](continuous/mgf.md)
* the idea behind the independence is the same
* [Characteristic function](continuous/characteristic.md)
* [Other notes](continuous/notes.md)

Now practice,

* [Exercises](continuous/exercises.md)

<hr class="sr">

## Joint probability distribution

Let X, Y be two random variables. The Joint probability $(X,Y) \in X(\Omega) * Y(\Omega)$ (cartesian product) is defined, for discrete variables, by

@
\mathbb{P}(X = x \cap Y = y)
\Leftrightarrow
\mathbb{P}(X = x,\ Y = y)
\Leftrightarrow
\mathbb{P}(x, y)
@

and for continuous variables, by

@
\mathbb{P}((a \le X \le b) \cap (c \le Y \le d))
= \int_{a}^{b} \int_{c}^{d} f_{X,Y}(x, y)\ dx\ dy
@

This notion can be extended to n variables. In French, we are calling 2 variables a `couple` of random variables, while we are calling n variables a vector/`vecteur` of random variables.

The name Bi-variate distribution is used for the joint distribution of two variables. The opposite would be Multi-variate distribution.

* [Bi-variate distribution tip](jp/bi-variate.md) (if the cardinals are small)
* [Marginal Distribution](jp/marginal.md)
* [Moments, Independence, ...](jp/props.md)
* [Conditional Distribution](jp/conditional.md)

<hr class="sl">

## Distributions

Here are some well-known distributions (Functions/Laws also called `Fonctions` or `Lois` in French)

We usually write $X \sim L$ that you should read as "X follows a L distribution" (with L a distribution like Poisson/...).

Discrete distributions

* [Bernoulli distribution](dist/bernoulli.md)
* [Binomial distribution](dist/binom.md)
* [Discrete Uniform distribution](dist/uniform-d.md)
* [Geometric distribution](dist/geometric.md)
* [Hypergeometric distribution](dist/hyper-geometric.md)
* [Poisson distribution](dist/poisson.md)

Continuous distributions

* [Normal distribution](dist/normal.md)
* [Continuous Uniform distribution](dist/uniform-c.md)
* [Exponential distribution](dist/exp.md)

<hr class="sr">

## Convergence

We are considering n random variables Y and X a variable giving us with a function $f$

@
X_n = f(Y_1,\ \ldots,\ Y_n)
@

We 4 notions of convergence

* [Almost sure convergence](limit/as.md)
* [Convergence in probability](limit/proba.md)
* [Convergence in distribution](limit/dist.md)
* [Convergence in (quadratic/square) mean](limit/mean.md)

And according to the Central limit theorem/`Théorème de la limite centrale`, a sequence of random variables when $n \to +\infty$ converges to a normal distribution.

<hr class="sl">

## CheatSheet

Here are some sheets that I looked up for you. I didn't read them yet.

* [probability_cheatsheet.pdf](https://www.sas.upenn.edu/~astocker/lab/teaching-files/PSYC739-2016/probability_cheatsheet.pdf)
* [probability-and-statistics](https://github.com/shervinea/stanford-cme-106-probability-and-statistics)
* [cheatsheet-probability](https://stanford.edu/~shervine/teaching/cme-106/cheatsheet-probability)

And here is a summary of all [distributions](dist/summary.md).

<hr class="sr">

## Sources

This is a list of all Wikipedia pages that you may want to check

* <https://en.wikipedia.org/wiki/Expected_value>
* <https://en.wikipedia.org/wiki/Variance>
* <https://en.wikipedia.org/wiki/Chebyshev%27s_inequality>
* <https://en.wikipedia.org/wiki/Probability_mass_function>
* <https://en.wikipedia.org/wiki/Cumulative_distribution_function>
* <https://en.wikipedia.org/wiki/Quantile_function>
* <https://en.wikipedia.org/wiki/Moment-generating_function>
* <https://en.wikipedia.org/wiki/Indicator_function>
* <https://en.wikipedia.org/wiki/Chebyshev%27s_inequality>
* <https://en.wikipedia.org/wiki/Conditional_expectation>

Distributions

* <https://en.wikipedia.org/wiki/Marginal_distribution>
* <https://en.wikipedia.org/wiki/Joint_probability_distribution>
* <https://en.wikipedia.org/wiki/Bernoulli_distribution>
* <https://en.wikipedia.org/wiki/Binomial_distribution>
* <https://en.wikipedia.org/wiki/Discrete_uniform_distribution>
* <https://en.wikipedia.org/wiki/Geometric_distribution>
* <https://en.wikipedia.org/wiki/Hypergeometric_distribution>
* <https://en.wikipedia.org/wiki/Poisson_distribution>
* <https://en.wikipedia.org/wiki/Normal_distribution>
* <https://en.wikipedia.org/wiki/Continuous_uniform_distribution>
* <https://en.wikipedia.org/wiki/Exponential_distribution>

Convergence

* <https://en.wikipedia.org/wiki/Convergence_of_random_variables>
* <https://en.wikipedia.org/wiki/Law_of_large_numbers>
* <https://en.wikipedia.org/wiki/Central_limit_theorem>

[other references](refs.md)