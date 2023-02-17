# Matrix: Reloaded

[Go back](../index.md#euler)

What if we've got an ODE with an order $n\in\mathbb N, n \geq 2$, like this?

<div>
	\[ \left\lbrace \begin{array}{l}
		y^{(n)} = f(t, y(t), y\prime (t), \dots, y^{(n-1)} (t)) \\
		y(a) = y_0 \\
		y\prime (a) = y_1 \\
		\vdots  \\
		y^{(n-1)} (a) = y_{n-1}
	\end{array} \right .\]
</div>

We set
<div>
	\[ Y = \left ( \begin{array}{c}
		y^{(n - 1)} \\
		y^{(n - 2)} \\
		\vdots  \\
		y\prime \\
		y
	\end{array} \right ) \]
</div>

so we have
<div>
	\[ Y' = \left ( \begin{array}{c}
		y^{(n)} \\
		y^{(n - 1)} \\
		\vdots  \\
		y\prime\prime \\
		y\prime
	\end{array} \right )
	= \left ( \begin{array}{c}
		f(t, Y) \\
		y^{(n - 1)} \\
		\vdots  \\
		y\prime\prime \\
		y\prime
	\end{array} \right )
	\quad and \quad
	Y_0 =  \left ( \begin{array}{c}
		y_{n-1} \\
		y_{n-2} \\
		\vdots  \\
		y_1 \\
		y_0
	\end{array} \right )
	\]
</div>

Thus, we could use the methods we learned earlier, using matrices.

For example, the forward Euler method become :
<div>
	\[
	\left \lbrace
	\begin{array}{l}
		Z_0 = Y_0 \\
		Z_{k+1} = Z_k + ( t_{k+1} - t_k ) \times f_c (t_k, Z_k)
	\end{array} \right .
	\]
</div>

with
<div>
	\[
	f_c : \left \lbrace
	\begin{array}{ccc} 
		\mathbb R \times \mathbb K^n &\rightarrow & \mathbb K^n  \\
		(t, X)  = (t, (x_n, x_{n-1}, \dots, x_1) ) & \mapsto &  (f(t, X), x_n, \dots, x_2) 
	\end{array} \right .
	\]
</div>

The approximation of the ODE are the values given by the last line of the $Z_k$.

## Example

<div>
	\[
	\left \lbrace
	\begin{array}{l}
		y\prime\prime + y = 0 \\
		y(0) = 1 \\
		y\prime (0) = 1 \\
	\end{array} \right .
	\]
</div>

on $[0, 4\pi]$.

We could find that $y\prime\prime = f( t, (y\prime, y) ) = - y$ .

```r
a <- 0
b <- 4 * 3.1415
N <- 1000
h <- (b-a) / (N-1)
t <- seq(a, b, h)

#How we pose the problem.
f <- function (t, y) { return (- y[2]) }
fc <- function (t, y) { return ( c(f(t,y), y[1]) ) }
y0 <- c(1, 1)
#Initialize the sequence.
#I choose de represent each z_k by a column.
z <- matrix(nrow=2, ncol=N)
z[,1] <- y0

#Calculate recursively the sequence.
for (k in 2:N)
{
  z[,k] <- z[,(k-1)] + h * fc( t[k-1], z[,(k-1)] )
}

plot(t, z[2,])
#plot(t, cos(t) + sin(t))
```

Note : The solution of the example is $\cos + \sin$.