# Exercises

[Go back](..)

If you are eager to do a bunch of exercises
then here you will be able to. This is a project
split into question. A question will require you to do
the previous questions.

Original, french subject can be found
[here](download:IPF_projet_2021.pdf) if you want.

Everything is in French for now, feel free to propose
a translated version (function names etc.).

**You may take 4 hours to do all of theses questions,
but take the time! It's better than your average practical
class**.

<div class="sr"></div>

## Creating some types

An DNA sequence, called "brin" here in French,
is a sequence of nucleotides A, C, G and T.

Create a type for a ``brin`` and a type for `nucleotide`.
Here in a example of what we would want to do

```ocaml
let my_brin : brin = [A;C;G;T];;
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>type nucleotide = A | C | G | T
type brin = nucleotide list
</code></pre>
</blockquote>

<div class="sl"></div>

## Some useless function as a warmup (1 / 2)

Return the proportions of C and G in a brin.

```ocaml
let contenu_gc (x : brin) : float =
    (* your code here *)

contenu_gc [C;T;T;A]
(* - : float = 0.25 *)
```

<blockquote class="spoiler">
Please take note of two things, first we don't use a fold
since we have two parameters. And second, we have two 
accumulators since a smart guy won't use <code>List.length</code>
since we are already iterating the list once so the cost would
be lesser to use another accumulator for the size.

<pre><code class="language-ocaml"
>let contenu_gc (x : brin) : float =
  (* we increase the score by 1 each time we found
  a C or G. Then check the reste of the brin. If there is nothing
  more to check, then we process and evaluate the gc content. *)
  let rec acc (b : brin) (score : float) (size: float) = match b with
    | [] -> score /. size
    | first::other ->
        acc other
          (if (first = C || first = G) then score+.1.0 else score)
          (size +. 1.0) (* increase size, we could use List.length
                        but why would we if we already iterated the list
                        once *)
  in acc x 0.0 0.0 (* start with score=0 and size=0 *)
;;

let _ = assert((contenu_gc [A;T;G;T;T;G;A;C]) = 0.375);;
let _ = assert((contenu_gc [C;T;T;A]) = 0.25);;
let _ = assert((contenu_gc [A;A;A;T;A]) = 0.0);;
</code></pre>
</blockquote>

<div class="sr"></div>

## Some useless function as a warmup (2 / 2)

Make a function returning the complementary of a brin. You may use
``List.rev`` or `List.fold_left` (or `List.fold_right`).

```ocaml
let brin_complementaire (x : brin) : brin =
    (* your code here *)

brin_complementaire [C; T; A; A; T; G; T]
(* - : brin = [G; A; T; T; A; C; A] *)
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let brin_complementaire (x : brin) : brin =
  (*
    Invert the value of a nucleoitide and
    add the result to inverted.
    Called until the inverted everthing.
  *)
  let rec acc (b : brin) (inverted: brin) = match b with
    | A::other -> acc other (T::inverted)
    | T::other -> acc other (A::inverted)
    | C::other -> acc other (G::inverted)
    | G::other -> acc other (C::inverted)
    | [] -> inverted
  in List.rev (acc x []) (* reverse *)
;;
let _ = assert((brin_complementaire [T]) = [A]) ;;
let _ = assert((brin_complementaire [C; T; T; C]) = [G; A; A; G]) ;;
let _ = assert((brin_complementaire [C; T; A; A; T; G; T]) = [G; A; T; T; A; C; A]);;
</code></pre>

You may use a fold

<pre><code class="language-ocaml"
>let brin_complementaire (x : brin) : brin =
(* it's better to reverse rather than fold_right because
fold_right is not terminal*)
List.rev (
List.fold_left (fun inverted brin -> match brin with
| A -> T::inverted
| C -> G::inverted
| G -> C::inverted
| T -> A::inverted )
[] x
)
</code></pre>
</blockquote>

<div class="sl"></div>

## Distance

Make a function returning the distance between two brins. The distance
is defined as the number of nucleotides that must be changed so that
the brins becomes the same brin.

You must raise an exception if the length of the two
brins is not the same.

```ocaml
let distance (x : brin) (y : brin) : int =
    (* your code here *)

distance [G; A; G] [A; G; G]
(* - : int = 2 *)
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let distance (x : brin) (y : brin) : int =
  let rec diff (first: brin) (second: brin) (count: int) = match first with
    | [] -> if (second = []) then count else failwith "length not the same"
    | e::other -> match second with
      | [] -> failwith "length not the same"
      | e2::other2 -> diff other other2 (if ( e2 = e ) then count else count+1)
  in diff x y 0
;;
(* test normal casses *)
let _ = assert(distance [T] [T] = 0) ;;
let _ = assert(distance [T] [C] = 1) ;;
let _ = assert(distance [G; A; G] [A; G; G] = 2);;
(* test errors *)
let _ = assert((try distance [T] [] with Failure _ -> -1) = -1) ;;
let _ = assert((try distance [] [T] with Failure _ -> -1) = -1) ;;
</code></pre>
</blockquote>

<div class="sr"></div>

## Similarity

Return the similarity between two brins. It's
**one** minus the distance divided by the size of one
of your two brins.

You must raise an exception if the length of the two
brins is not the same.

You may use ``float_of_int`` to convert an int to a float.

```ocaml
let similarite (x : brin) (y : brin) : float =
    (* your code here *)

similarite [C;G;A;T] [T;A;G;T]
(* - : float = 0.25 *)
```

<blockquote class="spoiler">
Remember that distance already raise an exception, don't do
it twice! And don't forget the conversations.

<pre><code class="language-ocaml"
>let similarite (x : brin) (y : brin) : float =
  1.0 -. (float_of_int (distance x y) /. float_of_int (List.length x))
;;
let _ = assert(similarite [C;G;A;T] [T;A;G;T] = 0.25);;
let _ = assert(similarite [A;G;C;T] [T;A;A;G] = 0.0);;
let _ = assert(similarite [A;G;C;T] [A;G;C;T] = 1.0);;
</code></pre>
</blockquote>

<div class="sr"></div>

## Other questions

Todo: complete the rest of this page.
My work is [here](download:ipf/ipf_code_projet.ml).
