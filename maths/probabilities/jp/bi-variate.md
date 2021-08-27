# Bi-variate Distribution tip

[Go back](..#joint-probability)

This page may be useful if $Card(X)$ and $Card(Y)$ are small, since you would be able to use the contingency table/`tableau à double entrées/tableau de contingence`.

It's a table with the columns being the values in $Y(\Omega)$ and the lines, the values in $X(\Omega)$.

The values inside the table are the probabilities of the values in the row being taken by $X$ **and** the value in the column to be taken by $Y$.

<hr class="sr">

## Example

We are throwing 2 dices, X = "the minimum is $x_i$" and Y = "the maximum is $y_j$". We can make this a table like this

| X\Y |   1   |   2   |   3   |   4   |   5   |   6   |
|-----|-------|-------|-------|-------|-------|-------|
|  1  |  1/36 |  2/36 |  2/36 |  2/36 |  2/36 |  2/36 |
|  2  |   0   |  1/36 |  2/36 |  2/36 |  2/36 |  2/36 |
|  3  |   0   |   0   |  1/36 |  2/36 |  2/36 |  2/36 |
|  4  |   0   |   0   |   0   |  1/36 |  2/36 |  2/36 |
|  5  |   0   |   0   |   0   |   0   |  1/36 |  2/36 |
|  6  |   0   |   0   |   0   |   0   |   0   |  1/36 |

First, you should remember that when throwing 2 dices, you got $|\Omega|=36$ results like

* (1,1)
* (1,2)
* (2,1)
* (2,2)
* ...

Then for $X=1,\ Y=2$, you are looking for the probability of

* A="the minimum is 1 and the maximum is 2"
* $|A|=2$ because we have (1,2) and (2,1)
* so we have $2/36$

For $X=2,\ Y=1$, you are looking for the probability of

* A="the minimum is 2 and the maximum is 1"
* this is impossible so 

For $X=1,\ Y=1$, you are looking for the probability of

* A="the minimum is 1 and the maximum is 1"
* $|A|=1$ because we have (1,1)
* so we have $1/36$

Finally, you should check and confirm that the sum of all probabilities is **1**.