# Breadth-first search

[Go back](..)

In French it's called ``Parcours en profondeur``. To summarize,
you will traverse a path until you can't go further, then
come back at a previous branching and do it again until
you traversed every branch.

**Algorithm**

* randomly pick a starting vertex
* make it as traversed
* then
  * randomly pick of a neighbor not traversed and not done
  * if you can
    * then mark the vertex as traversed 
    * repeat
  * else
    * then mark this vertex as done
    * go back to a traversed vertex
    * if there is no traversed vertex remaining then you are done
