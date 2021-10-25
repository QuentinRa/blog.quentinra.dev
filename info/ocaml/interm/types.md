# Creating new types

[Go back](../index.md#intermediary-concepts)

You can create new types using ``type``
keyword.

```ocaml
type anime = string ;;
let a: anime = "One piece" ;;
(* val a : anime = "One piece" *)
```

But you can create more complex types using
constructors. The keyword is ``of``. The idea is

* ``| Name`` : a constructor without any arguments
* ``| Name of ...`` : a constructor with arguments

Notice that the names MUST start with an uppercase.

```ocaml
type person =
  | Anonymous of int
  | Person of string * int 
;;

(* creating a Person *)
let a_person : person = Person ("t", 5)

(* creating a Anonymous *)
let a_person : person = Anonymous 5
```

You will see later how you could extract the arguments
used in the constructor using **match**.

<hr class="sr">

Note that some are removing the first ``|``

```ocaml
type person =
  Anonymous of int
  | Person of string * int 
;;
```

or writing it like that

```ocaml
type person = Anonymous of int | Person of string * int;;
```