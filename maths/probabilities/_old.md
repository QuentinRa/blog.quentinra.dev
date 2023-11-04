# Vocabulary and properties

We call **distribution function**, a strictly positive function where the sum of all values (=probabilities) is 1. It's a function associating each value of $\Omega$ to their probability of happening ($f(x) \to \Omega$). When $x$ is taking finite values, we are using discrete probability otherwise, we are using continuous probabilities.

We call **support of X** $\bigtriangleup_X$ or $X(\Omega)$ the domain of the distribution function of X. The probability outside the support is 0. You can use that to make a sum on the support.

* [Generating Functions](discrete/gf.md)

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

And here is a summary of all [distributions](dist/summary.md).