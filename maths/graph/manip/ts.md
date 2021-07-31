# Topological sorting

[Go back](..#sorting-and-search)

This is an order in which each vertex is before it successors. You will start
with the vertex having no successors, then

* remove them from the Graph
* new vertex without successor (or with less successor) should appear

Repeat until the graph is empty.

> This is usually used before a **grundy function** (explained later),
> because once the vertices are sorted, then you grundy function result will be unique.