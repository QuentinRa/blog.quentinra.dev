# Counting techniques / Combinatorics

[Go back](..)

We are distinguishing 

* Permutations: shuffle of your set
* Arrangement $A^k_n$: randomly picking elements, order matter
* Combination $C^k_n$: randomly picking elements, order do not matter

<hr class="sr">

## Ordered distribution (no repetition/replacement)

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