# Simplex

[Go back](..)

This method is quite well-known so you may look
for some videos on the net since that might help
you understand.

<hr class="sr">

## Standard form

You need to rewrite your constraints, you can only
have equations (no inequalities).
If you don't have an equation, you will have to introduce
what we call **slack variables** (`variables artificielles/écart`
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
            <td class="mathjax_process">\(0\)</td>
        </tr>
    </tbody>
</table>

The last line is the coefficient of each variable
in the function **f**. And 0 is the result of the
optimization since we haven't started yet.