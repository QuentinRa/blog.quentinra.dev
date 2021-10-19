# Asserts

[Go back](..)

You can use the assert function to test your code.
Assert is taking a boolean and raise the AssertFailure
exception if the boolean is false.

```
assert(false)
(* Exception: Assert_failure ("//toplevel//", 8, 8). *)
```

So you usually write some code like this****

```ocaml
let rec pow x power = 
  if (power = 1) then x else x * (pow x (power-1))

let _ = assert(pow 5 3 = 125)
```

<div class="sl"></div>

**Asserts on function raising exceptions**

And you may use this if your function is raising an
exception,

```ocaml
let string_of_float (x: float) : string =
  failwith "not implemented yet." 

let _ = assert(
  try 
    string_of_float 5.0 = "5.0"
  with
  | Failure _ -> false 
)
```

To make a trycatch of a function that may raise an exception.
Note that ``string_of_float 5.0 = "5.0"`` and `false`
have the same type so that's okay, and that's a boolean
so assert is taking it "as if".

Another example.

```ocaml
let create_list (size: int) : 'a list =
  failwith "not implemented yet." 

let _ = assert(
  try 
    create_list 0 = []
  with
  | Failure _ -> false 
)
```