# Backward

[Go back](../index.md#euler)

It's quite the same as the forward Euler method, with a little difference:

<div>
	\[ \left\lbrace \begin{array}{l}
		z_0 = y_0 \\
		z_{k+1} = z_k + (t_{k+1} - t_k) \times f(t_{k+1}, z_{k+1})\quad \forall k < N
	\end{array} \right . \]
</div>

It is called backward because the expression of $z_{k+1}$ depends on itself; the unknown value depends on itself, which made the calculations less easy. 