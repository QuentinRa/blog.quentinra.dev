# Syntax

Types are inferred, but you may add `: type` after a variable name. In functional programming, types are inferred, so **you shouldn't make an explicit declaration of the type of something**.

```ocaml
let x : float = 5.0
```

<hr class="sr">

## Generic type

Most of the time, you should make generic code. Types are inferred, but sometimes whatever the type of something, your code will work. OCaml infers this type as `'name` such as `'a`, `'b`.

```ocaml
(* the type of a and b does not matters
 type of a = 'a
 type of b = 'b
 return type = 'a
 *)
let f a b = a
```

You could see that as `f(a,b) = a` working whatever a or b given (int, string, ...).

<hr class="sr">

## Structures

Officially, you may only use `if ... else ...`.

```ocaml
(* normal ifelse *)
if condition then expression_if_true else expression_if_false

(* else if *)
if ... then ... else if ... then ... else ...
(* which is in fact... *)
if ... then ... else (if ... then ... else ...)
```

* ✅: You must have an else clause, it's mandatory
* 🤮: do NOT do this

```ocaml
(* bad 🤮, 1 > 0 is already returning true or false *)
let is_1_greater_than_0 = if 1 > 0 then true else false
(* better 😎 *)
let is_1_greater_than_0 = 1 > 0
```