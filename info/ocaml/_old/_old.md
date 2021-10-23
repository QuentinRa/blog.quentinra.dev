# Basics concepts

You can make comments with `(* a comment *)`.

<details class="details-e">
<summary>Types</summary>

Types are inferred, but you may add `: type` after a variable name (ex: `let x : float = 5.0`)

| int | float | bool | char | string | unit | list |
|-----|-----|-----|-----|-----|-----|-----|
| `5`, `0x29a` | `5.0` | `true` | `'5'` | `"5"` | `()` | `[]` |
| `+` `-` `*` `/` | `+.` `-.` `*.` `/.` | `not` `&&` <code>\|\|</code> | | `^` (concat) | | `@` `::` |
| `5 + 0` | `5.0 /. 1.0` | `not true` | | `"ab" ^ "c"` | | `5::[]` |

* **Note**: You can convert a variable with functions such as `string_of_int` (int -> string).
* **Note**: unit should not be used, this is a sort of `void`. You may use it when a function is not returning something, or not taking something in argument
* **Note**: [Functions on string](https://ocaml.org/api/String.html) (String.equal, String.length, ex: `String.length "5"`)
* **Note**: As in functional programming, types are inferred, you should never make an explicit declaration of the type of something.
</details>

<details class="details-e">
<summary>Generic type</summary>

Most of the time, you should make generic code. Types are inferred, but sometimes whatever the type of something, your code will work. OCaml infer this type as `'name` such as `'a`, `'b`.

```ocaml
(* the type of a and b does not matters
 type of a = 'a
 type of b = 'b
 return type? 'a
 *)
let a_function a b = a
```

You could see that as `f(a,b) = a` working whatever a or b given (int, string, ...).
</details>

<details class="details-e">
<summary>Compare values</summary>

* `=` (same content) or `<>` (different content)
* `==` (same address) or `!=` (different address)
* Use `not` to inverse a boolean in OCaml (**AND NOT `!bool`**)
* `>=, >, <=, <`
* you got a function `Stdlib.compare a b` (-1, 0, 1)
</details>

## older

You can make comments with `(* a comment *)`.

You can declare variables with

```ocaml
let x = 5 (* x = 5 *)
let x = 10 and y = 10 (* x = 10, y = 10 *)
(* x is a local variable, scope=declaration *)
(* use this when you need to calculate a complex value *)
let y = let x = 1.0 /. 3.0 in x *. x;; (* x = 10, y = 1/9 *)
```

```ocaml
if (condition) then true else false
for i = startval to endval do (* code *) done
while condition do (* code *) done
```

* [Variables](basic/variables.md)
* [Functions](basic/functions.md)
* [Recursion](basic/rec.md)

You might challenge yourself with these exercises

* [MCQ](basic/mcq.md)
* [Write some code](basic/exercises.md)

<hr class="sl">

## Intermediary concepts

Then you need to know about all of these since
aside from zippers, you will use them quite a lot.

* [Composite types / couples](interm/couples.md)
* [Creating types](interm/types.md)
* [Lists](interm/lists.md)
* [Match](interm/match.md)
* [Folds](interm/fold.md)
* [Zippers](interm/zippers.md)
* [Exceptions](interm/exceptions.md)

And you may want to do some tests using assertions

*  [Asserts](interm/assets.md)

And here some exercises

* MCQ (not yet)
* [Write some code](interm/exercises.md)