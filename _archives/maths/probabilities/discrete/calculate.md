# Calculate a discrete probability

[Go back](..)

In discrete probabilities, both A and Omega are finite sets, so in most cases, all you have to do is to evaluate

@
\mathbb{P}(A) = \color{green}{\frac{card(A)}{card(\Omega)} = \frac{|A|}{|\Omega|}}
@

You must evaluate 

* $card(A)$: how many values are in A, your event
* $card(\Omega)$: how many values are in Omega

Then the probability is a sort of "percent" of success by the number of tries. But that's a value in $[0,1]$ since we are not multiplying it by 100.

<hr class="sr">

## Uniform probability

Sometimes, the probability is called uniform probability because each event has the **same** probability of happening.

That's the case for a normal dice, you got the same probability of having one of the 6 values: $\frac{1}{6}$. That's also the case in a card game, like $\frac{1}{52}$ if you got 52 cards.

The formula is

@
\forall{w} \in \Omega \ then \ \mathbb{P}(w) = \frac{1}{card(\Omega)}
@

<hr class="sl">

## Conditional probability

You may have to calculate a probability like these

* Knowing that B happened, what's the probability of A happening?
* Given B, what's the probability of A??
* `Sachant B, quelle est la probabilité de A`?

If that's the case, then that's a conditional probability.

@
\mathbb{P}(A|B) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}
@

$\mathbb{P}(A|B)$ may also be written $P_B(A)$ or $P(B \wedge A)$ (rarely used).

**Properties**

* $\mathbb{P}(\overline{A}|B) = 1 - \mathbb{P}(A|B)$
* $\mathbb{P} (B \cup C|A) = \mathbb{P}(B|A) + \mathbb{P}(C|A) − \mathbb{P}(B ∩ C|A)$

<hr class="sr">

## Bayes formula

Also called `probabilité des causes`, using the previous formula, you could deduce

@
\mathbb{P}(A \cap B) = \mathbb{P}(B) * \mathbb{P}(A|B)
= \mathbb{P}(A) * \mathbb{P}(B|A)
@

And we could write

@
\mathbb{P}(A|B) := \frac{\mathbb{P}(B) * \mathbb{P}(A|B)}{\mathbb{P}(B)}
\ or \ \frac{\mathbb{P}(A) * \mathbb{P}(B|A)}{\mathbb{P}(B)}
@

This kind of probability is called Posterior probability (a posteriori, [wiki](https://en.wikipedia.org/wiki/Posterior_probability)) as the opposite of A priori probability (a priori, [wiki](https://en.wikipedia.org/wiki/A_priori_probability)).

<hr class="sl">

## Law of total probability

In French, it's called `Formule des probabilités totales`.

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

<hr class="sr">

## Chain rule

In French, it's called `Formule des probabilités composées`. It's defined by

<div>
\[
\prod_{i=1}^n \mathbb{P}(A_i | \bigcap_{j=1}^{i-1} A_j)
\]
</div>

For instance if $n=4$, we got

<div>
\[
\mathbb{P}(A_4 \cap A_3 \cap A_2 \cap A_1) 
=
\mathbb{P}(A_1) *
\mathbb{P}(A_2|\ A_1) *
\mathbb{P}(A_3|\ A_2 \cap A_1) *
\mathbb{P}(A_4|\ A_3 \cap A_2 \cap A_1)
\]
</div>