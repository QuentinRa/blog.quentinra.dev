# Structural induction

[Go back](..)

## Exercise

$A$ a set of strings. A word is defined as a row of strings. $\epsilon$ is an empty row (a word without string). We also define string concatenation which is an operation of joining character strings end-to-end.

For instance, the concatenation of "zoo" and "logic" is "zoologic".

We are defining by induction the set $X$:

* $\epsilon \in X$
* If $u \in X$ then $a.u.b \in X$

Prove that $X=\\{a^nb^n, n \in \mathbb{N}\\}$

<blockquote class="spoiler">

### Proof by double induction

<br>

#### o $\\{a^nb^n, n \in \mathbb{N}\\}\subset X$

By mathematical induction, we give a proof that $\forall n \in \mathbb{N}$, $P(n)=$"$a^nb^n \in X$" is true.

**Base case: Let's show that the statement holds for the smallest natural number $n=0$**
<br>
$a^0b^0=\epsilon . \epsilon = \epsilon \in X$ (definition of X)
<br>
So $P(0)$ is true.
 
**Inductive step: Let's show that for any $n\geq 0$, if $P(n)$ holds, then $P(n+1)$ also holds**

$a^{n+1}b^{n+1}=a.a^nb^n.b$
<br>
But, by hypothesis, $P(n)$ is true. So $a^nb^n \in X$.
<br>
Then (definition of X) we deduce that $a^{n+1}b^{n+1} \in X$, that is $P(n+1)$.

**Conclusion: the statement $P(n)$ holds for every $n \in \mathbb{N}$**

<br>

#### o $X\subset \\{a^nb^n, n \in \mathbb{N}\\}$

By structural induction, we give a proof that $\forall u \in X$, $P(u)=$"$u \in \\{a^nb^n, n \in \mathbb{N}\\}$" is true.

**Base case:**
<br>
$\epsilon=\epsilon . \epsilon = a^0b^0 \in \\{a^nb^n, n \in \mathbb{N}\\}$
<br>
So $P(\epsilon)$ is true.
 
**Inductive step:**
$u \in X$
<br>
We assume that $P(u)$ is true.
Let's show that $P(a.u.b)$ holds.

By hypothesis, $P(u)$ is true. So $\exists k \in \mathbb{N}$, $u=a^kb^k$. 
<br>
Then $aub=a^{k+1}b^{k+1} \in \\{a^nb^n, n \in \mathbb{N}\\}$, that is $P(aub)$.

**Conclusion: the statement $P(u)$ holds for every $u \in X$**

### Conclusion: $X=\\{a^nb^n, n \in \mathbb{N}\\}$

</blockquote>
