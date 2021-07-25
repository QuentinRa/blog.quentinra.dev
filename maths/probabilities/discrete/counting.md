# Counting techniques / Combinatorics

[Go back](..)

It's ``Dénombrement`` in French. As you saw before
we are using the cardinal a lot so we must be able
to count of many elements we got in a set.

Let's says we have

* a set ``E`` having `k` elements
* we are picking ``n`` elements in `E`

**Note**: no repetition means that's you once
you picked a value in ``E``, you are not putting it
back. The size of ``E`` keeps decreasing.

**Ordered**: means that (0,1) and (1,0) are two
different results while unordered means that they
are the same issue. When writing a ordered
set, we write {$(0,1), (1,0)$} while we would
do { {$0,1$} } for the same set but unordered.

<hr class="sr">

## Ordered distribution (no repetition)

Since k is decreasing by 1, it's a factorial ($5!=5\*4\*3\*2\*1$).

@
\frac{k!}{(k-n)!}
@

or $k!$ permutations if $k = n$.

<hr class="sl">

## Ordered distribution (with repetition)

@
k^n
@

Each value can be picked $n$ times. You must make
sure that you are not inverting $k$ and $n$.

<hr class="sr">

## unordered distribution (no repetition)

@
\frac{k!}{(k-n)!} * n!
@

It's the same as "Ordered distribution (no repetition)"
but if you picked $[1,2,3]$ then you got

* $[1,2,3]$
* $[1,3,2]$
* $[2,1,3]$
* $[2,3,1]$
* $[3,1,2]$
* $[3,2,1]$
* $= 6 =\ 3!$ results so we need to multiply by $n!$

<hr class="sl">

## unordered distribution (with repetition)

@
C^{k-1}_{n+k-1} = \frac{(n+k-1)!}{(k-1)! * n!}
@

If we have $n=2$ having $k=3$ then we have

@
C^{3-1}_{2+3-1} = 6
@

* $[1,5,7]$ and $n=2$
* $1,5$
* $1,7$
* $5,1$
* $5,7$
* $7,1$
* $7,5$
* $=6$ results so we are good