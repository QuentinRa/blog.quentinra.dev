# Composite types

[Go back](../index.md#intermediary-concepts)

A composite type, also called **tuple**, or **record**, is a type made of many types. You could see that as a vector in mathematics. **This is useful because a function may only return one value**, so you can wrap many values inside a tuple using this. **You will also use this when creating new types**.

```ocaml
let person = ("name", 5);;
```

You can create a composite type, also called **tuple** (or record). When the type is made of two types, we are calling it a couple.

```ocaml
let person = ("name", 5)
(* same, but that's not readable 🙄 *)
let person = "name", 5
```

The type is `string * int`.

<hr class="sl">

## Extract values from a couple

When the tuple is made of two types, we are calling it a couple. You got the functions `fst` (first) and `snd` (second), to extract its values.

```ocaml
let name = fst person (* "name" *)
let age = snd person (* 5 *)
```

<hr class="sl">

## Extract values from a tuple

```ocaml
let (name, age) = person

let (name, _) = person (* name only *)
let (_, age) = person (* age only *)
```