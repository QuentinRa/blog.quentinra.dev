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

<hr class="sep-both">

## Conditional Probabilities Example

<div class="row row-cols-lg-2"><div>

We got 3 bags with marbles:

* B1 has $2$ white marbles and $3$ red marbles
* B2 has $2$ green marbles and $4$ white marbles
* B3 has $5$ black marbles and $2$ red marbles

We pick a marble in B1 and add it into B2. We repeat the process with B2. Finally, we pick a marble in B3.

What's the probability of all 3 marbles having different colors?

* $W_i$ = "white marble picked inside B_i"
* $A$ = "the 3 marbles are different"
* We are also considering $R_i$ Red, $G_i$ Green, $B_i$ Black
* There are 4 outcomes: $WGB$, $WGR$, $RGB$, $RWB$

$\mathbb{P}(A)=P(B_1V_2N_3)+P(B_1V_2R_3)+P(R_1V_2N_3)+P(R_1B_2N_3)$
</div><div>

* $\mathbb{P}(W_1G_2B_3)=\frac{2\*2\*5}{5\*7\*8}=20/280$
* $\mathbb{P}(W_1G_2R_3)=\frac{2\*2\*2}{5\*7\*8}=8/280$
* $\mathbb{P}(R_1G_2B_3)=\frac{3\*2\*5}{5\*7\*8}=30/280$
* $\mathbb{P}(R_1B_2B_3)=\frac{3\*4\*5}{5\*7\*8}=60/280$
* $\mathbb{P}(A)=20/280 + 8/280 + 30/280 + 60/280 = 118/280$

Detailed calculation for $\mathbb{P}(W_1G_2N_3)=\frac{2\*2\*5}{5\*7\*8}=20/280$
* we got 5 marbles, 2 are white: $\mathbb{P}(W_1)=2/5$
* we got 6(+1) marbles, 2 are green: $\mathbb{P}(G_2|W_1)=2/7$
* we got 7(+1) marbles, 5 are black: $\mathbb{P}(B_3|W_1 \cap G_2)=5/8$
* we know: $\mathbb{P}(W_1G_2B_3)=\mathbb{P}(W_1)\*\mathbb{P}(G_2|W_1)\*\mathbb{P}(B_3|W_1 \cap G_2)$
* so we have $\mathbb{P}(B_1V_2N_3)=\frac{2\*2\*5}{5\*7\*8}$
</div></div>