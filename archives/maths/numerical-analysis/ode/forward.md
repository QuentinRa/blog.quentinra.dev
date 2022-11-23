# Forward

[Go back](../index.md#euler)

One of the methods to approximate the solution of a Cauchy problem is the **forward Euler method** (`Euler explicite`).

We approximate the solution with the sequence defined by:

<div>
	\[ \left\lbrace \begin{array}{l}
		z_0 = y_0 \\
		z_{k+1} = z_k + (t_{k+1} - t_k) \times f(t_k, z_k)\quad \forall k < N
	\end{array} \right . \]
</div>

The expression of $z_{k+1}$ is based on Taylor's formula, using $y\prime = f(t, y)$ to approximate the first derivative value. Try to notice how similar they are!

The method is called forward because the expression of $z_{k+1}$ only depends on known values.

This method is the simplest, but has the default to easily have big errors.

<hr class="sl">

## Example

<div>
	\[ \left\lbrace \begin{array}{l}
		y\prime = y \\
		y(0) = 1
	\end{array} \right . \]
</div>

on $[0; 1]$ .

The solution is, of course, exponential, but let see how we could implement it:

```r
#Constant
N <- 100
a <- 0
b <- 1
y0 <- 1
	 
#How we pose the problem.
f <- function (t, y) { return (y) }
#We use a constant step.
h <- (b-a) / (N-1)
t <- seq(a, b, h) 
	 
#Initialization of the sequence.
z <- 1:N
z[1] <- y0
	
#Recurrence
for (k in 2:N)
{
	z[k] <- z[k-1] + h * f(t, z[k-1])
}
	
#Our magnificent approximation of exp([0; 1]) .
plot(t, z)
```