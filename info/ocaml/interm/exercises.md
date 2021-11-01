# Exercises

[Go back](../index.md#intermediary-concepts)

If you are eager to do a bunch of exercises, then here you will be able to. This is a project split into questions. Most of them are dependent on the previous ones.

The original subject, in French, [can be found here](https://github.com/memorize-code/memorize-references/raw/main/info/ocaml/IPF_projet_2021.pdf).

**It may take around 4 hours to do all of these questions**.

<hr class="sr">

## Creating some types

A DNA sequence, called `brin` here in French, is a sequence of nucleotides A, C, G, and T.

Create a type for a `brin` and a type for `nucleotide`. Here is an example of a variable having the type `brin`.

```ocaml
let my_brin : brin = [A;C;G;T]
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>type nucleotide = A | C | G | T
type brin = nucleotide list
</code></pre>
</blockquote>

<hr class="sl">

## Some useless function as a warm-up (1 / 2)

Return the proportions of C and G in a brin.

```ocaml
let contenu_gc (x : brin) : float =
    (* your code here *)

contenu_gc [C;T;T;A]
(* - : float = 0.25 *)
```

<blockquote class="spoiler">
Please take note of two things, first, we don't use a fold since we have two parameters. And second, we have two accumulators since a smart guy won't use <code>List.length</code> since we are already iterating the list once so the cost would be lesser to use another accumulator for the size.

<pre><code class="language-ocaml"
>let contenu_gc (x : brin) : float =
  (* we increase the score by 1 each time we found
  a C or G. Then check the rest of the brin. If there is nothing
  more to check, then we process and evaluate the score. *)
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

<hr class="sr">

## Some useless function as a warm-up (2 / 2)

Write a function returning the complementary of a brin. You may use `List.rev` or `List.fold_left` (or `List.fold_right`).

```ocaml
let brin_complementaire (x : brin) : brin =
    (* your code here *)

brin_complementaire [C; T; A; A; T; G; T]
(* - : brin = [G; A; T; T; A; C; A] *)
```

Note that C becomes G (and G->C) and A becomes T (and T -> A).

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let brin_complementaire (x : brin) : brin =
  (*
    Invert the value of a nucleotide and
    add the result to inverted.
    Called until the inverted everything.
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

<hr class="sl">

## Distance

Write a function returning the distance between two brins. The distance is defined as the number of nucleotides that must be changed so that the brins become the same brin.

You must raise an exception if the length of the two brins is not the same.

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

<hr class="sr">

## Similarity

Return the similarity between two brins. It's **one minus the distance**, then **divide** everything **by the length** <small>(of one of your two brins, as they got the same length)</small>. **You must raise an exception if the length of the two brins is not the same.**

You may use `float_of_int` to convert an integer to a float number.

```ocaml
let similarite (x : brin) (y : brin) : float =
    (* your code here *)

similarite [C;G;A;T] [T;A;G;T]
(* - : float = 0.25 *)
```

<blockquote class="spoiler">
Remember that distance already raises an exception, don't do it twice! And don't forget the conversations.

<pre><code class="language-ocaml"
>let similarite (x : brin) (y : brin) : float =
  1.0 -. (float_of_int (distance x y) /. float_of_int (List.length x))
;;
let _ = assert(similarite [C;G;A;T] [T;A;G;T] = 0.25);;
let _ = assert(similarite [A;G;C;T] [T;A;A;G] = 0.0);;
let _ = assert(similarite [A;G;C;T] [A;G;C;T] = 1.0);;
</code></pre>
</blockquote>

<hr class="sr">

## New type: tree

Create a new type, called `arbre_phylo` to represent a **binary** tree. Each branch has a `brin` and a malus.

<img src="/courses/info/ocaml/interm/ipf/tree.png"
alt="tree" width="500"/>

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>type arbre_phylo =
  (* we only have a brin for a leaf *)
  | Lf of brin
  (* a branch have two arbre_phylo (left/right), a brin and a malus *)
  | Br of arbre_phylo * brin * int * arbre_phylo
</code></pre>
</blockquote>

A malus is defined by the sum of the distances (using the function created a while back) of a node with the two children nodes.

For instance ACAT = 3 is the result of $distance(ACAT, GCAT) + distance(ACAT, TCGT) = 1 + 2 = 3.$

For AAAA, it would be $distance(AAAA, ACAT) + 3 + distance(AAAA, AAGA) + 2 = 2 + 3 + 1 + 2 = 8.$

<hr class="sl">

## string_of_arbre_phylo

Simply write a function to print your tree.


```ocaml
let rec arbre_phylo_vers_string (a : arbre_phylo) : string =
    (* your code here *)
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let rec arbre_phylo_vers_string (a : arbre_phylo) : string = match a with
  (* convert a brin to string *)
  | Lf(a) -> let rec brin_vers_string (b: brin) (acc: string) : string =
               match b with
               | A::other -> brin_vers_string other acc ^ "A"
               | C::other -> brin_vers_string other acc ^ "C"
               | G::other -> brin_vers_string other acc ^ "G"
               | T::other -> brin_vers_string other acc ^ "T"
               | [] -> acc
               (* I reversed it here instead of changing acc ^ *)
      in brin_vers_string (List.rev a) ""
      (* if it's a branch then we print brin : value
      ( left part, right part) and of course we use arbre_phylo_vers_string *)
  | Br(left, b, v, right) -> arbre_phylo_vers_string (Lf b) ^ ":" ^
                             string_of_int v^
                             "=(" ^
                             arbre_phylo_vers_string left ^
                             "," ^
                             arbre_phylo_vers_string right
                             ^ ")"
;;
let _ = assert(arbre_phylo_vers_string (Lf [G;C;A;T]) = "GCAT")
let _ = assert(arbre_phylo_vers_string (Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],8,
    (Br((Lf [T;A;G;A]),[A;A;G;A],2,(Lf [G;A;G;A])))
  )) = "AAAA:8=(ACAT:3=(GCAT,TCGT),AAGA:2=(TAGA,GAGA))")
