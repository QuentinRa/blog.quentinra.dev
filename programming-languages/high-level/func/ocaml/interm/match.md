# Explicit pattern matching

You may also **merge rules**

You may also **match multiples variables** in one `match`

```ocaml
let are_both_anonymous p1 p2 = 
	match p1, p2 with
	| Anonymous, Anonymous -> true
	| _ -> false
```

<hr class="sl">

## Explicit pattern matching: lists

As you know, both `[]` and `::` are constructors for lists. Here are some samples

```ocaml
let is_empty l = match l with | [] -> true | _ -> false

(* is e inside l ?*)
let rec mem l e = match l with
	| [] -> false
	| hd::tl -> e = hd || mem tl e
	
(* return the first two values, or raise Not_found *)
let first_two l = match l with
	| a::b::_ -> [a;b]
	| _ -> raise Not_found

let equals l1 l2 = match l1, l2 with
	| [], [] -> true
	| [], _ | _, [] -> false
	| hd1::tl1, hd2::tl2 -> hd1 = hd2 && equals tl1 tl2
```