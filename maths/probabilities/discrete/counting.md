# Counting techniques / Combinatorics

<div class="row row-cols-lg-2"><div>

Ordered and unordered sets are syntactically different:

* Pick one and two: $\lbrace (1, 2),(2, 1) \rbrace$ <small>(ordered set)</small>
* Pick one and two: $\lbrace \lbrace{1,2}\rbrace\rbrace$ <small>(unordered set)</small>
</div><div>

We are distinguishing

* Permutations: shuffle of your set
* Arrangement $A^k_n$: randomly picking elements, order matter
* Combination $C^k_n$: randomly picking elements, order do not matter
</div></div>

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