</code></pre>
</blockquote>

<hr class="sr">

## Similar

Given a list of trees, return the most similar one. You will use `similarite` function created before. The one with the highest sum of `similarite` with our brin being the most similar one.

```ocaml
let similaire (a : arbre_phylo) (l : arbre_phylo list) : arbre_phylo
    (* your code here *)
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let similaire (a : arbre_phylo) (l : arbre_phylo list) : arbre_phylo =
  let length = List.length l in
  (* 0 other list *)
  if (length = 0) then failwith "Not even one"
  (* only one other *)
  else if (length = 1) then List.hd l
  else (* check all*)
    (*
      We are putting in s the tree that is the most similar
      and v the similar value.
      l is our list of three.
    *)
    let rec acc (l : arbre_phylo list) (s:arbre_phylo) (v: float) : arbre_phylo = match l with
      | l::other -> (* check value for the first *)
          let rec sum_sim (s1 : arbre_phylo) (s2: arbre_phylo) : float  = match s1 with
              (* if we got a leaf, then check both leaf *)
            | Lf(a) -> (match s2 with
                | Lf(b) -> similarite a b
                | _ -> failwith "Error, not a leaf at the same place")
            (* if we got a branch, then check each branch *)
            | Br(left, a,_,right) -> (match s2 with
                | Br(leftS2, aS2, _, rightS2) -> (sum_sim left leftS2) +.
                                                 (sum_sim (Lf a) (Lf aS2)) +.
                                                 (sum_sim right rightS2)
                | _ -> failwith "Branch not at the same place."
              )
            (* save the sum in r *)
          in let r : float = sum_sim l a
          (* check if sum is greater *)
          in if (r > v)
          (* yes, replace *)
          then acc other l r
          (* no continue *)
          else acc other s v
      | [] -> s
    in acc l (List.hd l) (-1.0)
;;</code>
<code class="language-ocaml">
let tree1 = Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],8,
    (Br((Lf [T;A;G;A]),[A;A;G;A],2,(Lf [G;A;G;A])))
  );;
</code>
<code class="language-ocaml">
(* not like tree 1 at all *)
let tree2 = Br(
    (Br( (Lf [G;A;A;T]), [G;G;C;T], 5, (Lf [C;A;G;T]) ) ),
    [A;A;T;A;],12,
    (Br((Lf [T;A;G;A]),[A;A;G;A],3,(Lf [G;T;G;A])))
  );;
</code>
<code class="language-ocaml">
(* not like tree 1 at all, like tree2 *)
let tree3 = Br(
    (Br( (Lf [G;A;A;T]), [G;G;C;T], 5, (Lf [C;A;G;T]) ) ),
    [A;A;T;A;],14,
    (Br((Lf [T;A;G;A]),[C;C;G;C],5,(Lf [G;T;G;A])))
  );;
</code>
<code class="language-ocaml">
(* almost tree1 but one change *)
let tree4 = Br(
    (Br( (Lf [G;C;A;T]), [A;C;A;T], 3, (Lf [T;C;G;T]) ) ),
    [A;A;A;A;],9,
    (Br((Lf [T;A;G;A]),[C;A;G;A],2,(Lf [G;A;G;A])))
  );;
</code>
<code class="language-ocaml">
(* test empty *)
let _ = assert((try similaire tree1 [] with Failure _ -> tree1) = tree1);;
(* simple test *)
let _ = assert (similaire tree1 [tree2] = tree2);;
(* should be tree4 since almost the same *)
let _ = assert (similaire tree1 [tree2; tree3;tree4] = tree4);;
(* should be tree1 since tree1 = tree1 *)
let _ = assert (similaire tree1 [tree1; tree3;tree4] = tree1);;
</code></pre>
</blockquote>

<hr class="sl">

## Getters and constructor

Write a function returning the malus of the head. Write a function returning the brin of the head. Write a function creating an `arbre_phylo`.

```ocaml
let get_root (a : arbre_phylo) : brin =
    (* your code here *)

