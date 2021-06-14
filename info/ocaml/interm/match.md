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