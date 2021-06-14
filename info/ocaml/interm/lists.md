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

<div class="sr"></div>

# List methods

```ocaml
let l3 = [1;3;5]
```

* ``List.map`` : apply a function to all elements of your list
```ocaml
List.map ('a -> 'b) -> 'a list -> 'b list
(* ex *)
let l3_square = List.map (fun x -> x * x) l3
```
* ``List.mem``: true if element in list
```ocaml
List.mem 'a -> 'a list -> bool
(* ex *)
let is_5_in_l3 = List.mem 5 l3
```
* ``List.hd``: return the first element of the list
```ocaml
List.hd 'a -> 'a list -> bool
(* ex *)
let x = List.hd l3;;
```
* ``List.tl``: return the list without the 3rd one
```ocaml
List.tl 'a list -> 'a list
(* ex *)
let y = List.tl l3;;
```
* ``List.rev``: reverse a list
```ocaml
List.rev 'a list -> 'a list
(* ex *)
let l3_rev = List.rev l3;;
(* get last *)
let z = List.hd (List.rev l3);;
(* add at the end *)
let l4 = let l4 = List.rev ( 9 ::(List.rev l3) );;
```
* ``List.concat``: merge lists into one
```ocaml
List.concat 'a list list -> 'a list
(* ex *)
let l5 = List.concat [l3;l3];;
```
* ``List.length``:
```ocaml
List.length 'a list -> int
(* ex *)
List.length l3
```

Note that ``@`` operator is the same as
``List.concat`` so `a@b` merge list a with
list b. But you shouldn't have to use this unless
you are not doing things properly.
    
READ [HERE](https://ocaml.org/api/List.html)