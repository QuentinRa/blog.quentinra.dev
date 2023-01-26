# Depth-first search

[Go back](..#sorting-and-search)

In French it's called `Parcours en profondeur`. To summarize, you will traverse a path until you can't go further, then come back to a previous branching and do it again until you traversed every branch.

**Algorithm**

* randomly pick a starting vertex
* make it as traversed
* then
    * randomly pick of a neighbor not traversed and not "done"
    * if you can
        * then mark the vertex as traversed
        * repeat
    * else
        * then mark this vertex as "done"
        * go back to the previously traversed vertex
        * if there is no traversed vertex remaining, then you are done

Complexity: $O(|V|+|E|)$.

<hr class="sr">

## Example

Use the Depth-first search on this graph.

![Depth-first search](images/dfs.svg)

We are starting at **h** because that's my choice. I will use the syntax $\text{a, b, c} \to \text{a}$ to say that among the available neighbor vertex, I picked $a$. 

* a vertex is available if it's not inside "done"
* when picking a vertex, it's random among the vertices that are not in Marked

I used a table to make things easier to look at.

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Current</th>
            <th>Next?</th>
            <th>Marked</th>
            <th>Done</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>$\text{h}$</td>
            <td>$\text{i} \to \text{i}$</td>
            <td>$\text{\{h\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{i}$</td>
            <td>$\text{h, j, g} \to \text{j}$</td>
            <td>$\text{\{h, i\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{j}$</td>
            <td>$\text{i, e} \to \text{e}$</td>
            <td>$\text{\{h, i, j\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{e}$</td>
            <td>$\text{j, b, a} \to \text{b}$</td>
            <td>$\text{\{h, i, j, e\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{b}$</td>
            <td>$\text{e, a, d, k} \to \text{a}$</td>
            <td>$\text{\{h, i, j, e, b\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{a}$</td>
            <td>$\text{e, b, f} \to \text{f}$</td>
            <td>$\text{\{h, i, j, e, b, a\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{f}$</td>
            <td>$\text{a, g} \to \text{g}$</td>
            <td>$\text{\{h, i, j, e, b, a, f\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{g}$</td>
            <td>$\text{i, f, d} \to \text{d}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{d}$</td>
            <td>$\text{b, g, c, k} \to \text{c}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td>$\text{c}$</td>
            <td>$\text{d} \to \text{???}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c\}}$</td>
            <td>$\text{\{\}}$</td>
        </tr>
        <tr>
            <td colspan="4">
                Notice that $\text{d}$, the only neighbor
                of $c$, is inside
                "Marked", meaning that $c$ is a <b>dead end</b>.
                We mark $c$ as "done" and go back to $d$.
            </td>
        </tr>
        <tr>
            <td>$\text{c}$</td>
            <td>$\text{d} \to \text{d}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c\}}$</td>
            <td>$\text{\{c\}}$</td>
        </tr>
        <tr>
            <td>$\text{d}$</td>
            <td>$\text{b, g, k} \to \text{k}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d\}}$</td>
            <td>$\text{\{c\}}$</td>
        </tr>
        <tr>
            <td>$\text{k}$</td>
            <td>$\text{b, d} \to^{done} \text{d}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k\}}$</td>
            <td>$\text{\{c, k\}}$</td>
        </tr>
        <tr>
            <td>$\text{d}$</td>
            <td>$\text{b, g, k} \to^{done} \text{g}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d\}}$</td>
            <td>$\text{\{c, k, d\}}$</td>
        </tr>
        <tr>
            <td>$\text{g}$</td>
            <td>$\text{i, f} \to^{done} \text{f}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g\}}$</td>
            <td>$\text{\{c, k, d, g\}}$</td>
        </tr>
        <tr>
            <td>$\text{f}$</td>
            <td>$\text{a} \to^{done} \text{a}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f\}}$</td>
            <td>$\text{\{c, k, d, g, f\}}$</td>
        </tr>
        <tr>
            <td>$\text{a}$</td>
            <td>$\text{e, b} \to^{done} \text{b}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f, a\}}$</td>
            <td>$\text{\{c, k, d, g, f, a\}}$</td>
        </tr>
        <tr>
            <td>$\text{a}$</td>
            <td>$\text{e} \to^{done} \text{e}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f, a, b\}}$</td>
            <td>$\text{\{c, k, d, g, f, a, b\}}$</td>
        </tr>
        <tr>
            <td>$\text{e}$</td>
            <td>$\text{j} \to^{done} \text{j}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f, a, b, e\}}$</td>
            <td>$\text{\{c, k, d, g, f, a, b, e\}}$</td>
        </tr>
        <tr>
            <td>$\text{j}$</td>
            <td>$\text{i} \to^{done} \text{i}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f, a, b, e, i\}}$</td>
            <td>$\text{\{c, k, d, g, f, a, b, e, i\}}$</td>
        </tr>
        <tr>
            <td>$\text{i}$</td>
            <td>$\text{h} \to^{done} \text{h}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f, a, b, e, i\}}$</td>
            <td>$\text{\{c, k, d, g, f, a, b, e, i\}}$</td>
        </tr>
        <tr>
            <td>$\text{h}$</td>
            <td>$\text{done}$</td>
            <td>$\text{\{h, i, j, e, b, a, f, g, d, c, d, k, d, g, f, a, b, e, i, h\}}$</td>
            <td>$\text{\{c, k, d, g, f, a, b, e, i, h\}}$</td>
        </tr>
    </tbody>
</table>

"Marked" is the algorithm result, as you can see exactly what path we took. But if you want all the vertex we found, then that's the value of "done".