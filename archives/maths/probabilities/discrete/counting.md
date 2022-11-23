# Counting techniques / Combinatorics

[Go back](..)

It's `Dénombrement` in French. We are using the cardinal a lot, so we must be able to count of many elements we got in a set.

Let's say we have

* a set `E` having `k` elements
* we are picking `n` elements in `E`

**Note**: no repetition/replacement means that's you once you picked a value in `E`, you are not putting it back. The size of `E` keeps decreasing.

**Ordered**: means that (0,1) and (1,0) are two different results while unordered means that they are the same issue. When writing an ordered set, we write {$(0,1), (1,0)$} while we would do { {$0,1$} } for the same set but unordered.

We are distinguishing 

* Permutations: shuffle of your set
* Arrangement $A^k_n$: randomly picking elements, order matter
* Combination $C^k_n$: randomly picking elements, order do not matter

<hr class="sr">

## Ordered distribution (no repetition/replacement)

Since k is decreasing by 1, it's a factorial ($5!=5\*4\*3\*2\*1$).

@
A^k_n = \frac{k!}{(k-n)!}
@

When $k = n$, $A^k_n = k!$ and we are calling these permutations. When the ordered elements are presents multiples times inside the set, you can't simply use $k!$, and you need to divides by the number of occurrences ($o_i$) of each value ($i$)

@
\frac{n!}{\prod_i o_i!}
@

The most used example is "how many words can we create with the letters of Mississippi?".

* we got 1 M ($o_1$)
* we got 4 I ($o_2$)
* we got 4 S ($o_3$)
* we got 2 P ($o_4$)
* we got 11 letters

@
\frac{11!}{1! * 4! * 4! * 2!}
@


<hr class="sl">

## Ordered distribution (with repetition/replacement)

@
k^n
@

Each value can be picked $n$ times. You must make sure that you are not inverting $k$ and $n$.

<hr class="sr">

## unordered distribution (no repetition/replacement)

@
\frac{k!}{(k-n)!} * n!
\Leftrightarrow
A^k_n * n!
@

It's the same as "Ordered distribution (no repetition/replacement)" but we multiply by $n!$.

<hr class="sl">

## unordered distribution (with repetition/replacement)

@
C^{k-1}_{n+k-1} = \frac{(n+k-1)!}{(k-1)! * n!}
@

If we have $n=2$ having $[1,5,7]$ so $k=3$ then we have

@
C^{3-1}_{2+3-1} = 6
@

The 6 results are {$1,5$}, {$1,7$} and {$5,7$} <small>(remember that {$1,5$} is the same as {$(1,5),(5,1)$}).</small>