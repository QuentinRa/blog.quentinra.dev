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

Assuming $card(\Omega) = k$, according to the event $A$, we will pick $n$ outcomes from $\Omega$. If we can take an element only once, we call that a sampling **without replacement**. If the order of the outcomes in $A$ is important, we call that a sampling **with order**.

Ordered and unordered sets are syntactically different:

* Pick one and two: $\lbrace (1, 2),(2, 1) \rbrace$ <small>(ordered set)</small>
* Pick one and two: $\lbrace \lbrace{1,2}\rbrace\rbrace$ <small>(unordered set)</small>

#### Ordered distribution (no replacement)

Since k is decreasing by 1 after each pick, it's a factorial: $5!=5\*4\*3\*2\*1$.

@
A^k_n = \frac{k!}{(k-n)!}
@

When $k = n$, $A^k_n = k!$, we call it a permutation. When the elements are not unique, we use:

@
\frac{n!}{\prod_i o_i!}
@
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