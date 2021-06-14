# Lists

[Go back](..)

A list is basically an array of values. The type is
``'a list`` but you can make a list of float (for instance)
and you will have ``float list``.

```ocaml
let sample_list = [5.0;0.2];;
(* val sample_list : float list = [5.; 0.2] *)
```

**Notice** that the separator for values is ``;``. After
all ``,`` is already used for composite types.

<div class="sr"></div>

## Creating a list

* ``[]``: empty list
* ``[a;b;...]``: a list with some values
* ``a::[]``: add `a` to empty list
* ``a::b::[]``: add `a` and `b` to empty list
* ``a::list``: add `a` to the list `list`

```ocaml
let my_list = 5::3::[];;
(* - : int list = [5; 3] *)

let my_list = 7::my_list;;
(* val my_list : int list = [7; 5; 3] *)
```

If you understood, the last argument is where we will put
our values and the first are the type of our values.
In other word, if ``a`` is a list then
``list`` must be a list of lists in order to write
``a::list``.

```ocaml
(* here that's working since my_list was
a list of int and 7 is a int *)
let my_list = 7::my_list;;
(* val my_list : int list = [7; 5; 3] *)

(* but that is not working since 7 can't
 contains a list of ints *)
let my_list = my_list::7;;

(* and that's working because an empty list
can contains another list *)
let my_list = my_list::[];;
(* my_list : int list list = [[7; 5; 3]] *)

(* working since my_list is a list of lists *)
let my_list = [5;3]::my_list;;
(* val my_list : int list list = [[5; 3]; [7; 5; 3]] *)

(* same as above *)
let my_list = (5::3::[])::my_list;;
(* val my_list : int list list = [[5; 3]; [5; 3]; [7; 5; 3]] *)
```

<div class="sl"></div>

# Iterate a list

You will use functions in order to iterate your list, but for
that you need to read about ``match`` in the next part.

Note that a list like the new types we saw, have constructors
like
* ``[]``
* ``a::[]``
* ...

