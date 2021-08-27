# Exercises

[Go back](..)

This is a batch of exercises on discrete probabilities (probabilities, counting, conditional probability, Bayes's formula, expected value, variance).

<hr class="sl">

**Exercise 1 (Counting / Conditional probability)**

Two players X and Y are drawing five cards in a 32 cards deck.

What's the probability of X having at least one ace?

<blockquote class="spoiler">

We are introducing A = "at least one ace" but we would have a hard time evaluating this so we will use $\mathbb{P}(A) = 1 - \overline{A}$ (with $\overline{A}$=0 ace) and
@
\mathbb{P}(\overline{A}) := \frac{|\overline{A}|}{|\Omega|} = \frac{C_{28}^5}{C_{32}^5}
@
We could explain that by the fact that $|\overline{A}|$ is the same as picking 5 cards in a deck after we removed the 4 aces (32-4=28).
</blockquote>

Now Y got one ace. What's the probability of X having at least one?

<blockquote class="spoiler">

Now since Y took 5 cards including 1 ace, we are simply removing them from our deck and doing the same thing.
@
\mathbb{P}(\overline{A}) = \frac{C_{25}^5}{C_{28}^5}
@
</blockquote>

<hr class="sl">

**Exercise 2 (Conditional probability)**

We got 3 bags, B1, B2, and B3. We got two white marbles (=`billes`) and 3 red ones. Inside B2, we got 2 green marbles and 4 white ones. Inside B3, we got 5 black marbles and 2 red ones.

We are picking a marble in B1, and add it into B2. Then, we are picking one B2 to B3. And finally, we are picking one into B3. **What's the probability that the 3 marbles we picked have different colors**?

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
    * how did we got $\mathbb{P}(W_1G_2N_3)=\frac{2\*2\*5}{5\*7\*8}=20/280$?
    * we got 5 marbles, 2 are white: $\mathbb{P}(W_1)=2/5$
    * we got 6(+1) marbles, 2 are green: $\mathbb{P}(G_2|W_1)=2/7$
    * we got 7(+1) marbles, 5 are black: $\mathbb{P}(B_3|W_1 \cap G_2)=5/8$
    * we know: $\mathbb{P}(W_1G_2B_3)=\mathbb{P}(W_1)\*\mathbb{P}(G_2|W_1)\*\mathbb{P}(B_3|W_1 \cap G_2)$
    * so we have $\mathbb{P}(B_1V_2N_3)=\frac{2\*2\*5}{5\*7\*8}$
</blockquote>

<hr class="sr">

**Exercise 3 (Bayes' theorem)**

We are using a test to check if the patient got the disease or not. If got the decease then the test is positive 96% of the time. The test is a false-positive in 2% of the cases. $0.05%$ of the patients got the decease.

1. What's the probability of someone having a positive test
   to have the disease?

<blockquote class="spoiler">

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

What we call "Law of total probability"/"`Formule des probabilités totales`" is a tree, considering the 2 cases (here $S$ and $\overline{S}$).
</blockquote>

2. What's the probability of someone having the disease after two positives tests?

<blockquote class="spoiler">

* $D$ = "2 positives tests"
* $P_1$ = "The first test is positive"
* $P_2$ = "The second test is positive"

<div>
\[
\begin{split}
\mathbb{P}(S|D) 
= \frac{\mathbb{P}(S \cap D)}{\mathbb{P}(D)}
=^{independence} 
\frac{\mathbb{P}(S) * \mathbb{P}(P_1|S) * \mathbb{P}(P_2|S)}{P(P_2) * \mathbb{P}(P_1)}\\
= \frac{(0.0005*0.96)^2}{(0.96*0.0005+0.02*(1-0.0005))^2 }
= \frac{0.0005*0.96^2}{0.96^2*0.0005+0.02^2*(1-0.0005)} \\
= \frac{0.0004608}{0.0008606} = 0.53544039043  \approx 0.53\end{split}
\]
</div>
</blockquote>

<hr class="sr">

**Exercise 4 (expected value)**

We got 2 white marbles and 3 black ones in a box. 4 players (A, B, C, and D) taking in this order a marble. The first one taking a white marble win $10.

What's the expected gain for each person?

<blockquote class="spoiler">

We will introduce the random variables

* $\mathbb{W}_A$ = "The player A got a white marble"
* ...

So we got

* $\mathbb{P}(W_A) = 2/5$
* $\mathbb{P}(W_B) = \mathbb{P}(W_B|\overline{W_A}) = 2/4 * 3/5 = 6/20 = 3/10$
* $\mathbb{P}(W_C) = \mathbb{P}(W_C|\overline{W_A \cap W_B}) = 2/3 * 3/5 * 2/4 = 12/60 = 1/5$
* $\mathbb{P}(W_D) = \mathbb{P}(W_D|\overline{W_A \cap W_B \cap W_C}) = 1 * 3/5 * 2/4 * 1/3 = 1/10$

And

* $\mathbb{E}[W_A] = 2/5 * 10 = 4$
* $\mathbb{E}[W_B] = 3/10 * 10 = 3$
* $\mathbb{E}[W_C] = 1/5 * 10 = 2$
* $\mathbb{E}[W_D] = 1/10 * 10 = 1$

</blockquote>

**Exercise 5 (Distributions)**

We are working with the density function $f(x) = \frac{e^{-1}}{x!},\hspace{0.5cm} x = 0,1, 2...$.

1. $P(X=2)$

<blockquote class="spoiler">
The answer is $\mathbb{P}(X=2) = \frac{e^{-1}}{2!}$.
</blockquote>

2. $P(X < 2)$

<blockquote class="spoiler">
The answer is $\mathbb{P}(X < 2) = P(X=0) + P(X=1) = \frac{e^{-1}}{0!} + \frac{e^{-1}}{1!} = e^{-1} + e^{-1} = 2 e^{-1}$.
</blockquote>

3. Demonstrate that $e^{-1}$ is the constant making $\frac{c}{x!}$ a mass function?

<blockquote class="spoiler">
<div>
\[
\begin{split}
\text{mass function} := \sum_{k=0}^{+\infty} f(k) = 1 \\
\Leftrightarrow
\sum_{k=0}^{+\infty} \frac{c}{k!} = 1
\Leftrightarrow
c * \sum_{k=0}^{+\infty} \frac{1}{k!} = 1
\Leftrightarrow^{because\ 1^k = 1}
c * \sum_{k=0}^{+\infty} \frac{1^k}{k!} = 1\\
\Leftrightarrow^\text{exponential series}
c * e = 1 \Leftrightarrow  c = \frac{1}{e} \Leftrightarrow c = e^{-1}\end{split}
\]
</div>

We also need to check that the values are $\ge 0$ so that $\frac{e^{-1}}{x!} \ge 0$.

Since $x! \ge 0$ (because x \in R^*) and $e^{-1} \ge 0$ then the function is a mass function.
</blockquote>