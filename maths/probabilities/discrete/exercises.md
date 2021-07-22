# Exercises

[Go back](..)

**Exercise 1 (Counting / Conditional probability)**

To players X and Y drawing 5 cards
in a 32 cards deck.

What's the probability of X having at least 1 ace?
And if Y got an ace, what's the probability
of X having at least one?

<blockquote class="spoiler">

We are introducing A = "at least one ace"
but it's too hard so we will use
$\mathbb{P}(A) = 1 - \overline{A}$
(with $\overline{A}$=0 ace) and
@
\mathbb{P}(\overline{A}) := \frac{|\overline{A}|}{|\Omega|} = \frac{C_{28}^5}{C_{32}^5}
@
We could explain that by the fact that $|\overline{A}|$
is the same as picking 5 cards in a deck after we removed the 4 aces
(32-4=28).

Now since Y took 5 cards and 1 ace, we are simply
removing them from our deck and doing the same thing.
@
\mathbb{P}(\overline{A}) = \frac{C_{25}^5}{C_{28}^5}
@
</blockquote>

<hr class="sl">

**Exercise 2 (Conditional probability)**

We got 3 bags, B1, B2, and B3. We got two
white marbles (=``billes``) and 3 red ones.
Inside B2, we got 2 green marbles and 4 white ones.
Inside B3, we got 5 black marbles and 2 red ones.

We are picking a marble in B1, and add it into
B2. Then, we are picking one B2 to B3. And finally
we are picking one into B3. **What's
the probability that the 3 marbles we picked
have different colors**?

<blockquote class="spoiler">

1. random variables
    * $W_i$ = "white marble picked inside B_i"
    * We are also considering $R_i$ Red, $G_i$ Green, $B_i$ Black
2. Our goal
    * A = "the 3 marbles are different"
    * There are 4 cases: $WGB$, $WGR$, $RGB$, $RWB$
    * $\mathbb{P}(A)=P(B_1V_2N_3)+P(B_1V_2R_3)+P(R_1V_2N_3)+P(R_1B_2N_3)$
3. Solving
    * $\mathbb{P}(W_1G_2B_3)=\frac{2\*2\*5}{5\*7\*8}=20/280$
    * $\mathbb{P}(W_1G_2R_3)=\frac{2\*2\*2}{5\*7\*8}=8/280$
    * $\mathbb{P}(R_1G_2B_3)=\frac{3\*2\*5}{5\*7\*8}=30/280$
    * $\mathbb{P}(R_1B_2B_3)=\frac{3\*4\*5}{5\*7\*8}=60/280$
    * $\mathbb{P}(A)=20/280 + 8/280 + 30/280 + 60/280 = 118/280$
4. Explanation
    * how did we got $P(W_1G_2N_3)=\frac{2\*2\*5}{5\*7\*8}=20/280$?
    * we got 5 marbles, 2 are white: $\mathbb{P}(W_1)=2/5$
    * we got 6(+1) marbles, 2 are green: $\mathbb{P}(G_2|W_1)=2/7$
    * we got 7(+1) marbles, 5 are black: $P(B_3|W_1 \cap G_2)=5/8$
    * we know: $P(W_1G_2B_3)=P(W_1)*P(G_2|W_1)*P(B_3|W_1 \cap G_2)$
    * so we have $P(B_1V_2N_3)=\frac{2\*2\*5}{5\*7\*8}$
</blockquote>