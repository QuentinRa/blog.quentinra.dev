# Binomial distribution

[Go back](..)

The binomial distribution $B(n,p)$ represents the probability of success on $n$ trials with a probability of $p$.

* The mass function is

<div>
\[
\begin{split}\begin{cases}
\mathbb{P}(X=k) = 0 & if & k > n  \\
\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k}  & else  \\
\end{cases}\end{split}
\]
</div>

* $\mathbb{E}(X) = \ n * p$
* $\mathbb{V}(X) = \ n * p * (1-p)$

> The probability of having $k$ successes on $n$ trials means that
> 
> * we got $k$ successes
> * we got $n-k$ failures (the remaining trials)
> 
> So we have the probability
> 
> * $p^k$ because we want $k$ successes with p the probability of success
> * $(1-p)^{(n-k)}$ because we want $n-k$ failures and $1-p$ if the probability of failure.
> * and since we don't care about the order, we need to multiply by the permutations $C_n^k$