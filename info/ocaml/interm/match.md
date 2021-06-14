# Match

[Go back](..)

``match`` is a keyword used to match the constructors
of a type.

```ocaml
type person =
  | Anonymous of int
  | Person of string * int 
;;

let age_of_person person = match person with
  | Anonymous(age) -> age
  | Person(_, age) -> age
;;

age_of_person (Anonymous 5);;
(* - : int = 5 *)
age_of_person (Person ("name", 10));;
(* - : int = 10 *)
```

Basically here we matched the type person with the constructors
and added into parenthesis the variable that will be used
to store the constructors parameters (since they got
parameters but don't add anything if they do not). Since
we didn't need the name, we used ``_`` instead of a
(proper) variable name.

Note that we could merge the branches since the code
was the same

```ocaml
let age_of_person person = match person with
  | Anonymous(age) | Person(_, age) -> age 
;;
```

<div class="sr"></div>

## Match on a list

```ocaml
let rec in_list (e:'a) (l:'a list) = match l with
  | [] -> false
 (* we split l in a list looking like hd::tl so an element and then a list

 this is used to put the first element in hd, and the rest of the list in tl

 names are meaningless, you could have done b::z or _::l' like we care, if you wanted
 the two first, you could do a::b::l' etc.
*)
  | hd::tl -> if hd = e then true else in_list e tl
;;
```

Another one

```ocaml
(* true si une map (liste de couples) contient une clef *)
let rec has_key (c:'a) (l:('a * 'b) list) = match l with
 | [] -> false
 | (k,v)::l' -> if k = c then true else has_key c l'
;;

has_key 5 [(2,3); (5,1); (7,9)] ;;
(* - : bool = true *)

has_key 12 [(2,3); (5,1); (7,9)] ;;
(* - : bool = false *)
```

<div class="sl"></div>

## Other

Now you should be good, but please note that you should do
a match on a ``int``. It's working but that's note
like a ``switch`` in `C` (or many other languages) and
you mustn't do that in ``OCaml``. Simply use a `if`
for god sake!