# Characteristic function

[Go back](..)

In French, it's called either
``fonction caractéristique`` or ``fonction indicatrice``
and the characteristic function.

This name is used for a lot
of [things](https://en.wikipedia.org/wiki/Characteristic_function).

<hr class="sr">

## Indicator Function

The characteristic function,
called, in this case, most of the time,
indicator function/`fonction indicatrice`
of a set B is $\mathbb{1}_{ B }(x)$.

The function is evaluated as

* $1$ if $x \in B$
* $0$ else

It's used a lot of times because it's shortening
the syntax like

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

...