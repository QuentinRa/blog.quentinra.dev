# Topological sorting

[Go back](..#sorting-and-search)

This is an order in which each vertex is before its successors. You will start with the vertex having no successors, then

* remove them from the Graph
* new vertex without successor (or with less successor) should appear

Repeat until the graph is empty.