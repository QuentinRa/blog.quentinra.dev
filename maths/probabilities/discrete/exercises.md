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