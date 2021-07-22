# Probabilities

In this course, we will cover all the basics about
probabilities and some advanced concepts that
will be used in other courses.

* $\omega$ (small-omega)
  is a result possible 
  <span class="tms">such as 1 for a dice</span>
* $\Omega$ (big-omega)
  is a set of all possible results
  <span class="tms">such as {1,2,3,4,5,6} for a dice
  or {$\ x \mid x \in [1,6]\ $}</span>.
* $A$ is an event included in <span>
  $\Omega$. <span class="tms">
  It's almost everytime defined
  by a sentence like "the result is pair".
  </span>
* $\overline{A}$ means the opposite
  event of A.
* $\emptyset$ (empty set)
  means an impossible event.
* $Card(E) = |E| = \\#E$ is the cardinal of
  a set E, meaning the number of elements.

<hr class="sl">

## Vocabulary and properties

$\mathbb{P}(A)$ 
means the probability of A
happening and that's a value in
$[0,1]$

* $\mathbb{P}(\Omega) = 1$ and $\mathbb{P}(\emptyset) = 0$
* $\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)$
* $\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) -
  \mathbb{P}(A \cap B)$
* $A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)$
  
We call **distribution function** an strictly positive,
increasing function where the sum
of all values is 1. It's a function supposed to modelize
the values of what you are observing and giving a probability
to each value.

We call **support** a set where the distribution function is defined. The probability
outside the support is 0. You can use that to make a sum on the support.