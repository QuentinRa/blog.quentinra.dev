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

#### Formulas

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

#### Transformations

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

#### Expected value

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

#### Variance

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

#### Covariance/co-variance (cov)

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

#### Independence

Random variables are independent ($\perp$ perp) if the product of the probabilities is equals to the probability of the events  $X_1, ..., X_n$.

<div>
\[
\mathbb{P}(X_1 = x_1\ \cap\ \ldots\ \cap\ X_n = x_n) = \prod_{i=1}^n \mathbb{P}(X_i = x_i)
\]
</div>

➡️ Alternative way: checking $\mathbb{P}(A|B) = \mathbb{P}(A)$ or $\mathbb{P}(B|A) = \mathbb{P}(B)$.

#### Cumulative distribution function

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

We call support of X $\bigtriangleup_X$ or $X(\Omega)$ the domain of the distribution function of X. The probability of an event outside the support is 0. A distribution function is a strictly positive function where the sum of all values <small>(=probabilities)</small> is 1. It associates each value of $\Omega$ to a probability.

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
</div><div>

...
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
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>