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

And we can use the probability chain rule:

<div>
\[
\prod_{i=1}^n \mathbb{P}(A_i | \bigcap_{j=1}^{i-1} A_j)
\]
</div>

For instance if $n=4$, we got

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