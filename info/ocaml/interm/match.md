# Pattern Matching

[Go back](../index.md#intermediary-concepts)

If you are given an int, you know that you can use some ifelse to find what value was given. But what if you are given a list? Or a new type that we created? That's when Pattern Matching comes in handy, as they are breaking a value in constructors.

<hr class="sl">

## Implicit pattern matching

```ocaml
type person = Person of string * int
```

This type is made of only one constructor, that's the only case when you can use implicit pattern matching.

```ocaml
let henry = Person ("Henry", 24)
let Person(name, age) = henry
(* name = "Henry", age = 24 *)
```

Actually, you may use it for functions such as

```ocaml
let get_name (Person (name, _)) = name
let _ = get_name henry (* "Henry" *)
```

<hr class="sl">

## Explicit pattern matching

```ocaml
type person = Anonymous | Person of string * int
```

As a person is now complex, we will use `match` to deconstruct a person. 

```ocaml
let get_name p = match p with
	| Anonymous -> "Anonymous"
	| Person (name, _) -> name

let _ = get_name Anonymous (* "Anonymous" *)
let _ = get_name (Person ("Henry", 24)) (* "Henry" *)
```

Each line of the match is a constructor (and its parameters). You may have a **fallback/default constructor** (`_`)

```ocaml
let is_anonymous p = match p with
	| Anonymous -> true
	| _ -> false (* any other constructor *)

let _ = is_anonymous Anonymous (* true *)
let _ = is_anonymous (Person ("Henry", 24)) (* false *)
```

You may also **merge rules**

```ocaml
let is_alive p = match p with | Anonymous | Person(_,_) -> true
```

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