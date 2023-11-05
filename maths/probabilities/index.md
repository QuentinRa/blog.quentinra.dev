# Probabilities

<div class="row row-cols-lg-2"><div>

A probability is a value between zero and one characterizing how likely an event may occur.

* 🛣️ $\omega$ (small-omega) is an outcome possible
* 🗺️ $\Omega$ (big-omega) is a set of all possible outcomes, also called sample/probability space
* 📌 $A$ is an event included in <span>$\Omega$. It's often  defined by a sentence. If it has only one outcome, it's called an elementary event.
* 🌍 $\overline{A}$ or $A^c$ is opposite/complementary event of A <small>(read as "not A")</small>.
* ⛔ $\emptyset$ (empty set) means an impossible event.

👉 Events "incompatible/disjoints/mutually exclusive events" are events that can't happen simultaneously.
</div><div>

We write $\mathbb{P}(A)$ the probability of A occuring. It's a value in $[0,1]$.

* $\mathbb{P}(\Omega) = 1$ and $\mathbb{P}(\emptyset) = 0$
* $\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)$

For instance, we are rolling a die 3 times in a row 🎲.

* An outcome is 🛣️: $(6, 1, 2)$
* The probability space 🗺️: $\lbrace\ (x, y, z) \mid x y z \in [1,6]\ \rbrace$
* An event $A$ 📌: having 3 times 6, e.g., $(6, 6, 6)$
* Complementary event $\overline{A}$ 🌍: not having 3 times 6
* An impossible event ⛔: ...
* $P(A) = \frac{1}{6^3}$
</div></div>

<hr class="sep-both">

## Combinatorics

<div class="row row-cols-lg-2"><div>

The cardinal of $E$ means the number of elements of $E$. We use these notations: $card(E) \Leftrightarrow |E| \Leftrightarrow \\#E$. We will need to know the cardinal of $\Omega$ or an event to use most formulas.

For instance, let's say you have a sample space `"rolling a die 9 times"` and an event $A=$`"having a sum > 50"`. What is $card(A)$?

We have a few techniques we can use. Assuming $card(E) = k$, according to the event $A$, we will pick $n$ outcomes from $E$.

* `without replacement`: we can take an element only once
* `ordered`: we consider $(1, 2)$ and $(2, 1)$ to be different

📚 We use `{...}` for unordered outcomes, and `(...)` for ordered outcomes: `{(5,1),(1,5)}` <small>(ordered)</small> vs `{{1,5}}` <small>(unordered)</small>.

➡️ See also: [Counting Examples](_examples/counting.md).

<br>

#### Ordered sampling with replacement

It means each value can be picked $n$ times.

@
k^n
@

⚠️ You must make sure that you are not inverting $k$ and $n$.
</div><div>

#### Ordered sampling without replacement

Since k is decreasing by 1 after each pick, it's a factorial: $n! = n * (n-1)!$ and $1! = 1$. For example, $5!=5\*4\*3\*2\*1$.

@
A^k_n = \frac{k!}{(k-n)!}
@

When $k = n$, $A^k_n = k!$, we call it a permutation. When the elements are not unique, we use:

@
\frac{n!}{\prod_i o_i!}
@

➡️ $A^k_n$ is called an Arrangement.

#### Unordered sampling without replacement

@
\frac{k!}{(k-n)! * n!}
\Leftrightarrow
\frac{A^k_n}{n!}
@

#### Unordered sampling with replacement

@
C^{k-1}_{n+k-1} = \frac{(n+k-1)!}{(k-1)! * n!}
@

➡️ $C^k_n$ is called a Combination.
</div></div>

<hr class="sep-both">

## Discrete probability

<div class="row row-cols-lg-2"><div>

Discrete probability refers to the branch of probability theory that deals with finite random variables, e.g., in $\mathbb{N}$ or $\mathbb{Z}$.

We are defining $\mathbb{P}(X=k)$ the probability that a discrete random variable $X$ is taking the value $k$. We are calling mass function the function giving us the result of $\mathbb{P}(X=k)$. This function is valid if:

* The sum of all probabilities is 1
* $\forall{x},\ f(x) \ge 0$

➡️ See also: [Discrete Probability Examples](_examples/discrete.md).

#### Discrete Formulas

Using combinatorics to get the cardinal:

