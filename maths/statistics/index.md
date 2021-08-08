# Statistics

This is a course where you will learn

* (hard) about estimators, likehood (vraisemblance in French), bias, ...
* (soft) about population, variables (qualitative, quantitative), ...
* how you could conduct a analysis of a file of data
* plots used in statistics
* tests
* linear regression

And everything will be coupled with examples in ``R``,
you may add examples in other languages. To be honest, 
I do not understand much about statistics so
be sure to correct any mistakes, thanks!

<hr class="sr">

## Introduction

The main idea is that you got some **data** and you need to
find how this data got generated (what distribution function?
what were the parameters?...). Once we have our **model**,
then we can do thing like trying to guess the future.

* [Population](voc/population.md) : data we are observing, a matrix
* [Variables](voc/variables.md) : the columns of our matrix, can be quantitative or qualitative
* [Individuals](voc/individuals.md) : the rows of our matrix
* [Sample](voc/sample.md) (échantillon) : a part of our population
* [Model](voc/model.md) : characterization of the dataset
* [Population (paired)](voc/paired.md) : you took two times the data from the same indivuals

<hr class="sl">

## Maths recap

Before the next part, you need to know of those

* **mean** (empiric/arithmetic): sum values / number of values
* **mean** (weighted=pondérée): ``E(X) = sum of { value * frequency }``
* **median**: 50% are greater and 50% are lesser that the median.
It's ``F(x)=0.5``. (if `F` is the empirical cumulative distribution function)
* **medial** (Médiale): value that divide in two part the cumulative sum of values.
* **mode**: most repeated value ([wiki](https://en.wikipedia.org/wiki/Mode_(statistics)))
* [quantile](notions/quantiles.md): split the distribution in X part (4 = quartile, 10 = decile, 100 = centile).
* [covariance](notions/cov.md): if two value are independents then ``cov=0``.
* [moments](notions/moments.md): $\mathbb{E}(X)$,$V(X)$, Skewness, and Kurtosis

In R, you can use
`mean(x)`, `median(x)`, `quantiles(x)=fivenum(x)`, 
`cov(x)` or `cor(x)`. In the library `modeest`, you can
use ``mlv`` to get the mode value.

<hr class="sr">

## Analysis of a sample

This section is a summary of what you will do
but not how you will do it, as it will be explained
in other sections.

1. [Discovery](analysis/discovery.md)
2. [Descriptive statistics](ds/index.md)
2. [Statistical inference](si/index.md)

<hr class="sl">

## Estimators and likehood

We are using the notation $\theta$ (theta) for the vector
of the parameters of a distribution. For instance,
a binomial distribution $B(n,p)$ would become
$B(\theta)$. Because it's convenient, in statistics, we
are always using theta while you may not see it often
in probabilities.

Your goal is to estimate the vector "theta", like
"what parameters seem to have generated this distribution?".
We are calling **estimator** $\hat{\theta}$ (theta-hat), the
value that is likely the value of $\theta$.

Finally, we are calling Likelihood function $L(\hat{\theta})$
(`Fonction de vraisemblance`) the function returning a value
as to how much it seems $\hat{\theta}$ is equals to $\theta$.
You will have to maximize this function to find the best
$\hat{\theta}$, and that's called
maximum likelihood estimation/value (`maximum de vraisemblance`).

* [Estimators](si/estimators.md)
* [Likehood function](si/likehood.md)
* [Maximum Likehood estimation](si/mle.md) (MLE)
* [Log-likehood function](si/likehood-log.md)
* [Confidence interval](si/conf-int.md)

According to fitdistr function source code,
I was able to learn more about estimators.
You can find the source code
[here](https://github.com/cran/MASS/blob/master/R/fitdistr.R).
I will use my newly earned knowledge a lot in the two
next pages, but I don't know how did they learned that,
unfortunately...

* [Likehood functions (examples)](si/likehood-ex.md)
* [Maximum Likehood estimation (examples)](si/mle-ex.md)

<hr class="sr">

## Plots

In descriptive statistics, you will have to use plots
and try to guess the distribution. You got all of them
introduced in **R** course.

* **plot** (`plot`): simply plot your values
* **histogram** (`hist`): used to see the proportion of the distribution
  (=frequency, if prob=T) or the number of individuals taking a value, for each value
* **contingency table** (`table`): make a table of the uniques values 
  per the number of occurrences
* **pivot table** (`qhpvt`): you can use this to observe
  a variable with more depth, especially observing
  the relation of your variable and others variables.
* **Bar chart**: you can see the distribution of a quantitative
variable split by group according to a qualitative variable
  * for instance, you can see the number of students per year
  * let d be a data.frame and d\\$year be the year (ex: 2020)
  the student joined the school
  * then the call would be ``barplot(table(d$year))``
  * you may add beside=T for xtabs ``barplot(xtabs(....), beside = TRUE)``
* **Box plot**: same as BarChart but you can see the quantiles, the min and the max!
  * for instance, you can see the horsepower of a car per the number of cylinders
  * let d be a data.frame and d\\$hp (horsepower), d\\$cyl (cylinders) our variables
  * the call would be ``boxplot(d$hp ~ d$cyl)``

<hr class="sl">

## Tests

We are using tests to check if it seems likely that
a distribution is having a property. We are considering
two hypothesis $H_0$ and $H_1$ and we are testing which
one is more likely.

* $H_0$, null Hypothesis: we believe this is true
* $H_1$, alternate Hypothesis: what we want to demonstrate

You will usually see "=" or "is" in $H_0$ while
you will see "!=" or "isn't" in $H_1$. We may introduce
two errors while picking

* **Type I error** (`risque de première espèce`), $\alpha$: accepted $H_1$ but $H_0$ was true
* **Type II error** (`risque de seconde espèce`), $\beta$: accepted $H_0$ but $H_1$ was true

Note that we are calling the probabilities of the errors
above

* $1-\alpha$: confidence coefficient (`Niveau de confiance`)
* $1-\beta$: power of a test (`Puissance de test`)

We are calling **region of non-rejection**, the region
covered by the null hypothesis. The bounds separating this
part of distribution with the regions of rejections are
called **critical values**.

<hr class="sr">

## Regression

The linear regression (`Regression linéaire`)
is a line maximising the distance between each
point of the distribution and the line
<span class="tms">
(minimizing the sum of the square vertical distances
between our line and a point)
</span>

The linear regression equation is $Y = a + b X + residual$.
If $Y \not\in \mathbb{R}$ but in $Y \in [0,1]$,
then the residual is $0$ and you should look at
logistic regression.

* [What's Y, a, b, X?](regression/equation.md)
* [Regression table/model](regression/model.md)
* [Qualitative explanatory variables](regression/qual.md)
* [Linear regression](regression/linear.md)
* [Logistic regression](regression/logistic.md)
* Poisson regression

<hr class="sl">

## Sources

This is a list of all Wikipedia pages that you may
want to check

* <https://en.wikipedia.org/wiki/Statistical_inference>
* <https://en.wikipedia.org/wiki/Descriptive_statistics>
* <https://en.wikipedia.org/wiki/Linear_regression>
* <https://en.wikipedia.org/wiki/Linear_discriminant_analysis>
* <https://en.wikipedia.org/wiki/Regression_analysis>

Estimators and likehood

* <https://en.wikipedia.org/wiki/Bias_of_an_estimator>
* <https://en.wikipedia.org/wiki/Efficiency_(statistics)>
* <https://en.wikipedia.org/wiki/Likelihood_function>
* <https://en.wikipedia.org/wiki/Tolerance_interval>
* <https://en.wikipedia.org/wiki/Confidence_interval>

[other references](refs.md)