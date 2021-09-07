# Matrix: Reloaded

[Go back](../index.md#euler)

What if we've got an ODE with an order $n\in\mathbb N, n \geq 2$, like this?

<div>
	\[ \left\lbrace \begin{array}{l}
		y^{(n)} = f(t, y(t), y\prime (t), \dots, y^{(n-1)} (t)) \\
		y(a) = y_0 \\
		y\prime (a) = y_1 \\
		\vdots  \\
		y^{(n-1)} (a) = y_0
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
		F(t, Y) \\
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