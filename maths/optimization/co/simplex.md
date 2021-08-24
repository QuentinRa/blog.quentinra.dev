# Simplex

[Go back](..)

This method is quite well-known so you may look for some videos on the net since that might help you understand. We are making a table, and updating it until we have our solution.

<hr class="sr">

## Standard form

You need to rewrite your constraints, you can only
have equations (no inequalities).
If you don't have an equation, you will have to introduce
what we call **slack variables** 
(`variables artificielles/d'écart/de bruit`
in French)

* ``>`` (or equals): `-` slack variables
* ``<`` (or equals): `+` slack variables

<div class="mb-3">
For instance <span class="mathjax_process">\(x < 5\)</span>
becomes 
<span class="mathjax_process">\(x + S_1 = 5\)</span> with
<span class="mathjax_process">\(S_1\)</span> a 
slack variable.
</div>

**Note**: if you added a negative slack variable,
because of ``>``, then you must use the `2-phases`
algorithm.

<hr class="sl">

## Preparing your table

Create a matrix ``Ax = b``, with b the results of 
your equations and A the coefficients before
your variables in each equation.

<table class="table table-striped">
    <thead>
        <tr>
            <th>base</th>
            <th>X</th>
            <th>Y</th>
            <th class="mathjax_process">\(...\)</th>
            <th class="mathjax_process">\(S_1\)</th>
            <th class="mathjax_process">\(...\)</th>
            <th class="mathjax_process">\(S_n\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(S_1\)</td>
            <td class="mathjax_process">\(a_{11}\)</td>
            <td class="mathjax_process">\(a_{12}\)</td>
            <td class="mathjax_process">\(...\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(b_1\)</td>
        </tr>
        <tr>
            <td>...</td>
            <td>...</td>
            <td>...</td>
            <td>...</td>
            <td>...</td>
            <td>...</td>
            <td>...</td>
            <td>...</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(S_n\)</td>
            <td class="mathjax_process">\(a_{n1}\)</td>
            <td class="mathjax_process">\(a_{n2}\)</td>
            <td class="mathjax_process">\(...\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(b_n\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(c_{1}\)</td>
            <td class="mathjax_process">\(c_{2}\)</td>
            <td class="mathjax_process">\(...\)</td>
            <td></td>
            <td></td>
            <td></td>
            <td class="mathjax_process">\(R=0\)</td>
        </tr>
    </tbody>
</table>

The last line is the coefficient of each variable
in the function **f**. And 0 is the result of the
optimization since we haven't started yet.

<hr class="sr">

## Minimization

If you are asked to minimize then

<ul>
<li> take the column with the smallest <code>c</code></li>
<li> if this column only have negatives values
    then <code>end</code></li>
<li class="mathjax_process"> we want the row having the lowest ratio
    \(S_i = b_i / a_{ij}\) so evaluate all the ratios
    for your column
    and find the row.</li>
</ul>

Now that you got your column and row, you will have to
put ``1`` inside and 0 in all the others values of the
diagonal. Since that's a matrix, simply use GAUSS.

<div> Once you did, if set a <code>1</code> in
<span class="mathjax_process">\(a_{11}\)</span>
then replace
<span class="mathjax_process">\(S_{1}\)</span>
(i=1)
in the <code>base</code> column
by the variable in the first (j=1) column so X.
</div>

**Stop**? When all the values in the last
line (reduced costs) are **positives**. The result
is ``-R``.

<hr class="sl">

## Maximization

Same a minimization but take the
take the column with the biggest ``c``.

**Stop**? When all the values in the last
line (reduced costs) are **negatives**. The result
is ``-R``.

<hr class="sl">

## 2-phases

You will have to do 2 simplexes. You need to add
slack variables (that I'm calling ``A`` this time)
on each equation with a negative value. In your
simplex table, the ``A`` variables are in the base
and you need to remove them.

Once you did remove them, then you can start using
the table you got as the starting table.

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
We rewrite our constraints so we have using the 
<b>standard form</b>
<div class="mathjax_process">\[
\begin{cases}
x + y + e_1 = 1\\
x + 4y + e_2 = 2\\
x \ge 0\\
y \ge 0\\
\end{cases} 
\]
</div>
<p>So your table is</p>
<table class="table table-striped table-bordered border-dark">
    <thead>
        <tr>
            <th>base</th>
            <th>x</th>
            <th>y</th>
            <th class="mathjax_process">\(e_1\)</th>
            <th class="mathjax_process">\(e_2\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(e_1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(e_2\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(4\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(2\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(2\)</td>
            <td class="mathjax_process">\(3\)</td>
            <td></td>
            <td></td>
            <td class="mathjax_process">\(R=0\)</td>
        </tr>
    </tbody>
</table>
And we are starting,

<ul>
<li>The highest coefficient is 3, second column</li>
<li>The highest row is min(1/1, 2/4)=2/4= second line</li>
<li>we are clearing the second column</li>
<li>and we will replace e2 in the base by y</li>
</ul>
<table class="table table-striped table-bordered border-dark">
    <thead>
        <tr>
            <th>base</th>
            <th>x</th>
            <th>y</th>
            <th class="mathjax_process">\(e_1\)</th>
            <th class="mathjax_process">\(e_2\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(e_1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(e_2\)</td>
            <td class="mathjax_process">\(1/4\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1/4\)</td>
            <td class="mathjax_process">\(2/4\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(2\)</td>
            <td class="mathjax_process">\(3\)</td>
            <td></td>
            <td></td>
            <td class="mathjax_process">\(R=0\)</td>
        </tr>
    </tbody>
</table>
<table class="table table-striped table-bordered border-dark">
    <thead>
        <tr>
            <th>base</th>
            <th>x</th>
            <th>y</th>
            <th class="mathjax_process">\(e_1\)</th>
            <th class="mathjax_process">\(e_2\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(e_1\)</td>
            <td class="mathjax_process">\(3/4\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(-1/4\)</td>
            <td class="mathjax_process">\(2/4\)</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(y\)</td>
            <td class="mathjax_process">\(1/4\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1/4\)</td>
            <td class="mathjax_process">\(2/4\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(5/4\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(-3/4\)</td>
            <td class="mathjax_process">\(R=-6/4\)</td>
        </tr>
    </tbody>
</table>
Then again
<ul>
<li>The highest coefficient is 5/4, first column</li>
<li>The highest row is min((2/4)/(3/4), (2/4)/(1/4))=first line</li>
<li>we are clearing the first column</li>
<li>and we will replace e1 in the base by x</li>
</ul>
<table class="table table-striped table-bordered border-dark">
    <thead>
        <tr>
            <th>base</th>
            <th>x</th>
            <th>y</th>
            <th class="mathjax_process">\(e_1\)</th>
            <th class="mathjax_process">\(e_2\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(e_1\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(4/3\)</td>
            <td class="mathjax_process">\(-1/3\)</td>
            <td class="mathjax_process">\(2/3\)</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(y\)</td>
            <td class="mathjax_process">\(1/4\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1/4\)</td>
            <td class="mathjax_process">\(2/4\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(5/4\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(-3/4\)</td>
            <td class="mathjax_process">\(R=-6/4\)</td>
        </tr>
    </tbody>
</table>
<table class="table table-striped table-bordered border-dark">
    <thead>
        <tr>
            <th>base</th>
            <th>x</th>
            <th>y</th>
            <th class="mathjax_process">\(e_1\)</th>
            <th class="mathjax_process">\(e_2\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(x\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(4/3\)</td>
            <td class="mathjax_process">\(-1/3\)</td>
            <td class="mathjax_process">\(2/3\)</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(y\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(-4/12\)</td>
            <td class="mathjax_process">\(4/12\)</td>
            <td class="mathjax_process">\(4/12\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(-20/12\)</td>
            <td class="mathjax_process">\(-4/12\)</td>
            <td class="mathjax_process">\(R=-28/12\)</td>
        </tr>
    </tbody>
</table>
<p>And with a bit of cleaning</p>
<table class="table table-striped table-bordered border-dark">
    <thead>
        <tr>
            <th>base</th>
            <th>x</th>
            <th>y</th>
            <th class="mathjax_process">\(e_1\)</th>
            <th class="mathjax_process">\(e_2\)</th>
            <th>b</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="mathjax_process">\(x\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(4/3\)</td>
            <td class="mathjax_process">\(-1/3\)</td>
            <td class="mathjax_process">\(2/3\)</td>
        </tr>
        <tr>
            <td class="mathjax_process">\(y\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(1\)</td>
            <td class="mathjax_process">\(-1/3\)</td>
            <td class="mathjax_process">\(1/3\)</td>
            <td class="mathjax_process">\(1/3\)</td>
        </tr>
        <tr>
            <td class="mathjax_process"></td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(0\)</td>
            <td class="mathjax_process">\(-5/3\)</td>
            <td class="mathjax_process">\(-1/3\)</td>
            <td class="mathjax_process">\(R=-7/3\)</td>
        </tr>
    </tbody>
</table>
<div>
All of our <b>slack variables</b> are positives so
we are good. The solution is
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
</div>
</blockquote>