# Binary Search Tree (BST)

<div class="row row-cols-md-2"><div>

A Binary Search Tree (BST) is a tree with each node having up to two children nodes. The complexity is $O{(n)}$, but, on average, we got $O{(h)}$ with $h$ the height of the tree.

The height is the length of the longest path from the root to a leaf.

The idea is quite simple. To add an element `e`, for each node, starting from the root, we compare `e` with its value `v`:

* if `e > v` then we check the right node
* if `e > v` then we check the left node
* if there no more node to check, we add our node
</div><div>

* ✅: easy to learn, and easy to implement
* ✅: faster than an ordered list for `add`, `remove`
* ❌: sightly slower than an ordered list for `mem`, `get_min`
* ❌: [AVL trees](../avl/index.md) are improved BST
* ❌: Unless storing the cardinal, calculating it takes too much time

<details class="details-n">
<summary>Time comparisons - 500 000 values between 0 and 10 000</summary>

Test results of an implementation in [OCaml](/programming-languages/high-level/func/ocaml/index.md).

```text!
>>>>>>>>>> TIME FOR LISTS <<<<<<<<<<
Average time of add:                     0.000046
Average time of remove:                  0.000047
Average time for mem:                    0.002340
Average time for get_min:                0.001870
Average time for cardinal:               0.353290 (long)
>>>>>>>>>> TIME FOR BST <<<<<<<<<<
Average time of add:                     0.000002
Average time of remove:                  0.000002
Average time for mem:                    0.006270
Average time for get_min:                0.003290
Average time for cardinal:               inf (too long)
```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>