# ...

[Go back](..)

...

<div class="sl"></div>

And you may use this,

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