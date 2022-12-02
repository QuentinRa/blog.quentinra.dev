# Summary

[Go back](../index.md#cheatsheet)

A summary of the discrete distributions

<div class="d-print-table table-responsive">
<table class="table table-striped">
    <thead>
        <tr>
            <th style="min-width: 50px;">Name</th>
            <th style="min-width: 150px;">Desc</th>
            <th>PMF $\mathbb{P}(X=k)$</th>
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
            <td>$p^k * (1-p)^{1-k}$</td>
            <td>$p$</td>
            <td>$p * (1-p)$</td>
            <td>$1-p$</td>
            <td>$(1-p)+p*e^t$</td>
        </tr>
        <tr>
            <td>Binomial $B(n, p)$</td>
            <td>A repetition of $n$ Bernoulli distributions.</td>
            <td>$ C_n^k * p^k * (1-p)^{n-k}$</td>
            <td>$n*p$</td>
            <td>$n * p * (1-p)$</td>
            <td>messy</td>
            <td>$((1-p)+p*e^t)^n$</td>
        </tr>
        <tr>
            <td>Discrete uniform distribution $U([a,b])$</td>
            <td>Every outcome has the same probability.</td>
            <td>$\frac{1}{b-a+1}$</td>
            <td>$\frac{a+b}{2}$</td>
            <td>$\frac{(b-a)(b-a+2)}{12}$</td>
            <td>$\frac{\lfloor k\rfloor-a+1}{b-a+1}$</td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Discrete uniform distribution $U([1,n])$</td>
            <td>Every outcome has the same probability.</td>
            <td>$\frac{1}{n}$</td>
            <td>$\frac{n+1}{2}$</td>
            <td>$\frac{n^2 - 1}{12}$</td>
            <td>$\frac{\lfloor k\rfloor}{n}$</td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Geometric $G(p)$</td>
            <td>
                The probability of $k$ being a success after
                $k-1$ failures with a probability $p$.
            </td>
            <td>$(1-p)^{k-1} * p$</td>
            <td>$\frac{1}{p}$</td>
            <td>$\frac{1-p}{p^2}$</td>
            <td>$1-(1-p)^k$</td>
            <td>$\frac{p * e^t}{1-(1-p) * e^t}$</td>
        </tr>
        <tr>
            <td>Hypergeometric $H(N, k, n)$</td>
            <td>
                Distribution without replace of
                $n$ trials with $K$ out of $N$ elements.
            </td>
            <td>${{{K \choose k}{{N-K} \choose {n-k}}} \over {N \choose n}}$</td>
            <td>$\frac{K}{N}$</td>
            <td>$\mathbb{E}(X) * (1 - \frac{K}{N}) * \frac{N-n}{N-1}$</td>
            <td>messy</td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Poisson $\mathbb{P}(\lambda)$</td>
            <td>
                A big $n$ and a small probability $p$ giving us
                $\lambda = n*p$.
            </td>
            <td>$\frac{\lambda^k *  e^{-\lambda}}{k!}$</td>
            <td>$\lambda$</td>
            <td>$\lambda$</td>
            <td>messy</td>
            <td>$e^{\lambda * (e^{t}-1)}$</td>
        </tr>
    </tbody>
</table>
</div>

and the continuous distributions

<div class="d-print-table table-responsive">
<table class="table table-striped">
    <thead>
        <tr>
            <th style="min-width: 50px;">Name</th>
            <th style="min-width: 150px;">Desc</th>
            <th>PDF</th>
            <th>$\mathbb{E}$</th>
            <th>$\mathbb{V}$</th>
            <th>CDF</th>
            <th>MGF</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Continuous uniform distribution $U([a,b])$</td>
            <td>Every outcome has the same probability.</td>
            <td>$f_X(x) = \frac{1}{b-a}$</td>
            <td>$\frac{a+b}{2}$</td>
            <td>$\frac{(b-a)^2}{12}$</td>
            <td>messy</td>
            <td>messy</td>
        </tr>
        <tr>
            <td>Exponential distribution $E(\lambda)$</td>
            <td>
                ???
            </td>
            <td>$f_X(x) = \lambda e^{-\lambda{x}}$</td>
            <td>$\frac{1}{\lambda}$</td>
            <td>$\frac{1}{\lambda^2}$</td>
            <td>$1-e^{-\lambda x}$</td>
            <td>$\frac{\lambda}{\lambda-t}$</td>
        </tr>
        <tr>
            <td>Normal/Gaussian distribution $N(\mu, \sigma^2)$</td>
            <td>
                mu ($\mu$) is the mean and
                sigma ($\sigma$) is the standard
                deviation.
            </td>
            <td>$f_X(x) = {\frac {1}{\sigma {\sqrt {2\pi }}}}e^{-{\frac {1}{2}}\left({\frac {x-\mu }{\sigma }}\right)^{2}}$</td>
            <td>$\mu$</td>
            <td>$\sigma^2$</td>
            <td>$messy$</td>
            <td>$e^{\mu t+ (\sigma^{2} * t^{2})/2}$</td>
        </tr>
        <tr>
            <td>Standard Normal distribution $N(0, 1)$</td>
            <td>
                This is a particular case of
                normal distribution.
            </td>
            <td>$f_X(x) = {\frac {1}{\sigma {\sqrt {2\pi }}}}e^{-{\frac {1}{2}}\left({\frac {x-\mu }{\sigma }}\right)^{2}}$</td>
            <td>$0$</td>
            <td>$1$</td>
            <td>$messy$</td>
            <td>$e^{\mu t+ (\sigma^{2} * t^{2})/2}$</td>
        </tr>
    </tbody>
</table>
</div>