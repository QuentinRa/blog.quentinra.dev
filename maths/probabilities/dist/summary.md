# Summary

[Go back](..#cheatsheet)

<div class="d-print-table table-responsive">
<table class="table table-bordered table table-striped">
    <thead>
        <tr>
            <th style="min-width: 50px;">Name</th>
            <th style="min-width: 150px;">Desc</th>
            <th>PMF/PDF</th>
            <th>$\mathbb{E}$</th>
            <th>$\mathbb{V}$</th>
            <th>CDF</th>
            <th>MGF</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Bernoulli $B(p)$</td>
            <td>Distribution for binary variables.</td>
            <td>$\mathbb{P}(X=k) = p^k * (1-p)^{1-k}$</td>
            <td>$p$</td>
            <td>$p * (1-p)$</td>
            <td></td>
            <td>$(1-p)+p*e^t$</td>
        </tr>
        <tr>
            <td>Binomial $B(n, p)$</td>
            <td>A repetition of $n$ Bernoulli distributions.</td>
            <td>$\mathbb{P}(X=k) =  C_n^k * p^k * (1-p)^{n-k}$</td>
            <td>$n*p$</td>
            <td>$n * p * (1-p)$</td>
            <td></td>
            <td>$((1-p)+p*e^t)^n$</td>
        </tr>
        <tr>
            <td>Discrete uniform distribution $U([a,b])$</td>
            <td>All outcome have the same probability.</td>
            <td>$\mathbb{P}(X=k) = \frac{1}{b-a+1}$</td>
            <td>$\frac{a+b}{2}$</td>
            <td>$\frac{(b-a)(b-a+2)}{12}$</td>
            <td></td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Discrete uniform distribution $U([1,n])$</td>
            <td>All outcome have the same probability.</td>
            <td>$\mathbb{P}(X=k) = \frac{1}{n}$</td>
            <td>$\frac{n+1}{2}$</td>
            <td>$\frac{n^2 - 1}{12}$</td>
            <td></td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Geometric $G(p)$</td>
            <td>
                The probability of $k$ being a success after
                $k-1$ failures with a probability $p$.
            </td>
            <td>$\mathbb{P}(X=k) = (1-p)^{k-1} * p$</td>
            <td>$\frac{1}{p}$</td>
            <td>$\frac{1-p}{p^2}$</td>
            <td></td>
            <td>$\frac{p * e^t}{1-(1-p) * e^t}$</td>
        </tr>
        <tr>
            <td>Hypergeometric $H(N, k, n)$</td>
            <td>
                Distribution without replace of
                $n$ trials with $K$ out of $N$ elements.
            </td>
            <td>$\mathbb{P}(X=k) = {{{K \choose k}{{N-K} \choose {n-k}}} \over {N \choose n}}$</td>
            <td>$\frac{K}{N}$</td>
            <td>$\mathbb{E}(X) * (1 - \frac{K}{N}) * \frac{N-n}{N-1}$</td>
            <td></td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Poisson $\mathbb{P}(\lambda)$</td>
            <td>
                A big $n$ and a small probability $p$ giving us
                $\lambda = n*p$.
            </td>
            <td>$\mathbb{P}(X=k) = \frac{\lambda^k *  e^{-\lambda}}{k!}$</td>
            <td>$\lambda$</td>
            <td>$\lambda$</td>
            <td></td>
            <td>$e^{\lambda * (e^{t}-1)}$</td>
        </tr>
    </tbody>
</table>
</div>