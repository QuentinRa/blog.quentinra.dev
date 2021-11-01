# Syntax

[Go back](../index.md#basic-concepts)

In OCaml, types are inferred as it should be for functional languages. We are not talking about statements but expressions too.

<hr class="sl">

## General Stuff

You can make comments with `(* a comment *)`.

When calling a function, we are not doing something like 

```ocaml
(* a function *)
let main argc argv = (* some code *)

let _ = main (1, "test") (* "NOT WORKING"-> one argument instead of two *)
let _ = main 1 "test" (* USUAL WAY *)
let _ = main (1) ("test") (* working but why??? 🤮 *)
let _ = main (-1) "test" (* -1 is '-' and '1' so you need parenthesis *)
```

<hr class="sr">

## Types

| | int | float | bool | char | string | unit | list |
|-----|-----|-----|-----|-----|-----|-----|-----|
| values | `5`, `0x29a` | `5.0`, `5.` | `true` | `'5'` | `"5"` | `()` | `[]` |
| operators | `+` `-` `*` `/`<br> `mod` | `+.` `-.` `*.` `/.` <br>`**` (pow) | `not` `&&` <code>\|\|</code> | | `^` (concat) | | `@` `::` |
| example | `5 + 0` | `5.0 +. 0.0` | `not true` | | `"ab" ^ "c"` | | `5::[]` |

* **Note**: You can convert a variable with functions such as `string_of_int` (int -> string).
* **Note**: unit should not be used, at least when practicing the functional paradigm, this is a sort of `void`. You may use it when a function is not returning something, or not taking something in argument <small>(but try to use it the least possible)</small>
* **Note**: [Functions on string](https://ocaml.org/api/String.html) (String.equal, String.length, ex: `String.length "5"`)
* **Note**: As in functional programming, types are inferred, you should never make an explicit declaration of the type of something.

Types are inferred, but you may add `: type` after a variable name, but we are usually not doing this. 

```ocaml
let x : float = 5.0
```

<hr class="sr">

## Generic type

Most of the time, you should make generic code. Types are inferred, but sometimes whatever the type of something, your code will work. OCaml infer this type as `'name` such as `'a`, `'b`.

```ocaml
(* the type of a and b does not matters
 type of a = 'a
 type of b = 'b
 return type = 'a
 *)
let f a b = a
```

You could see that as `f(a,b) = a` working whatever a or b given (int, string, ...).

<hr class="sl">

## Compare values

* `=` (same content) or `<>` (different content)
* `==` (same address) or `!=` (different address)
* Use `not` to inverse a boolean in OCaml (**AND NOT `!bool`**)
* `>=, >, <=, <`
* you got a function `Stdlib.compare a b` (-1, 0, 1)

> **A lot of folks are using `!=` for the difference**. That's working most of the time, so it's fine, but they should use `<>`. You will learn it soon when you will try `!true` and remember than `! <=> address` so you must use `not true` 😱.

<hr class="sr">

## Structures

Officially, you may only use `if ... else ...`.

```ocaml
(* normal ifelse *)
if condition then expression_if_true else expression_if_false

(* else if *)
if ... then ... else if ... then ... else ...
(* which is in fact *)
if ... then ... else (if ... then ... else ...)
```

* ✅: You must have a else, it's mandatory
* 🤮: do NOT do this

```ocaml
(* bad 🤮, 1 > 0 is already returning true or false *)
let is_1_greater_than_0 = if 1 > 0 then true else false
(* better 😎 *)
let is_1_greater_than_0 = 1 > 0
```