@
\mathbb{P}(A) = \frac{card(A)}{card(\Omega)} = \frac{|A|}{|\Omega|}
@

When each event has the same probability of occuring, it's called an uniform probability and the formula is simpler:

@
\forall{w} \in \Omega\quad \text{then}\quad \mathbb{P}(w) = \frac{1}{card(\Omega)}
@

A conditional probability is when, knowing that another event $B$ occured, we want to know of probability of $A$ occurring.

@
\mathbb{P}(A|B) = P_B(A) = P(B \wedge A) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}
@

* $\mathbb{P}(\overline{A}|B) = 1 - \mathbb{P}(A|B)$
* $\mathbb{P} (B \cup C|A) = \mathbb{P}(B|A) + \mathbb{P}(C|A) − \mathbb{P}(B ∩ C|A)$
* You may be able to compute $\mathbb{P}(A|B)$ with the first formula

#### Discrete Transformations

We can use Bayes theorem:

@
\mathbb{P}(A \cap B) = \mathbb{P}(B) * \mathbb{P}(A|B)
\equiv \mathbb{P}(A) * \mathbb{P}(B|A)
@

We can use the law of total probability:

<div>
\[
\begin{split}
\mathbb{P}(B) = \mathbb{P}(B \cap \Omega)
= \mathbb{P}((A_1 \cap B) \cup (A_2 \cap B) \cup \ldots) 
\\ = \mathbb{P}(A_1 \cap B) + \mathbb{P}(A_2 \cap B) + \ldots \\
= \mathbb{P}(A_1) * \mathbb{P}(B|A_1) + \mathbb{P}(A_2) * \mathbb{P}(B|A_2) + \ldots
\end{split}
\]
</div>

We can use the probability chain rule:

<div>
\[
\prod_{i=1}^n \mathbb{P}(A_i | \bigcap_{j=1}^{i-1} A_j)
\]
</div>

For instance, if $n=4$, we got

<div>
\[
\begin{split}
\mathbb{P}(A_4 \cap A_3 \cap A_2 \cap A_1) 
= \\
\mathbb{P}(A_1) *
\mathbb{P}(A_2|\ A_1) *
\mathbb{P}(A_3|\ A_2 \cap A_1) *
\mathbb{P}(A_4|\ A_3 \cap A_2 \cap A_1)
\end{split}
\]
</div>

A few other formulas that may be handy:

* $\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) - \mathbb{P}(A \cap B)$
* $A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)$ <small>(A included in B)</small>
* $A \subset B \to \mathbb{P}(A \cap B) = \mathbb{P}(A)$
* $A \subset B \to \mathbb{P}(A \cup B) = \mathbb{P}(B)$
</div><div>

#### Discrete Expected value

The expected value noted $\mathbb{E}(X)$, $\mathbb{E}X$, or $\mathbb{E}[X]$ is defined by:

<div>
\[
\sum_{x_i \in \Omega}^{} x_i \mathbb{P}{(X_w = x_i )}
\]
</div>

