# Bellman–Ford algorithm

[Go back](..)

This algorithm is similar to Dijkstra's algorithm
but the weight can be either positive or negative
(complexity $O(n*m)$).

The algorithm will fails is there is a
negative-weight cycle because we can always make
another iteration and reduce the shortest path value.

You will have up to $|V|-1$ iterations but if you
have an iteration with no changes then the
algorithm is done.

The differences with Dijkstra are for $i+1$

* you start at a vertex
* you will replace the distance if the old one is bigger
* but you can also use the distances calculated in the current iteration

It can be summarized as
"at each iteration, you will try to find if
you can have a better predecessor for each vertex".

<hr class="sr">

## Example

We are starting from A

![](images/bellman.svg)

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Step</th>
            <th>A</th>
            <th>B</th>
            <th>C</th>
            <th>D</th>
            <th>E</th>
            <th>F</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>$0$</td>
            <td>$0$</td>
            <td>$+\infty$</td>
            <td>$+\infty$</td>
            <td>$+\infty$</td>
            <td>$+\infty$</td>
            <td>$+\infty$</td>
        </tr>
        <tr>
            <td>$1$</td>
            <td></td>
            <td>
                $A(6)$
            </td>
            <td>
                $A(4)$
            </td>
            <td>
                $A(5)$
            </td>
            <td>
                $+\infty$ <br>
                $B(5)$ <br>
                $\xcancel{C(7)}$
            </td>
            <td>
                $+\infty$ <br>
                $D(4)$ <br>
                $\xcancel{E(8)}$
            </td>
        </tr>
        <tr>
            <td>$2$</td>
            <td></td>
            <td>
                $C(2)$
            </td>
            <td>
                $D(3)$
            </td>
            <td></td>
            <td>
                $B(1)$
            </td>
            <td></td>
        </tr>
        <tr>
            <td>$3$</td>
            <td></td>
            <td>
                $C(1)$
            </td>
            <td></td>
            <td></td>
            <td>
                $B(0)$
            </td>
            <td>
                $E(3)$
            </td>
        </tr>
        <tr>
            <td>$4$</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </tbody>
</table>

The interpretation is the same as for
Dijkstra.