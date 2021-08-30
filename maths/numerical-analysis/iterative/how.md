# How we will do

[Go back](../index.md)

First, I had a hard time with the formulas, so I'm going to introduce everything with a table first, then the code in R (which looks bad), then I will introduce the formulas, and finally the code in R using the formulas (which is better).

We will be starting from a system that will be given to us. 

<p>
\[
\begin{cases}
4x + 2y + 2z = 12 \\
2x + 10y + 7z = -9 \\
2x + 7y + 21z = -20 \\
\end{cases} 
\]
</p>

Once you do have this, your first job will be to write each line like this

* $x^{(k+1)} = \frac{12 - 2 * y - 2 * z}{4}$
* $y^{(k+1)} = \frac{-9 - 2 * x - 7 * z}{10}$
* $z^{(k+1)} = \frac{-20 - 2 * x - 7 * y}{21}$

For the first variable, I used the first line and put ``x = the rest``. The same for the second variable and second line, etc.

**Each algorithm will be explained starting from this**. The idea will be almost the same, but in the end, you are going to do some iterations using a table (or the formula), and get your $X^{(k)}$.