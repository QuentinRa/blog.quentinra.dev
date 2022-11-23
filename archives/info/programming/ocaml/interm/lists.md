# Lists

[Go back](../index.md#intermediary-concepts)

A list is an array of values. Every value in a list got the same type.

```ocaml
type 'a list = [] | (::) of 'a * 'a list
```

* `[]`: empty list
* `a::list`: create a list with `a` then a list `list`

> **Notice** that the type is `'a`, meaning that we can create a list of int, float, ... or even a list of lists <small>(if 'a = int list then we got int list list)</small> with this constructor.

<hr class="sl">

## New list

As you read, a list is either an empty list or a value followed by a list, so we have

```ocaml
let empty_list = []
(* both are the same *)
let list_5 = 5::[]
let list_5 = [5]
(* Both are giving the same result *)
let list_7_5 = 7::list_5 (* append *)
let list_7_5 = [7;5] (* create *)
```

You may use `@` to add a value at the end of the list such as `[5;6]@[7]`, but my teachers are **against this** <small>("There is always a better way to do something, without using this sh*t")</small>.

> * `[]`: empty list <small>(result: `[]`)</small>
> * `[a;b;...]`: a list with a, b, ... <small>(result: `[a;b,...]`)</small>
> * `a::[]`: add `a` to empty list <small>(result: `[a]`)</small>
> * `a::b::[]`: add `b` then `a` to empty list <small>(result: `[a;b]`)</small>
> * `a::list`: add `a` to the list `list` <small>(result: `[a;...]`)</small>

> **Notice**: the values are separated by a semi-colon (`;`), we are already using commas (`,`) for composite types after all 😱.

<hr class="sr">

## Some functions

```ocaml
let length = List.length [5;6] (* 2 *)
let merge = List.concat [[5;6];[7;8]] (* [5;6;7;8] *)
let reversed = List.rev [5;6] (* [6;5] *)
let head = List.hd [5;6] (* 5 *)
let tail = List.tl [5;6] (* [6] *)
let is_inside = List.mem 5 [5;6] (* true *)

(* higher-order function 🚀 *)
let plus_one = List.map (fun x -> x+1) [5;6] (* [6;7] *)
let remove_five = List.filter (fun x -> x <> 5) [5;6] (* [6] *)
```

You got the [complete list of functions here](https://ocaml.org/api/List.html).

<hr class="sl">

## Folds

If you are planning to call a function on every element of the list (`such as List.map`), but unlike with map, you need to update a result (**accumulator**), then you will use folds.

Examples

* **I want the min value in a list**
  * I will store in an accumulator the first value ("init")
  * I will check every value, and update my accumulator if needed ("update")
* **I want the number of elements in a list (without List.length)**
  * I will store 0 in an accumulator ("init")
  * Each time I will find an element, I will increase my accumulator by one ("update")

As "accumulator" is too wordy, I will go with "acc". You got either `List.fold_left` <small>(terminal)</small> or `List.fold_right` <small>(non terminal)</small>.

<div>$$
\[
\begin{split}
f_{n}(f_{n-1}(...f_{2}(f_{1}(list))...))\quad \scriptsize\text{(fold left)}\\
\textbf{vs}\\
f_{1}(f_{2}(...f_{n-1}(f_{n}(x))...))\quad \scriptsize\text{(fold right)}
\end{split}
\]
</div>

* **List.fold_left**: ``('a -> 'b -> 'a) -> 'a -> 'b list -> 'a``
* **List.fold_right**: ``('a -> 'b -> 'b) -> 'a list -> 'b -> 'b``

<details class="details-e">
<summary>List.length with fold</summary>

With a fold_left

```ocaml
let get_length l =
	List.fold_left
		(fun acc _ -> acc + 1) (* update *)
		0 (* init *)
		l (* what are we iterating? *)
```

With a fold_right

```ocaml
let get_length l =
	List.fold_right
		(fun acc _ -> acc + 1) (* update *)
		l (* what are we iterating? *)
		0 (* init *)
```
</details>

<details class="details-e">
<summary>List.min with fold</summary>

With a fold_left

```ocaml
let get_min l =
	(* raise exception if not in the list *)
	if l = [] then raise Not_found
	(* else do your job *)
	else List.fold_left
		 (fun acc v -> if v < acc then v else acc) (* update *)
		 (List.hd l) (* init *)
		 l (* what are we iterating? *)
```

With a fold_right

```ocaml
let get_min l =
	(* raise exception if not in the list *)
	if l = [] then raise Not_found
	(* else do your job *)
	else List.fold_right
		 (fun v acc -> if v < acc then v else acc) (* update *)
		 l (* what are we iterating? *)
		 (List.hd l) (* init *)
```
</details>