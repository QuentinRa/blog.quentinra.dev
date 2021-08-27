# Solving a matrix with Gauss

[Go back](../index.md#gaussian-elimination)

The goal is to get a matrix with a strictly increasing number of zeros before the coefficients, called leading coefficients/pivots (`pivots`).

If the leading coefficients are all $1$, and on each coefficient's column we got only $0$, then the matrix is in a form called the **reduced row echelon form** (`matrice échelonnée réduite`). Otherwise, it's called **row echelon form** (`matrice échelonnée`).

The operations you can use are

* Swapping two rows: $L_i \iff L_j$
* Adding a row: $L_i = L_i + L_j$
* Adding a row, multiplied by $c$: $L_i \leftarrow L_i + cL_j$
* Subtracting a row: $L_i \leftarrow L_i + -1 * L_j$
* Dividing a row by $c$: $L_i \leftarrow L_i + \frac{1}{c} * L_j$
* Multiply a row by $c$: $L_i \leftarrow c * L_i$

And to summarize, you can

* Swapping two rows: $L_i \iff L_j$
* Use this formula: $L_i \leftarrow a * L_i + b * L_j$

To summarize, what you will have to do is to use the operations above, and extract a pivot for each line, while making sure that this column does not have a pivot yet. Then, you may sort the lines if needed to make a strictly increasing sequence of non-leading zero.