# Bayes formula

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