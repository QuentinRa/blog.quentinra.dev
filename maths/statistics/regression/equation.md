# Explanations about the equation

[Go back](..)

@
Y = a + b X + residual
@

<hr class="sl">

$Y$ is a quantitative variable, called
response/dependent variable or
``variable à expliquer/réponse/cible``.

$X$ is a variable (either qualitative or
quantitative) called explanatory/predictor variables
or ``variable explicative/prédicteurs/facteur (rare)``.

$a$ is called the intercept 
coefficient/`coefficient d’interception`.

$b$ is the coefficient of $X$.

The $residual$, also called noise or $\epsilon$, this is a measure
of the error.

**Note**: if you want $Y$ to be qualitative, then
you should look at 
[Linear discriminant analysis](https://en.wikipedia.org/wiki/Linear_discriminant_analysis)
(analyse factorielle discriminante)
or at [Random forest](https://en.wikipedia.org/wiki/Random_forest)
(Arbres de Décision et Forêts Aléatoires).

<hr class="sr">

## Simple/Multiple

Since
we only have one variable ($X$) is called "simple
linear/logistic regression" but if you have something
like $Y = a + b X + c Y + ... + residual$ then
you will have to deal with "multiple linear/logistic regression".

<hr class="sl">

## And what's the goal?

What we are trying to observe using a regression is
the dependency between $Y$ and the predictor variables.

The result is a model/table in which you will have
the dependency between the variables and you could
read the impact of a criteria on a variable.

You could also use your model to make
predictions.