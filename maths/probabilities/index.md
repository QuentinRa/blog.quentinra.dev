# Probabilities

In this course, we will cover all the basics about
probabilities and some advanced concepts that
will be used in other courses.

* <span>
    \(\omega\)</span> (small-omega)
    is a result possible 
  <span class="tms">such as 1 for a dice</span>
* <span>
    \(\Omega\)</span> (small-omega)
    is a set of all possible results
  <span class="tms">such as {1,2,3,4,5,6} for a dice
  or <span>
    {\(x \mid x \in [1,6]\)}</span></span>.
* <span>
    \(A\)</span> is an event included in <span>
    \(\Omega\)</span>. <span class="tms">
    It's almost everytime defined
    by a sentence like "result is pair".
  <span>
    \(\overline{A}\)</span> means the opposite
  event of A.
  </span>
* <span>
    \(\emptyset\)</span> (small-omega)
    means an impossible event.
* <span>
    \(Card(E) = |E| = \#E\)</span> is the cardinal of
    E, meaning the number of elements.

<div class="sl"></div>

## Vocabulary and properties

<p>\(\mathbb{P}(A)\) 
means the probability of A
happening and that's a value in <span>
\([0,1]\)</span>
</p>

* <span>
    \(\mathbb{P}(\Omega) = 1\)</span> and <span>\(\mathbb{P}(\emptyset) = 0\)</span>
* <span>
    \(\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)\)</span>
* <span>
    \(\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) - \mathbb{P}(A \cap B)\)</span>
* <span>
    \(A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)\)</span>
  
We call **distribution function** an strictly positive, increasing function where the sum
of all values is 1.

We call **support** a set where the distribution function is defined. The probability
outside the support is 0. You can use that to make a sum on the support...