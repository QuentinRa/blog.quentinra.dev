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

<div class="sr"></div>

## Introduction

The main idea is that you got some **data** and you need to
find how this data got generated (what distribution function?
what were the parameters?...). Once we have our **model**,
then we can do thing like trying to guess the future.

* [Population](voc/population.md) : data we are observing, a matrix
* [Variables](voc/variables.md) : the columns of our matrix, can be quantitative or qualitative
* [Individuals](voc/individuals.md) : the rows of our matrix
* [Sample](voc/sample.md), échantillon : a part of our population
* [Model](voc/model.md) : characterization of the dataset

And some more if you want

* [Population (paired)](voc/paired.md) : you took two times the data from the same indivuals

<div class="sl"></div>

## Maths recap

Before the next part, you need to know of those

* **mean** (empiric/arithmetic): sum values / number of values
* **mean** (weighted=pondérée): ``E(X) = sum of value * frequency``
* **median**: value where 50% are greater value and 50% have a lesser value.
It's ``F(x)=0.5`` if `F` is the empirical cumulative distribution function)
* **medial** (Médial): value that divide in two part the cumulative sum of values.
* **mode**: most repeated value
* **quantile**: split the distribution in X part (4 = quartile, 10 = decile, 100 = centile).
* [covariance](maths/cov.md) : if two value are independents then ``cov=0``.

<div class="sr"></div>

## Learn about estimators, likehood, ...

...

<div class="sl"></div>

## Analysis of a sample

...

<div class="sr"></div>

## Plots

...

<div class="sl"></div>

## Tests

...

<div class="sr"></div>

## Linear regression

...

<div class="sl"></div>

## Sources

...