# Variables

[Go back](..)

Use the ``let`` keyword to create a variable.

```ocaml
let x = 5;
```

Note

* you must give a value
* if you redeclare a variable with the same name,
the previous one is destroyed
* you can't change a variable value
* the name starts by a lowercase (otherwise `Unbound constructor`)

**If a variable isn't declared, you will get the
error ``Unbound value xxxxx``**.

<div class="sl"></div>

**A lot of initializations at once**

Using the ``and`` keyword, you can create a bunch of 
variables in one expression.

```ocaml
let x = 5 and y = 6;;
```

<div class="sr"></div>

**More complex initialization**

You might want to init a variable having a complex
value. You can do that using the ``let ... in`` keyword.

```ocaml
let x = 3 in x * x
(* x = 3 but this expression is evaluated as 9
so we can do this, and r = 9
*)
let r = let x = 3 in x * x
```

Note that everything after the ``in`` is "private"
meaning that any variable declared after the in is not
accessible in the rest of the code.

```ocaml
let r = let x = 3 in x * x
```

**Here is x not defined, only ``r`` will be created**
(not x).

Another more meaningful example would be,
since x is complex and we do not want to write it
2 (or more) times.

```ocaml
let x = 5.0/.15.0 in x *. x *. 5.0
```

<div class="sl"></div>

**Unnamed variable**

You can have variable without a name, for instance
if you are forced to create a variable later or if
you are printing something.

According to OCaml directives, 
**any variable starting with a _ is not saved by
the compiler**.

```ocaml
let _ = Printf.printf "%s" "Hello world"
```

> Hey, why do I store printf result if we are not going to use
> it?
> 
> First printf return a unit() kind of value. We are only
> saving it since the OCaml compiler won't execute a statement
> if we are not storing the result (since every statement
> should be pure or looks like it otherwise for ocaml
> compiler that just some useless code).
> 
> You must make ocaml believe that your statement is
> really a functional one (not the case, a print is
> not pure at all) by making like the statement is
> evaluated as a value.