## Remove an element in a BST

<div class="mt-3">
</div>

* We are removing **3**: we are taking as the new head **4** (the min in the right)
* We are removing **4**: we are taking as the new head **5** (the min in the right)
* We are removing **6**: we are replacing **6** with **"Empty"** as **6** does not have children
* We are removing **5**: we don't have elements in our right, the new tree is made of the previous left

<hr class="sl">

## Check if an element is in a BST

* Is **2** inside? 
  * As **2** is lesser than **3**, we are checking **1**. 
  * As **2** greater than **1**, we are checking **2**.
  * Result: IN. 

![BST mem](_images/mem.png)

An element is **not in** if we can't check the next location we were supposed to check.

<hr class="sr">

## Minimum or Maximum?

* The minimum is the bottom left value, the value
that was lesser than every other value

![BST Minimum](_images/min.png)

* The minimum is the bottom right value, the value
  that was greater than every other value

![BST Maximum](_images/max.png)