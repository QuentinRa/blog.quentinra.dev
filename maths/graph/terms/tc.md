# Transitive closure

[Go back](..#advanced-terminology)

The transitive closure or ``Fermeture transitive``
noted $\tau$ (tau) is made by adding all the edges that
can be deduced by transitivity.

For instance, if we have $(a,b)$ and $(b,c)$, then we will
create $(a,c)$ if $(a,c)$ does not exists. This is a simple
example but sometimes it could be like
$(a,b)-(b,c)-(c,d)-...-(y-,z)$ then we create $(a,z)$ ...

**Roy–Warshall algorithm** (also called Floyd–Warshall)

* pick a vertex $A$
* for each predecessor of $A$, $p$
  * for each successor of $A$, $s$
    * create $(p,s)$ if $(p,s)$ does not exists