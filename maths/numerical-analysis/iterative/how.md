# How we will do

[Go back](../index.md)

First, I had a hard time with the formula, so I'm going to explain everything with an example. If you know a may of explaining things smoothly, then you can edit the page.

We will be starting from a system that will be given
to us. 

<p>
\[
\begin{cases}
4x + 2y + 2z = 12 \\
2x + 10y + 7z = -9 \\
2x + 7y + 21z = -20 \\
\end{cases} 
\]
</p>

Once you do have this, your first job will
be to write each [ variable = an expression ]
like this

* $x_{n+1}(x, y, z) = \frac{12 - 2 * y - 2 * z}{4}$
* $y_{n+1}(x, y, z) = \frac{-9 - 2 * x - 7 * z}{10}$
* $z_{n+1}(x,y,z) = \frac{-20 - 2 * x - 7 * y}{21}$
  
For the first variable, I used the first line and put ``x = the rest``. Then same for second variable and second line, etc.

**Each algorithm will be explained starting from this**. The
idea will be almost the same, but in the end you are
gonna do some iterations using a table (instead of formula, as I told you above).