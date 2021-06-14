# Basic exercises

Write a function returning true is the number is pair,
false else.

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>(* a int is also a float so that's a number *)
let is_pair (number: float) : bool = 
  (* substract 2 until we got 0 (so number%2=0) or1
     so number%2=1 *)
  let rec check_number (number: float) : bool = 
    if number = 1.0 then false
    else 
    if number = 0.0 then true else check_number (number -. 2.0)
  in check_number number
;;</code></pre>

As a side note, you already have a operator ``mod`` but it's
not working on float.
</blockquote>

<div class="sr"></div>

...