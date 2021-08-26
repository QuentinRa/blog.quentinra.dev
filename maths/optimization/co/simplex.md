# Simplex

[Go back](..)

This method is quite well-known so you may look for some videos on the net since that might help you understand. We are making a table, and updating it until we have our solution.

<hr class="sr">

## Standard form

You need to rewrite your constraints, you can only have equations (no inequalities). If you don't have an equation, you will have to introduce what we call **slack variables** (`variables artificielles/d'écart/de bruit` in French)

* `>` (or equals): `-` slack variables
* `<` (or equals): `+` slack variables

For instance $x < 5$ becomes $x + S_1 = 5$ with $S_1$ a slack variable.

**Note**: if you added a negative slack variable, because of `>`, then you must use the `2-phases` algorithm.

<hr class="sl">

## Preparing your table

Create a matrix `Ax = b`, with b the results of your equations and A the coefficients before your variables in each equation.

| base|  X  |  Y  | ... |  $S_1$ | ... | $S_n$ |  b  |
|-----|-----|-----|-------|--------|-------|-------|-----|
|$S_1$|$a_{11}$|$a_{12}$|...|  1 |   0   |   0   |$b_1$|
| ... | ... | ... |  ...  |   ...  |  ...  |  ...  | ... |
|$S_n$|$a_{n1}$|$a_{n2}$|...|  0 |   0   |   1   |$b_n$|
|     |$c_{1}$|$c_{2}$|...|  ...   |  ...  |  ...  |$R=0$|

The last line is the coefficient of each variable in the function **f**. And 0 is the result of the optimization since we haven't started yet.

<hr class="sr">

## Minimization

If you are asked to minimize then

* take the column with the smallest `c`
* if this column only have negatives values then `end`
* we want the row having the lowest ratio $S_i = b_i / a_{ij}$ so evaluate all the ratios for your column and find the row.

Now that you got your column and row, you will have to put `1` inside and 0 in all the others values of the diagonal. Since that's a matrix, simply use GAUSS.

Once you did, if set a `1` in $a_{11}$ then replace $S_{1}$ (i=1) in the `base` column by the variable in the first (j=1) column so X.

**Stop**? When all the values in the last line (reduced costs) are **positives**. The result is `-R`.

<hr class="sl">

## Maximization

Same a minimization, but take the column with the biggest `c`.

**Stop**? When all the values in the last line (reduced costs) are **negatives**. The result is `-R`.

<hr class="sl">

## 2-phases

You will have to do 2 simplexes. You need to add slack variables (that I'm calling `A` this time) on each equation with a negative value. In your simplex table, the `A` variables are in the base and you need to remove them.

Once you did remove them, then you can start using the table you got as the starting table.

<hr class="sr">

## Exercise

Use the simplex method to solve

<p class="mathjax_process">\[
\max z = 2x + 3y\ \ s.c. \begin{cases}
x + y \le 1\\
x + 4y \le 2\\
x \ge 0\\
y \ge 0\\
\end{cases} 
\]
</p>

<blockquote class="spoiler">

We rewrite our constraints, so we have the following **standard form**

<div>
\[
\begin{cases}
x + y + e_1 = 1\\
x + 4y + e_2 = 2\\
x \ge 0\\
y \ge 0\\
\end{cases} 
\]
</div>

So your table is

|  base |   x   |   y   | $e_1$ | $e_2$ |   b   |
|-------|-------|-------|-------|-------|-------|
| $e_1$ |   1   |   1   |   1   |   0   |   1   |
| $e_2$ |   1   |   4   |   0   |   1   |   2   |
|       |   2   |   3   |       |       | $R=0$ |

And we are starting,

* The highest coefficient is 3 (second column)
* The highest row is $min(1/1, 2/4)=2/4$ (second line)
* we are clearing the second column
* and we will replace e2 in the base by y

|  base |   x   |   y   | $e_1$ | $e_2$ |   b   |
|-------|-------|-------|-------|-------|-------|
| $e_1$ |   1   |   1   |   1   |   0   |   1   |
| $e_2$ |  1/4  |   1   |   0   |  1/4  |  2/4  |
|       |   2   |   3   |       |       | $R=0$ |

|  base |   x   |   y   | $e_1$ | $e_2$ |   b   |
|-------|-------|-------|-------|-------|-------|
| $e_1$ |  3/4  |   0   |   1   | -1/4  |  2/4  |
|   y   |  1/4  |   1   |   0   |  1/4  |  2/4  |
|       |  5/4  |   0   |   0   | -3/4  |$R=-6/4$|

Then again

* The highest coefficient is 5/4 (first column)
* The highest row is $min((2/4)/(3/4), (2/4)/(1/4))=(2/4)/(3/4)$ (first line)
* we are clearing the first column
* and we will replace e1 in the base by x

|  base |   x   |   y   | $e_1$ | $e_2$ |   b   |
|-------|-------|-------|-------|-------|-------|
| $e_1$ |   1   |   0   |  4/3  | -1/3  |  2/3  |
|   y   |  1/4  |   1   |   0   |  1/4  |  2/4  |
|       |  5/4  |   0   |   0   | -3/4  |$R=-6/4$|

|  base |   x   |   y   | $e_1$ | $e_2$ |   b   |
|-------|-------|-------|-------|-------|-------|
|   x   |   1   |   0   |  4/3  | -1/3  |  2/3  |
|   y   |   0   |   1   | -4/12 |  4/12 | 4/12  |
|       |   0   |   0   |-20/12 | -4/12 |$R=-28/12$|

And with a bit of cleaning

|  base |   x   |   y   | $e_1$ | $e_2$ |   b   |
|-------|-------|-------|-------|-------|-------|
|   x   |   1   |   0   |  4/3  | -1/3  |  2/3  |
|   y   |   0   |   1   |  -1/3 |  1/3  |  1/3  |
|       |   0   |   0   |  -5/3 | -1/3  |$R=-7/3$|

All of our **slack variables** are negatives so we are good. The solution is

<span>
\[
\begin{cases}
x = 2/3\\
y = 1/3\\
e_1 = 0\\
e_2 = 0\\
z = 7/3\\
\end{cases}
\]
</span>
</blockquote>