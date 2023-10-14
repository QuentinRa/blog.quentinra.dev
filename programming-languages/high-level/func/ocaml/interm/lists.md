# Folds

If you are planning to call a function on every element of the list (`such as List.map`), but unlike with map, you need to update a result (**accumulator**), then you will use folds.

Examples

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