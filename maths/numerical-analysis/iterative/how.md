# How we will do

I'm not particularly fan of calculations so we will do
our iterative methods using an algorithm approach.
Still even trough you will understand how to work, if someone
wants to explain it with maths formula, just do it with
edit button.

We will be starting from a system that will be given
to us. 

<p>
\[
\begin{cases}
5x - 2y + 3z& = -1\\
-3x + 9y + z& = 2\\
2x - y - 7z& = 3\\
\end{cases} 
\]
</p>

Once you do have this, your first job will
be to write each [ variable = an expression ]
like this

* <span>
    \(
        x_{n+1}(x, y, z) = \frac{-1 + 2 * y - 3 * z}{5}
    \)</span>
* <span>
    \(
        y_{n+1}(x, y, z) = \frac{2 + 3 * x - z}{9}
    \)</span>
* <span>
    \(
        z_{n+1}(x,y,z) = \frac{3 - 2 * x + y}{-7}
    \)</span>
  
Just in case you didn't understand, for the first variable
x, I used the first line and put ``x = the rest``. Then
same for second variable and second line, ...

**Each algorithm will be explained starting from this**. The
idea will be almost the same, but in the end you are
gonna do some iterations using a table.