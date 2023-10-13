# Folds

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