* $\mathbb{E}(X)$ is also called the (weighted) mean
* $\mathbb{E}(X)$ is also called [the first moment](https://en.wikipedia.org/wiki/Moment_(mathematics)#Mean)
* $\mathbb{E}[X, \lambda Y] = \mathbb{E}[Y] + \lambda \mathbb{E}[Y]$
* $\mathbb{E}(X) \ge 0$ and if $X \ge Y$ then $\mathbb{E}(X) \ge \mathbb{E}(Y)$
* $\mathbb{E}[X * Y] = \mathbb{E}[X] * \mathbb{E}[Y]$ if both are independant, otherwise $\mathbb{E}[X * Y] = \sum_{i,j} x_i * y_i * p_{ij}$.
* $\mathbb{E}(X) = \frac{n+1}{2}$ for an uniform probability
* Cauchy-Schwarz: $\mathbb{E}[XY]^2 \le \mathbb{E}[X^2] * \mathbb{E}[Y^2]$

#### Discrete Variance

The variance is the square deviation around the expected value.

<div>
\[
\begin{align}\begin{aligned}V(X) = \mathbb{E}[(X - \mathbb{E}[X])^2]\\V(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2\end{aligned}\end{align}
\]
</div>

* $V(X) = \sigma^2$ with sigma the standard deviation
* $V(\lambda X^2) = \lambda^2 V(X)$
* $V(a + \lambda X^2) = \lambda^2 V(X)$
* $V(X + Y) = V(X) + V(Y) - 2cov(XY)$
* $V(X)$ is also called [the second central moment](https://en.wikipedia.org/wiki/Moment_(mathematics)#Variance)

#### Discrete Covariance/co-variance (cov)

It's used to evaluate the conjoint variance of two
random variables.

<div>
\[
\begin{align}\begin{aligned}cov(x,y) = \mathbb{E}[ ( X - \mathbb{E}[X]) (Y - \mathbb{E}[Y]) ]\\cov(x,y) = \mathbb{E}[XY] - \mathbb{E}[X] \mathbb{E}[Y]\end{aligned}\end{align}
\]
</div>

* $cov(X,X) = V(X)$
* $cov(X,Y) = cov(Y,X)$
* $cov(\lambda * X,Y) =  \lambda *cov(Y,X)$
* $cov(\lambda * X) =  \lambda^2 *cov(X)$
* $cov(A+B,C) = cov(A,C) + cov(B,C)$
* if $X \perp Y$ then $cov(XY) = 0$
* $\mathbb{P}(X, Y) = \frac{cov(X,Y)}{\sqrt{V(X)*V(Y)}}$

#### Discrete Independence

Random variables are independent ($\perp$ perp) if the product of the probabilities is equals to the probability of the events  $X_1, ..., X_n$.

<div>
\[
\mathbb{P}(X_1 = x_1\ \cap\ \ldots\ \cap\ X_n = x_n) = \prod_{i=1}^n \mathbb{P}(X_i = x_i)
\]
</div>

➡️ Alternative way: checking $\mathbb{P}(A|B) = \mathbb{P}(A)$ or $\mathbb{P}(B|A) = \mathbb{P}(B)$.

#### Discrete Cumulative distribution function

The cumulative distribution function (CDF) $F_X(k)$ is the primitive of the mass function, meaning that deriving the CDF will give you the mass function. $F_X(k)$ is the probability of $\mathbb{P}(X \le k)$.

<div>
\[
\mathbb{P}(X \le k) = \sum_{i=0}^{k} \mathbb{P}(X=i)
\]
</div>

For instance, $P(X\le3) = P(X=0) + P(X=1) + P(X=2) + P(X=3)$.
</div></div>

<hr class="sep-both">

## Continuous probability

<div class="row row-cols-lg-2"><div>

Continuous probability refers to the branch of probability theory that deals with non-finite random variables, e.g., in $\mathbb{R}$.

The probability of taking a value is 0: $P(X=k)=0$ because the probability of each elementary event is converging to 0, while the sum of all elementary events is converging to 1.

➡️ See also: [Continuous Probability Examples](_examples/continuous.md).

#### Probability Density Function

The probability density function $f_X(x)$ (or $f(x)$) is defined as:

* $\int_{-\infty}^{+\infty} f_X(x)dx = 1$ <small>(we can reduce the interval if we have constraints)</small>
* $\forall{x},\ f_X(x) \ge 0$
* $f_X$ is continuous

We can use it to compute probabilities:

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

📚 The support of X $\bigtriangleup_X$ or $X(\Omega)$ is the domain of the density function. It means a probability outside of the support is $0$. 

#### Continuous Cumulative distribution function

The cumulative distribution function (CDF) $F_X(k)$ is the primitive of the density function, meaning that deriving the CDF will give you the density function. $F_X(k)$ is the probability of $\mathbb{P}(X \le k)$.

* $0 \le F_X(x) \le 1$
* F is increasing and continue
* $\mathbb{P}(a \le X \le b) = F_X(b) - F_X(a) = \int_{a}^{b} f_X(x)dx$

#### Continuous Inverse cumulative distribution function

The Inverse cumulative distribution function or Quantile function is used when given the result $\alpha$, we are trying to find $k$.

@
\alpha = \mathbb{P}(X \le k)
@

It's written $F_X^{-1}(\alpha)$ or $Q_\alpha$.
</div><div>

#### Continuous Transformations

If we can express $Y$ as $Y=aX+b$, we can find $F_Y(x)$ from $F_X(x)$.

@
F_Y(y) = F_X(\frac{y-b}{a})
@

With an increasing monotone function, we can use the formula $Y = \varphi(X)$. For example, $Y = \exp(X)$ and $\varphi^{-1}(y) = ln(y)$.

@
F_Y(y) = F_X(\varphi^{-1}(y))
@

#### Continuous Expected Value

The expected value $\mathbb{E}(X)$ is defined by:

@
\mathbb{E}[X] = \int_{-\infty}^{+\infty} xf_X(x)dx
@

* The density function must be integrable <small>(or the EV doesn't exist)</small>
* if $\mathbb{E}(X) = 0$ then $X$ is centered
* if $\mathbb{E}(X)$ is finite, then $X$ may be centered
* $\mathbb{E}[X * Y] = \int_{-\infty}^{+\infty}\int_{-\infty}^{+\infty} x * y * f_{XY}(x , y)\ dx dy$

#### Continuous Variance

The variance $V(X)$ is defined by

@
V[X] = \int_{-\infty}^{+\infty} (x-\mathbb{E}[X])^2\ f_X(x)\ dx
@

#### Moment-Generating Function (MGF)

The Moment-generating function helps in finding the expected value, the variance, and other moments.

<div>
\[
M_X(t) = \mathbb{E}(\exp(tX)) =
\int \exp(tx)\ f_X(x)\ dx
\]
</div>

<div>
\[
\mathbb{E}(X) = \frac{\delta M_X (t)}{\delta t}
= M'_X(0)
\]
\[
V(X) = \frac{\delta^2 M_X (t)}{\delta t^2} - \mathbb{E}(X)^2
= M''_X(0) - \mathbb{E}(X)^2
\]
</div>
</div></div>

<hr class="sep-both">

## Probability distributions

<div class="row row-cols-lg-2"><div>

We write $X \sim L$ a random variable $X$ following a distribution $L$.

#### Bernoulli distribution (discrete)

Bernoulli is used for binary random variables, e.g., either 0 or 1. $B(p)$ represents the probability of $k$ successes with a probability of $p$.

* The mass function is $\mathbb{P}(X=k) = p^k * (1-p)^{1-k}$
* $\mathbb{E}(X) = \ p$
* $\mathbb{V}(X) = \ p * (1-p)$

👉 Ex: flipping a coin.

#### Binomial distribution (discrete)

The binomial distribution $B(n,p)$ represents the probability of $k$ success on $n$ trials with a probability of $p$.

* The mass function is

<div>
\[
\begin{split}\begin{cases}
\mathbb{P}(X=k) = 0 & if & k > n  \\
\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k}  & else  \\
\end{cases}\end{split}
\]
</div>

* $\mathbb{E}(X) = \ n * p$
* $\mathbb{V}(X) = \ n * p * (1-p)$

📚 A binomial distribution is a repetition of Bernoulli distributions.

#### Discrete Uniform distribution

A distribution, on an interval $[a,b]$, in which each value has the same probability, is a uniform distribution $U([a,b])$.

* The mass function is $\mathbb{P}(X=k) = \frac{1}{b-a+1}$
* $\mathbb{E}(X) = \ \frac{a+b}{2}$
* $\mathbb{V}(X) = \ \frac{(b-a)(b-a+2)}{12}$

Considering $[1,n]$, we would have

* The mass function is $\mathbb{P}(X=k) = \frac{1}{n}$
* $\mathbb{E}(X) = \ \frac{n+1}{2}$
* $\mathbb{V}(X) = \ \frac{n^2 - 1}{12}$

#### Geometric distribution (discrete)

This distribution $\mathbb{G}(p)$ answers the question "If I have a probability of success $p$, what's the probability of the trial $k$ being the first success?"

* The mass function is $\mathbb{P}(X=k) = (1-p)^{k-1} * p$
* $\mathbb{E}(X) = \ \frac{1}{p}$
* $\mathbb{V}(X) = \ \frac{1-p}{p^2}$

#### HyperGeometric distribution (discrete)

The HyperGeometric distribution $H(N, K, n)$ is representing the probability of having a number of successes $K$ in a finite set of size $N$, given that we made $n$ trials without replacement.

* $n$ is the number of trials/draws
* $K$ is the number of successes
* $N$ is the total number of elements
* without replacement

So we have

* The mass function is $\mathbb{P}(X=k) = {{{K \choose k}{{N-K} \choose {n-k}}} \over {N \choose n}}$
* $\mathbb{E}(X) = \ n * \frac{K}{N}$
* $\mathbb{V}(X) = \ \mathbb{E}(X) * (1 - \frac{K}{N}) * \frac{N-n}{N-1}$

#### Poisson distribution (discrete)

It's called the `loi des événements/phénomènes rares` in French. The Poisson distribution $\mathbb{P}(\lambda)$ require that the probability $p$ is relatively smaller than $n$, while the parameter $\lambda$ is equals to $n*p$.

* The mass function is $\mathbb{P}(X=k) = \frac{\lambda^k *  e^{-\lambda}}{k!}$
* $E(X) = \lambda$
* $V(X) = \lambda$

Demonstration

You need to understand this demonstration because you are going to do something like this a lot, and it's easy

**Demonstration of $E[X]=\lambda$**

With the expected value formula, we have

* $\sum_{k \in \mathbb{N}} k * P(X=k)$
* $= \sum_{k \in \mathbb{N}} k *  \frac{\lambda^k *  e^{-\lambda}}{k!}$
* $e$ is a constant, so we can extract it
* $= e^{-\lambda} * \sum_{k \in \mathbb{N}}  \frac{\lambda^k}{(k-1)!}$
* I'm taking one $\lambda$ out (it's a constant too)
* $= \lambda e^{-\lambda} * \sum_{k \in \mathbb{N}} \frac{\lambda^{k-1}}{(k-1)!}$

Here we are starting the magic. There are well-known series that can be replaced by a function.

Check [them here](https://en.wikipedia.org/wiki/List_of_mathematical_series), but this is the only one that we will use: $\sum_{k \in \mathbb{N}} \frac{\lambda^{k}}{k!} = e^k$

* so using the exponential series development
* $= \lambda e^{-\lambda} * e^{\lambda}$
* $= \lambda e^{-\lambda+\lambda}$
* $= \lambda e^{0}$
* $= \lambda * 1$
* $= \lambda$

Remember the magic trick, it's useful.
</div><div>

#### Normal distribution (continuous)

The distribution is the most important one, also called **Normal** distribution/`Loi normale`, **Gaussian** distribution/`Loi gaussienne` and Laplace–Gauss distribution/`Loi de Laplace-Gauss`. The short name is $N(\mu, \sigma^2)$.

* $\mu$ (mu) is the mean ($\mathbb{E}(X)$)
* $\sigma$ (sigma) is the deviation around the mean,
  known as Standard deviation/`écart-type`.
* $\sigma^2$ (sigma-square) is the variance ($\mathbb{V}(X)$)

So we have

* The density function is $f_X(x) = {\frac {1}{\sigma {\sqrt {2\pi }}}}e^{-{\frac {1}{2}}\left({\frac {x-\mu }{\sigma }}\right)^{2}}$
* $\mathbb{E}(X) = \ \mu$
* $\mathbb{V}(X) = \ \sigma^2$

**Standard normal distribution**

The standard normal distribution/`loi normale centrée réduite` is a normal distribution with $\mu=0$ and $\sigma=1$ giving us $N(0,\ 1)$.

We can create a new variable $Y \sim N(0,\ 1)$ from X with the following formula ()

@
Y \sim \frac{X-\mu}{\sigma}
@

* the density function is noted $\phi_X(x)$ (phi) instead of $f_X(x)$
* the cumulative distribution function is noted $\Phi_X(x)$ (Phi) instead of $F_X(x)$

**Standard normal table**

If you have $X \sim N(\mu,\ \sigma^2)$, then

<div>
\[
F_X(c) = \mathbb{P}(X \le c)
= \mathbb{P}(\frac{X-\mu}{\sigma} \le \frac{c-\mu}{\sigma})
= \phi(\frac{c-\mu}{\sigma})
\]
</div>

You already know some of them, but here is a recap

* $\mathbb{P}(X \le c) \Leftrightarrow \mathbb{P}(X \lt c)$
* $\mathbb{P}(X \ge c) \Leftrightarrow \mathbb{P}(X \gt c)$
* $\mathbb{P}(X \ge c) = 1 - \mathbb{P}(X \le c)$
* $\phi(0.5) = 0$
* $\phi(-x) = 1 - \phi(x)$ (**note that even if you can find is a table for $x \lt 0$, you are only given the table with $x \ge 0$** so use this)

And now, you need to use this table to calculate $\phi(x)$. Note that the value at the first line (ex: 0.0) and the first column (ex: 0.00) is the result for $\phi(0.0 + 0.00)$.

* [Wikipedia](https://en.wikipedia.org/wiki/Standard_normal_table)
* [another one as PDF here](https://www.math.arizona.edu/~jwatkins/normal-table.pdf)

This image is an image from the second link

<div style="height: 300px;overflow: auto;">

![normal-table](_images/normal-table.png)
</div>

**Inverse cumulative distribution function**

We know that

@
\alpha = \mathbb{P}(X \le k) = F_X^{-1}(\alpha)
@

so given an alpha, we need to evaluate $F_X^{-1}(\alpha)$ to find the k giving this alpha. For a normal distribution, it's easier since we have

@
F_X^{-1}(\alpha) = \mu + \sigma * \phi^{-1}(\alpha)
@

As for $\phi^{-1}(\alpha)$

* if $\alpha \ge 0.5$, you simply need to find the z (sum of line+column) in the table associated with the closest value of $\alpha$
* else $\phi^{-1}(\alpha) = -\phi(1-\alpha)$

For instance, if $\alpha = 0.95$, then you need to search the closest value in the table. We got $\phi(1.64)=0.9495$ and $1.65=0.9505$ giving us $k \in [1.64,1.65]$.

If $\alpha = 0.05$, then we have $\phi^{-1}(0.05) = -\phi(1-0.05) = -\phi(0.95)$ so $k \in [-1.65,-1.64]$.

#### Continuous uniform distribution

A distribution, on an interval $[a,b]$, in which each value has the same probability, is a uniform distribution $U([a,b])$.

* The density function is $f_X(x) = \frac{1}{b-a}$
* $\mathbb{E}(X) = \ \frac{a+b}{2}$
* $\mathbb{V}(X) = \ \frac{(b-a)^2}{12}$

**Standard uniform distribution**

We are calling standard uniform distribution/`loi uniforme standard` a uniform distribution where

* $a=0$
* $b=1$

For more information, here is the [wiki](https://en.wikipedia.org/wiki/Continuous_uniform_distribution#Standard_uniform).

Let $F_Y(y)$ be the cumulative distribution function of the continuous random variable Y. Then $X = F_Y(y)$ can follow a standard uniform distribution

@
X = F_Y(Y) \sim U([0,1])
@

Using the [Probability integral transform (PIP)](https://en.wikipedia.org/wiki/Probability_integral_transform).

#### Exponential distribution (continuous)

The exponential distribution is $E(\lambda)$. You should look at [Wikipedia](https://en.wikipedia.org/wiki/Exponential_distribution) if you want to know why it's used.

* The density function is $f_X(x) = \lambda e^{-\lambda{x}}$
* $\mathbb{E}(X) = \ \frac{1}{\lambda}$
* $\mathbb{V}(X) = \ \frac{1}{\lambda^2}$
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

#### Generating function

Generating functions are handy when doing combinatorics. If we got $k$ issues and $m$ experiments, we perform the following product:

<div>
\[
G(x) = \prod_{j=1}^{m} \sum_{i=k_j}^{n_j} x^i
\]
</div>

Once you develop the expression, each $a$ in $a * x^i$ is the number of distributions for $n=i$.

➡️ See also: [Generating Function Examples](_examples/gen.md)

<br>

#### Indicator Function

The indicator function, also sometimes called characteristic function, of a set B is represented as $\mathbb{1}_{ B }(x)$ and defined as:

* $1$ if $x \in B$
* $0$ else

It means we can shorten an expression like that:

<div>
\[
\begin{split}\begin{cases}
\mathbb{P}(X=k) = 0 & if & k > n  \\
\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k}  & else  \\
\end{cases}\end{split}
\]
</div>

To this expression:

<div>
\[
\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k} *  \mathbb{1}_{ [[0,n]] }(k)
\]
</div>
</div><div>

#### Transfer Theorem

For a discrete variable, we will have:

@
\mathbb{E}(g(X)) = \sum_{i} g(x_i) \mathbb{P}(X = x_i)
@

For continuous variables, we will have:

@
\mathbb{E}[g(X)] = \int_{-\infty}^{+\infty} g(x) * f_X(x)\ dx
@
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>