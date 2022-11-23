# Statistical inference

[Go back](..)

You need to verify that the model hypothesis seems to be true. That's the hardest part, you will deal with estimators, likelihood, tests, ...

<hr class="sl">

## Normal distribution

According to the Central limit theorem (`Théorème de la limite centrale`)

<div>
\[
X \sim \lim_{n \to +\infty} N(\mu, \frac{\sigma}{n})
\]
</div>

You will use this a lot, because some tests are only working if the distribution is following a normal distribution, so you'll usually test that your distribution is following a normal distribution.