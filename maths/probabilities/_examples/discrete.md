# Discrete Probability Examples

<hr class="sep-both">

## Formulas Example

<div class="row row-cols-lg-2"><div>

For a normal dice, we have the same probability of having each one of the 6 values: $\frac{1}{6}$. That's also the case in a card game, we have $\frac{1}{52}$ if we have 52 cards.
</div><div>
</div></div>

<hr class="sep-both">

## Combinatorics Example

<div class="row row-cols-lg-2"><div>

Two players X and Y are drawing five cards in a 32-cards deck. 

##### What's the probability of X having at least one ace?

We are introducing A = "at least one ace". It would be easier to calculate $\mathbb{P}(A) = 1 - \overline{A}$ <small>(with $\overline{A}$=0 ace)</small>.

@
\mathbb{P}(\overline{A}) := \frac{|\overline{A}|}{|\Omega|} = \frac{C_{28}^5}{C_{32}^5}
@

For $|\overline{A}|$, we are basically calculating the event of picking 5 cards among the 28 remaining cards, e.g., the deck without the aces.
</div><div>

##### Same question if Y took once ace

Since Y took 5 cards including 1 ace, we are simply removing them from our deck and doing the same calculation.
@
\mathbb{P}(\overline{A}) = \frac{C_{25}^5}{C_{28}^5}
@
</div></div>