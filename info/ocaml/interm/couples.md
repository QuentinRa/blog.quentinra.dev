# Composite types / couples

[Go back](..)

You can create a couple of values.

```ocaml
(* let's say it's for: name, age *)
let person = ("A name", 5);;
```

The type here is ``string * int``. The size doesn't matter,
you can have more than 2 values. But if you got only
two, then you can use 

```
fst person
(* string = "A name" *)
snd person
(* int = 5 *)
```

You can create these but you can also break them!

```ocaml
let (person_name, person_age) = person;;
(*
val person_name : string = "A name"
val person_age : int = 5
*)
```

<div class="sr"></div>

**And the... use of this?**

You will mainly use this when creating new types,
because new types are a couple of existing types.

You could also use that in function, giving a couple instead
of a bunch of parameters but we usually don't do that.

Also, it may be convenient since using that,
you can return "more than one value" in a function,
since you will pack into one variable being a composite type.