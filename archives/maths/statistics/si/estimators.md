# Estimators

[Go back](../index.md#estimators-and-likelihood)

An estimator is a function taking random variables and returning an estimation of their values. In a dataset, for each column <small>(=variable)</small>, you will look for an estimator of the variable, and merging every estimator in a vector is creating the vector $\hat{\theta}_n$.

<div>
\[
\begin{split}
h_n(X_1,...,X_n) = \hat{\theta}_n \\
T(X_1,...,X_n) = \hat{\theta}_n \\
f(X_1,...,X_n) = \hat{\theta}_n \\
\end{split}
\]
</div>

But you know, things aren't that easy. The difference between the expected value and $\theta$ is called the bias (`biais`). If you got a choice, pick the estimator that has the least bias.

* biased: $B(\hat{\theta}) = E[\hat{\theta}] - \theta$
* unbiased: $B(\hat{\theta}) = 0$
* asymptotic without bias: $\lim_{n \rightarrow +\infty} E[\hat{\theta}] = \theta$

You should also pick the estimator with the least mean squared deviation/error (MSD/MSE)

@
MSE(\hat{\theta}) = E[(\hat{\theta}-\theta)^2] = Var(\hat{\theta})+B(\hat{\theta})^2
@

**Notes**

* when an estimator is **converging** to the real value, we are calling it convergent estimator (`estimateur convergent`)
* an estimator is **efficient** (`estimateur efficace`) if $Var(\hat{\theta})$ is low
* an estimator that is not impacted too much by the outliers is says to be **robust** (`estimateur robuste`)

The 3 words above along with the bias are making the key properties we are checking to see if an estimator is good.

<hr class="sl">

## Well-known unbiased formulas

You should know how to demonstrate them, but I don't know how to do so, hence I'm not doing it 🙄. You can find that on the web anyway, like you got one on [Wikipedia](https://en.wikipedia.org/wiki/Bias_of_an_estimator).

* unbiased mean

<div>
\[
\hat{\mu} = \frac{1}{n} \sum_{i=1}^{n} X_i
\]
</div>

* unbiased variance (remember the 1/n-1)

<div>
\[
S^2_{n} = \frac{1}{n-1} \sum_{i=1}^{n} (X_i-\hat{\mu})^2
\]
</div>

* unbiased asymptotic variance

<div>
\[
S^2_{n} = \frac{1}{n} \sum_{i=1}^{n} (X_i-\hat{\mu})^2
\]
</div>