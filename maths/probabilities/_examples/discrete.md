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

<hr class="sep-both">

## Bayes Theorem Example

<div class="row row-cols-lg-2"><div>

We are using a test to check if the patient got the disease or not. On a sick patient, the test is positive 96% of the time. The test is a false-positive in 2% of the cases. $0.05%$ of the patients got the decease.

##### What's the probability of someone having a positive test to have the disease?

* S = "The patient is sick"
* P = "The patient got a positive test"
* $\mathbb{P}(P|S) = 0.96$
* $\mathbb{P}(P|\overline{S}) = 0.02$
* $\mathbb{P}(S) = 0.0005$
* $\mathbb{P}(S|P) = ???$

<div>
\[
\begin{split}
\mathbb{P}(S|P) = 
\frac{\mathbb{P}(S \cap P)}{\mathbb{P}(P)} 
=^{bayes} \frac{\mathbb{P}(S) * \mathbb{P}(P|S)}{\mathbb{P}(P)} \\
=^\text{law of total probability} \frac{\mathbb{P}(S) * \mathbb{P}(P|S)}{\mathbb{P}(P|S) * \mathbb{P}(S) + \mathbb{P}(P|\overline{S}) * \mathbb{P}(\overline{S})} \\
= \frac{0.0005*0.96}{0.96*0.0005+0.02*(1-0.0005)} = 0.02344894968 \approx 0.023\end{split}
\]
</div>
</div><div>

##### What's the probability of someone having the disease after two positives tests?

* $D$ = "2 positives tests"
* $P_1$ = "The first test is positive"
* $P_2$ = "The second test is positive"

<div>
\[
\begin{split}
\mathbb{P}(S|D) 
= \frac{\mathbb{P}(S \cap D)}{\mathbb{P}(D)}\\
=^{independence} 
\frac{\mathbb{P}(S) * \mathbb{P}(P_1|S) * \mathbb{P}(P_2|S)}{P(P_2) * \mathbb{P}(P_1)}\\
= \frac{(0.0005*0.96)^2}{(0.96*0.0005+0.02*(1-0.0005))^2 } \\
= \frac{0.0005*0.96^2}{0.96^2*0.0005+0.02^2*(1-0.0005)} \\
= \frac{0.0004608}{0.0008606} = 0.53544039043  \approx 0.53
\end{split}
\]
</div>
</div></div>

<hr class="sep-both">

## Expected Value Example

<div class="row row-cols-lg-2"><div>

We got two white marbles and three black ones in a box. Four players A, B, C, and D are picking one marble one by one. The first one that picks a white marble wins $10.

##### What's the expected gain for each person?

* $\mathbb{W}_A$ = "The player A picked a white marble"
* $\mathbb{W}_B$ = "The player B picked a white marble"
* $\mathbb{W}_C$ = "The player C picked a white marble"
* $\mathbb{W}_D$ = "The player D picked a white marble"

We can calculate the probabilities for each event:

* $\mathbb{P}(W_A) = 2/5$
* $\mathbb{P}(W_B) = \mathbb{P}(W_B|\overline{W_A}) = 2/4 * 3/5 = 6/20 = 3/10$
* $\mathbb{P}(W_C) = \mathbb{P}(W_C|\overline{W_A \cap W_B}) = 2/3 * 3/5 * 2/4 = 12/60 = 1/5$
* $\mathbb{P}(W_D) = \mathbb{P}(W_D|\overline{W_A \cap W_B \cap W_C}) = 1 * 3/5 * 2/4 * 1/3 = 1/10$

And the expected value for each event:

* $\mathbb{E}[W_A] = 2/5 * 10 = 4$
* $\mathbb{E}[W_B] = 3/10 * 10 = 3$
* $\mathbb{E}[W_C] = 1/5 * 10 = 2$
* $\mathbb{E}[W_D] = 1/10 * 10 = 1$
</div><div>
</div></div>

<hr class="sep-both">

## Cumulative Distribution Function Example

<div class="row row-cols-lg-2"><div>


We are working with the function $f(x) = \frac{e^{-1}}{x!},\quad x \in \mathbb{Z}^*$.

##### Calculate $P(X=2)$

$\mathbb{P}(X=2) = \frac{e^{-1}}{2!}$.

##### Calculate $P(X < 2)$

$\mathbb{P}(X < 2) = P(X=0) + P(X=1) = \frac{e^{-1}}{0!} + \frac{e^{-1}}{1!} = e^{-1} + e^{-1} = 2 e^{-1}$
</div><div>
</div></div>