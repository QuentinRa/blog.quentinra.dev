# Statistics

This is a course where you will learn

* (hard) about estimators, likehood (vraisemblance in French), bias, ...
* (soft) about popuplation, variables, qualitatif, quantitatif, ...
* how you could conduct a analysis of a file of data
* plots used in statistics
* tests
* linear regression

And everything will be coupled with examples in ``R``,
you may add examples in other languages.

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
* **quantile**: split the distribution in X part (4 = quartile, 10 = decile, 100 = centile).
* [covariance](maths/cov.md) : if two value are independents then ``cov=0``.

<hr class="sr">

## Analysis of a sample

This section is a summary of what you will do
but not how you will do it, as it will be explained
in other sections.

1. [Discovery](analysis/discovery.md)
2. [Descriptive statistics](ds/index.md)
2. [Statistical inference](si/index.md)

<hr class="sl">

## Estimators, likehood, ...

...

<hr class="sr">

## Plots

...

<hr class="sl">

## Tests

...

<hr class="sr">

## Linear regression

...

<hr class="sl">

## Sources

* <https://en.wikipedia.org/wiki/Statistical_inference>
* <https://en.wikipedia.org/wiki/Descriptive_statistics>