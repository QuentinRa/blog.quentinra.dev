# Calculate a discrete probability

[Go back](..)

In most cases, all you have to do is to evaluate

@
\mathbb{P}(A) = \color{green}{\frac{card(A)}{card(\Omega)} = \frac{|A|}{|\Omega|}}
@

You must evaluate 

* $card(A)$: how many values are in A, your event
* $card(\Omega)$: how many values are in Omega

Then the probability is simply a sort a percent of success
by the amount of tries. But that's a value in $[0,1]$ since we are
not multiplying by 100.

<hr class="sr">

## Uniform probability

Sometimes, the probability is called uniform probability
because each event has the **same** probability of happening.

That's the case for a normal dice, you got the same
probability of having one of the 6 values: $\frac{1}{6}$.
That's also the case in a card game, like $\frac{1}{52}$
if you got 52 cards.

The formula is

@
\forall{w} \in \Omega \ then \ \mathbb{P}(w) = \frac{1}{card(\Omega)}
@

<hr class="sl">

## Conditional probability

You may have to calculate a probability 
"knowing that A happened, what's the probability of B happening"?
If that's the case, then that's a conditional probability.

@
\mathbb{P}(A|B) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}
@
@
\mathbb{P}(A|B) := \mathbb{P}_B(A) := \text{"B happened, probability of A?"}
@

**Bayes formula**

Using the previous formula, you could deduce

@
\mathbb{P}(A \cap B) = \mathbb{P}(B) * \mathbb{P}(A|B)
@

And we could write

@
\mathbb{P}(A|B) := \frac{\mathbb{P}(B) * \mathbb{P}(A|B)}{\mathbb{P}(B)}
\ or \ \frac{\mathbb{P}(A) * \mathbb{P}(B|A)}{\mathbb{P}(B)}
@