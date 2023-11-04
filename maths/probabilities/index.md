# Probabilities

<div class="row row-cols-lg-2"><div>

A probability is a value between zero and one characterizing how likely an event may occur.

* 🛣️ $\omega$ (small-omega) is an outcome possible
* 🗺️ $\Omega$ (big-omega) is a set of all possible outcomes, also called sample/probability space
* 📌 $A$ is an event included in <span>$\Omega$. It's often  defined by a sentence. If it has only one outcome, it's called an elementary event.
* 🌍 $\overline{A}$ or $A^c$ is opposite/complementary event of A <small>(read as "not A")</small>.
* ⛔ $\emptyset$ (empty set) means an impossible event.
</div><div>

For instance, we are rolling a die 3 times in a row 🎲.

* An outcome is 🛣️: $(6, 1, 2)$
* The probability space 🗺️: $\lbrace\ (x, y, z) \mid x y z \in [1,6]\ \rbrace$
* An event $A$ 📌: having 3 times 6, e.g., $(6, 6, 6)$
* Complementary event $\overline{A}$ 🌍: not having 3 times 6
* An impossible event ⛔: ...

👉 Events "incompatible/disjoints/mutually exclusive events" are events that can't happen simultaneously.
</div></div>

<hr class="sep-both">

## Combinatorics

<div class="row row-cols-lg-2"><div>

The cardinal of $E$ means the number of elements of $E$. We use these notations: $card(E) \Leftrightarrow |E| \Leftrightarrow \\#E$. We will need to know the cardinal of $\Omega$ or an event to use most formulas.

For instance, let's say you have a sample space `"rolling a die 9 times"` and an event $A=$`"having a sum > 50"`. What is $card(A)$?

We have a few techniques we can use. Assuming $card(E) = k$, according to the event $A$, we will pick $n$ outcomes from $E$.

* `without replacement`: we can take an element only once
* `ordered`: we consider $(1, 2)$ and $(2, 1)$ to be different

➡️ See also: [Counting Examples](_examples/counting.md).

<br>

#### Ordered sampling without replacement

Since k is decreasing by 1 after each pick, it's a factorial: $n! = n * (n-1)!$ and $1! = 1$. For example, $5!=5\*4\*3\*2\*1$.

@
A^k_n = \frac{k!}{(k-n)!}
@

When $k = n$, $A^k_n = k!$, we call it a permutation. When the elements are not unique, we use:

@
\frac{n!}{\prod_i o_i!}
@

➡️ $A^k_n$ is called an an Arrangement.
</div><div>

#### Ordered sampling with replacement

It means each value can be picked $n$ times.

@
k^n
@

⚠️ You must make sure that you are not inverting $k$ and $n$.

#### Unordered sampling without replacement

@
\frac{k!}{(k-n)! * n!}
\Leftrightarrow
\frac{A^k_n}{n!}
@

#### Unordered distribution (with replacement)

@
C^{k-1}_{n+k-1} = \frac{(n+k-1)!}{(k-1)! * n!}
@

➡️ $C^k_n$ is called a Combination.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [_old](_old.md)
</div><div>
</div></div>