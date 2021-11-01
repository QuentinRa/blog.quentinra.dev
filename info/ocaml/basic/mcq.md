# MCQ

[Go back](../index.md#basic-concepts)

A bunch of simple questions about OCaml (not quite an MCQ 😖), summarizing what you learned in the section "Basic concepts".

<hr class="sr">

## Question 1

What's the type of `let my_function x = x * x`?

<blockquote class="spoiler">
Notice the <code>*</code> only usable on an <code>int</code>, so the function takes an int and return an int giving us <code>int -> int</code>
</blockquote>

<hr class="sl">

## Question 2

What's the type of `let my_function x y = x ** y`?

<blockquote class="spoiler">
Notice the <code>**</code> only usable on two <code>floats</code>,
so the function takes two floats and return a float giving us <code>float -> float -> float</code>. If you didn't know, <code>x ** y</code> is the exponentiation ($x^y$).
</blockquote>

<hr class="sr">

## Question 3

What's the type of `let my_function x = 5`?

<blockquote class="spoiler">
We don't know the type of x, but the return type is int, so we have <code>'a -> int</code>.
</blockquote>

<hr class="sl">

## Question 4

What's this code doing?

```ocaml
(* x is a number, power > 0 *)
let pow x power = 
	if power = 1
	then x
	else x * (pow x power-1)
```
<blockquote class="spoiler">

**It's not working**. 

* The keyword <code>rec</code> is missing
* We are missing a parenthesis around <code>power-1</code>, for OCaml we wrote <code>(pow x power)-1</code>

The code would do $x^{power}$ if it was working.
</blockquote>

<hr class="sl">

## Question 5

Is a function like this $f_{n}(f_{n-1}(...f_{2}(f_{1}())...))$ terminal or nonterminal?

<blockquote class="spoiler">
It's a terminal function! We are evaluating n before n+1. So we aren't postponing quite a lot of calculations.
</blockquote>