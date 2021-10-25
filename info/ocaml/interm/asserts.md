# Asserts

[Go back](../index.md#intermediary-concepts)

You can use the **assert** to test your code. Assert is taking a boolean and raise the AssertFailure exception if the boolean is false.

```ocaml
assert false
(* Exception: Assert_failure ... *)
```

> **Note**: "assert false" is useful, for instance in a match on a list, which you know that in this case the list isn't empty.

<hr class="sl">

## Simple assert

```ocaml
let x = 5
let _ = assert (x = 5)
```

<hr class="sr">

## Assert a function

```ocaml
let f x = x
let _ = assert (f 5 = 5)
```

<hr class="sl">

## Assert a function raising an exception

```ocaml
let f x = if x < 0 
		  then raise (Failure "not yet")
		  else x

let _ = assert (f 5 = 5)

let _ = assert (
	try (* we are expecting an exception: if there isn' an
	exception, we must (assert false) *)
		f (-2) = 0 && false
	with Failure _ -> true (* ok, we got the exception *)
)
```