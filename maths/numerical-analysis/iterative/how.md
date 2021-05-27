# How we will do

I'm not particularly fan of calculations so we will do
our iterative methods using an algorithm approach.
Still even trough you will understand how to work, if someone
wants to explain it with maths formula, just do it with
edit button.

We will be starting from a system that will be given
to us. We are starting here with a matrix but that's
the same as you should know.

<p>
\[
A = \begin{pmatrix}
1 & 2 & 2 & 1 \\
1 & 2 & 1 & 0 \\
0 & 1 & 2 & 2 \\
1 & 2 & 1 & 2 \\
\end{pmatrix}
\]
</p>

and

<p>
\[
b = \begin{pmatrix}
1 \\
1 \\
1 \\
1 \\
\end{pmatrix}
\]
</p>

that is from this system

<p>
\[
\begin{cases}
x + 2y + 2z + t & = 1\\
x + 2y + z + 0 & = 1\\
0 + y + 2z + 2t & = 1 \\
x + 2y + z + 2t & = 1 \\
\end{cases} 
\]
</p>

Once you do have this, your first job will
be to write each [ variable = an expression ]
like this

* <span>
    \(
        x = 1 - 2y - 2z - t
    \)</span>
* <span>
    \(
        y = \frac{1 - x - z}{2} 
    \)</span>
* <span>
    \(
        z = \frac{1 - y - 2t}{2}
    \)</span>
* <span>
    \(
        t = \frac{1 - x - 2y - z}{2}
    \)</span>
  
Just in case you didn't understand, for the first variable
x, I used the first line and put ``x = the rest``. Then
same for second variable and second line, ...

**Each algorithm will be explained starting from this**. The
idea will be almost the same, but in the end you are
gonna do some iterations using a table.