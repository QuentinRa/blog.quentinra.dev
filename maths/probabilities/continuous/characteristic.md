# Characteristic function

[Go back](..)

In French, it's called `fonction caractéristique`. This name is used for [a lot of things](https://en.wikipedia.org/wiki/Characteristic_function).

<hr class="sr">

## Indicator Function

The characteristic function, called, in this case, most of the time, indicator function/`fonction indicatrice` of a set B is $\mathbb{1}_{ B }(x)$.

The function is evaluated as

* $1$ if $x \in B$
* $0$ else

It's used a lot of times because it's shortening the syntax like

<div>
\[
\begin{split}\begin{cases}
\mathbb{P}(X=k) = 0 & if & k > n  \\
\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k}  & else  \\
\end{cases}\end{split}
\]
</div>

Can be replaced by

<div>
\[
\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k} *  \mathbb{1}_{ [[0,n]] }(k)
\]
</div>

<hr class="sl">

## In probability theory

You can use that when the MGF (moment generating function) does not exist (that's the case for the Cauchy distribution, but we didn't use it in practice) or when you have $Y = aX$ or $Y = aX+b$.

The characteristic function is

@
\varphi_X(t)=\mathbb{E}[e^{itX}]
@

Sometimes the symbol $\phi$ (phi) or $\Phi$ (Phi) or even $\hat{\mu}$ are used instead of $\varphi$ (varphi) but I will trust Wikipedia on this.

* if $X$ and $Y$ are independent, $\varphi_{X+Y}(x) = \Phi_{X}(x) * \varphi_{Y}(x)$
* if $X$ and $Y$ are independent, $\log(\varphi_{x+y}(x)) = \log(\varphi_{x}(x)) * \log(\varphi_{y}(x))$
* $\varphi_X(0) = 1$
* $\varphi_X(-t) = \overline{\varphi_X(t)}$
* $e^{it} = \cos(t) + i\sin(t)$
* $\varphi_{aX}(t) = \varphi_{X}(a*t)$
* $\varphi_{aX+b}(t) = e^{itb} \varphi_{X}(a*t)$
* $\varphi$ is continuous

Then your function to generate a moment would be

<div>
\[
\mathbb{E}(|X^k|) = i^k * \varphi_X^k(0)
\hspace{1cm}
or
\hspace{1cm}
\varphi_X(-it) = M_X(t) 
\]
</div>