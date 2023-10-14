# Examples

### Example 1 - Rotate Left

<div class="row justify-content-center mx-0"><div class="col-4">

[comment]: <> (["1" ["0"] ["3" ["2"] ["4" [Empty] ["5"]]]])

![AVL example 1 - Rotate left](_images/example/ex1_1.jpg)
</div><div class="col-6">

* Adding 5
* $bf(tree) = depth(left) - depth(right) = 0 - 2 = -2$
* The tree is **Right balanced**
* $bf(right) = depth(r\\_left) - depth(r\\_right) = 0 - 1 = -1$
* **Rotate Left**
</div></div>

[comment]: <> (["h=1" ["l=0"] ["rh=3" ["rl=2"] ["rr=4" [Empty] ["5"]]]])
[comment]: <> (["rh=3" ["h=1" ["l=0"] ["rl=2"]] ["rr=4" [Empty] ["5"]]])
[comment]: <> (["3" ["1" ["0"] ["2"]] ["4" [Empty] ["5"]]])

![AVL example 1 - Rotate left - init](_images/example/ex1_2.jpg)
![AVL example 1 - Rotate left - do](_images/example/ex1_3.jpg)
![AVL example 1 - Rotate left - clean](_images/example/ex1_4.jpg)

### Example 2 - Rotate Right

<div class="row justify-content-center mx-0"><div class="col-4">

[comment]: <> (["4" ["2" ["1" ["0"] [Empty]] ["3"]] ["5"]])

![AVL example 2 - Rotate right](_images/example/ex2_1.jpg)
</div><div class="col-6">

* Adding 0
* $bf(tree) = depth(left) - depth(right) = 2 - 0 = 2$
* The tree is **Left balanced**
* $bf(left) = depth(l\\_left) - depth(l\\_right) = 1 - 0 = 1$
* **Rotate Right**
</div></div>

[comment]: <> (["h=4" ["lh=2" ["ll=1" ["0"] [Empty]] ["lr=3"]] ["r=5"]])
[comment]: <> (["lh=2" ["ll=1" ["0"] ["Empty"]] ["h=4" ["lr=3"] ["r=5"]]])
[comment]: <> (["2" ["1" ["0"] ["Empty"]] ["4" ["3"] ["5"]]])

![AVL example 2 - Rotate right - init](_images/example/ex2_2.jpg)
![AVL example 2 - Rotate right - do](_images/example/ex2_3.jpg)
![AVL example 2 - Rotate right - clean](_images/example/ex2_4.jpg)

### Example 3 - Rotate Left Right

<div class="row justify-content-center mx-0"><div class="col-4">

[comment]: <> (["4" ["1" ["0"] ["3" ["2"] ["Empty"]]] ["5"]])

![AVL example 3 - Rotate Left Right](_images/example/ex3_1.jpg)
</div><div class="col-6">

* Adding 2
* $bf(tree) = depth(left) - depth(right) = 2 - 0 = 2$
* The tree is **Left balanced**
* $bf(left) = depth(l\\_left) - depth(l\\_right) = 0 - 1 = -1$
* **Rotate Left Right**
  * We will Rotate Left the left
  * We will Rotate Right the tree
</div></div>

[comment]: <> (["h=4" ["lh=1" ["ll=0"] ["lrh=3" ["lrl=2"] ["lrr=Empty"]]] ["r=5"]])
[comment]: <> (["h=4" ["lrh=3" ["lh=1" ["ll=0"] ["lrl=2"]] ["lrr=Empty"]] ["r=5"]])
[comment]: <> (["lrh=3" ["lh=1" ["ll=0"] ["lrl=2"]] ["h=4" ["lrr=Empty"] ["r=5"]]])
[comment]: <> (["3" ["1" ["0"] ["2"]] ["4" ["Empty"] ["5"]]])

![AVL example 3 - Rotate Left Right - Begin](_images/example/ex3_2.jpg)
**Left Rotation**
![AVL example 3 - Rotate Left Right - Left Rotation](_images/example/ex3_3.jpg)
**Right Rotation**
![AVL example 3 - Rotate Left Right - Right Rotation](_images/example/ex3_4.jpg)
![AVL example 3 - Rotate Left Right - Done](_images/example/ex3_5.jpg)

### Example 4 - Rotate Right Left

<div class="row justify-content-center mx-0"><div class="col-4">

[comment]: <> (["1" ["0"] ["4" ["3" ["2"] ["Empty"]] ["5"] ]])

![AVL example 4 - Rotate Right Left](_images/example/ex4_1.jpg)
</div><div class="col-6">

* Adding 2
* $bf(tree) = depth(left) - depth(right) = 0 - 2 = -2$
* The tree is **Right balanced**
* $bf(right) = depth(r\\_left) - depth(r\\_right) = 1 - 0 = 1$
* **Rotate Right Left**
  * We will Rotate Right the right
  * We will Rotate Left the tree
</div></div>

[comment]: <> (["h=1" ["l=0"] ["rh=4" ["rlh=3" ["rll=2"] ["rlr=Empty"]] ["rr=5"] ]])
[comment]: <> (["h=1" ["l=0"] ["rlh=3" ["rll=2"] ["rh=4" ["rlr=Empty"] ["rr=5"]]]])
[comment]: <> (["rlh=3" ["h=1" ["l=0"] ["rll=2"]] ["rh=4"["rlr=Empty"] ["rr=5"]]])
[comment]: <> (["3" ["1" ["0"] ["2"]] ["4"["Empty"] ["5"]]])

![AVL example 4 - Rotate Right Left - Begin](_images/example/ex4_2.jpg)
**Right Rotation**
![AVL example 4 - Rotate Right Left - Right Rotation](_images/example/ex4_4.jpg)
**Left Rotation**
![AVL example 4 - Rotate Right Left - Left Rotation](_images/example/ex4_3.jpg)
![AVL example 4 - Rotate Right Left - Done](_images/example/ex4_5.jpg)