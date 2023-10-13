# Functional languages

<div class="row row-cols-md-2"><div>

* [Recursive functions](basic/rec.md)
* [Write some code](basic/exercises.md)
</div><div>

* [Folds](interm/lists.md)
* [Pattern Matching](interm/match.md) 🚀
* [Exceptions](interm/exceptions.md)
* [Asserts](interm/asserts.md)
* [Write some code](interm/exercises.md)

Advanced concepts

* [Interfaces](advanced/interfaces.md)
* [Modules](advanced/modules.md)
* [Functors](advanced/functors.md)
</div></div>

<hr class="sl">

## Data structures

We are testing different ways of storing big amounts of data, along with their efficiency.

* [Binary Search Trees](data/bst.md) (`ABR`)
* [AVL trees](data/avl.md)
* [Zippers](data/zippers.md)

<hr class="sr">

## Meaningless knowledge

<details class="details-e mt-4">
<summary>Comments</summary>

In OCaml, comments are not ignored, and they are really parsed... If you are writing a `"` (quote), the parser will think that you started writing a string, even if you are inside a comment. Hence, if the string is not properly finished (no matching quote), you will have an error, as you would if you wrote a non-terminated string in your code.

It can lead to surprising comments ✌, this one bellow (try it), is a valid comment, but most ocaml highlighters such as the one I'm using, are not parsing it properly.

```ocaml
(* "this is a string *)" *)
```

Also, in OCaml, you can have a comment inside another comment. What I mean, is that you can have a closing comment tag inside another comment... In every other language, you will see an error because the comment would be "(* (* *)", but in OCaml, the code below is working fine

```ocaml
(* (* *) *)
```

</details>