# Basic exercises

[Go back](../index.md#basic-concepts)

A bunch of simple exercises in OCaml, summarizing what you learned in the section "Basic concepts".

<hr class="sl">

## Exercise 1

Write a function returning true is a number is pairwise, false else.

```ocaml
val is_pair : float -> bool
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let is_pair (number: float) : bool = 
	(* subtract 2 until we got 0 (so number%2=0) or 1 so number%2=1 *)
	let rec check_number (number: float) : bool = 
	    if number = 1.0
		then false
	    else if number = 0.0
			 then true
			 else check_number (number -. 2.0)
	in check_number number</code></pre>

As a side note, you already have an operator ``mod`` but it's
not working on reals.
</blockquote>