<hr class="sl">

## Write some code

<hr class="sl">

## Basics concepts

**Some logic**

As everything is a value, you can write `"Hello World"` in the console, and it will be evaluated as `"Hello World"`. Outside the console, as there is no side-effects, **every expression that is not stored in a variable is not evaluated**. **You will also have to call a function to print something**.

```ocaml
"Hello, World" (* ignored *)
let _ = "Hello, World" (* ignored *)
let _ = Printf.printf "%s\n" "Hello, World"
(* same, both \n and @. are the same too *)
let _ = Format.printf "%s@." "Hello, World"
(* parenthesis required, otherwise ocaml will think you gave 3 parameters and only the "1" will match "%d" *)
let _ = Format.printf "%d@." (1+2)
(* same, be wary of this, -1 = two parameters, (-1) = one *)
let _ = Format.printf "%d@." (-1)
```

**Other notes**

* if you are using the console, it's mandatory to add `;;` after each expression
* you can write comments with `(* comment *)`
* According to OCaml directives, **any variable starting with `_` is not saved by the compiler** (use it when you don't need to store a variable).

<hr class="sr">

## Basic concepts

The required elements to write some code are

* [Types](basic/types.md)
* [Operators](basic/operators.md)
* [Structures](basic/structures.md)
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