let get_malus (a : arbre_phylo) : int =
    (* your code here *)

let br (ag : arbre_phylo) (b : brin) (ad : arbre_phylo) : arbre_phylo =
    (* your code here *)
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let get_root (a : arbre_phylo) : brin = match a with
  | Lf(a) -> a
  | Br(_,b,_,_) -> b
;;
(* tests *)
let _ = assert(get_root tree1 = [A;A;A;A;]);;
let _ = assert(get_root tree2 = [A;A;T;A;]);;
let _ = assert(get_root tree3 = [A;A;T;A;]);;
</code>
<code class="language-ocaml"
>
let get_malus (a : arbre_phylo) : int = match a with
  | Lf(_) -> 0
  | Br(_,_,v,_) -> v
;;
(* tests *)
let _ = assert(get_malus tree1 = 8);;
let _ = assert(get_malus tree2 = 12);;
let _ = assert(get_malus tree3 = 14);;
</code>
<code class="language-ocaml"
>let br (ag : arbre_phylo) (b : brin) (ad : arbre_phylo) : arbre_phylo =
  let agM = get_malus ag in (* get left malus *)
  let adM = get_malus ad in (* get right malus *)
  let agR = get_root ag in (* get left root *)
  let adR = get_root ad in (* get right malus *)
  (* malus is distance with each left and right, with the malus of left and right *)
  let malus = agM + adM + (distance b agR) + (distance b adR) in
  (* create brin *)
  let brin = Br(ag, b, malus, ad)
  in brin (* we could have skipped this variable but for the sake of transparency *)
;;
(* some tests *)
let _ = assert(br (Lf [C;T]) [A;A] (Lf [T;C]) = Br (Lf [C; T], [A; A], 4, Lf [T; C]))
let _ = assert(br (Lf [A;T]) [A;A] (Lf [T;C]) = Br (Lf [A; T], [A; A], 3, Lf [T; C]))
</code>
</pre>
</blockquote>

<hr class="sr">

## min_malus

Write a function taking a list of trees and returning the one with the least malus.

You simply have to check the head of the tree and compare the malus values.

```ocaml
let min_malus (l : arbre_phylo list) : arbre_phylo = 
    (* your code here *)
```

<blockquote class="spoiler">
<pre><code class="language-ocaml"
>let min_malus (l : arbre_phylo list) : arbre_phylo = match l with
  | [] -> failwith "Empty list"; (* list is empty, I can't use List.hd so get out *)
  | _ ->
      (*
      check the min in the list.
      Save in r the arbre_phylo and v the min
      value of malus that we found.
      *)
      let rec check_min (l: arbre_phylo list) (r: arbre_phylo) (v: int) = match l with
        | l::other ->
          (* get current malus *)
            let currentMalus = get_malus l in
            if (currentMalus < v) (* we got a malus lesser then ours *)
            then (* replace *)
              check_min other l currentMalus
            else (* check next *)
              check_min other r v
        | [] -> r
        (* first is the king, max_int is the value we need to beat, easy :) *)
      in check_min l (List.hd l) max_int
;;
(* the first is the min_malus here *)
let _ = assert(min_malus (gen_phylo [A;C] [C;A] [G;A]) = Br (Lf [A; C], [C; A], 3, Lf [G; A]))
</code></pre>
</blockquote>