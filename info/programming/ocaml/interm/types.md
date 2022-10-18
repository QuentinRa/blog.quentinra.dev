# Creating new types

[Go back](../index.md#intermediary-concepts)

You can create new types, or create another name for existing types using the keyword `type`.

<hr class="sl">

## Another name for existing types

```ocaml
type person = string * int
```

```ocaml
let create_person (name: string) (age: int) : person =
    (name, age)

let _ = create_person "Henry" 42 
(* person = ("Henry", 42) *)
```

<hr class="sr">

## One Constructor

You can define constructors to create your new values.

```ocaml
type person = Person of string * int
```

```ocaml
let _ = Person ("Henry", 42)
(* person = ("Henry", 42) *)
```

> **Note**: the name of the constructor must start with an uppercase.

<hr class="sl">

## Multiples constructors

```ocaml
type tree = Empty | Node of tree * int * tree
type tree = | Empty | Node of tree * int * tree
type tree =
    | Empty
    | Node of tree * int * tree
```

All of these expressions are creating a new type of `tree`. We can create

* an empty tree with `Empty`
* a node, with a value (int), and two subtrees (left and right)
    * as the left/right are trees, they can be empty
    * or they can have a value, and ...

```ocaml
let empty_tree = Empty
let node_1 = Node (Empty, 1, Empty)
let node_1_1_1 = Node (node_1, 1, node_1)
```

> **Note**: if you want to extract a value from the tree (ex: you want the value, the left, the right), then check out `match`.