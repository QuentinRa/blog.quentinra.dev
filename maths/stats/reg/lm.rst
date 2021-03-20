====================
Regression linéaire
====================

1. Regression linéaire simple
===================================

La fonction :code:`lm(Y ~ X)` permet de calculer une droite de régression
simple donc :math:`Y = a + b * X`.

.. code:: R

	# regression Y = a + b * X
	model <- lm(Y ~ X, data=ech)
	# on regarde les résultats avec summary
	summary(model)

Le modèle de regression c'est une droite de regression mais avec le bruit, on pose des conditions pour évaluer
notre modèle de regression

	* H0 : b est égal à 0
	* H1 : b est différent de 0, donc b augmente significativement Y

On cherche à trouver :code:`b`, c'est à dire le coefficient
tel qu'augmenter V2 de 1 augmente en moyenne V1 de :code:`b`. Dans le modèle,

	* :code:`p-value` : la colonne :code:`Pr`
	* :code:`a` = colonne estimate, ligne intercept
	* :code:`b` = première ligne après intercept

Un modèle c'est un truc très pratique qui regroupe les informations du Test T mais
aussi la corrélation : :math:`r = b * \frac{\sigma_{X}}{\sigma_{Y}}`.

lm a une option subset qui permet d'appliquer subset() ce qui peut être très pratique.

2. Regression linéaire multiple
===================================

La regression linéaire multiple est comme la régression linéaire
simple mais cette fois on va regarder plusieurs variables explicatives et essayer de démêler
tous les liaisons entre ces critères.

On a une équation de la forme :math:`Y = a + b X + c Z + d T + ... + résidu`
ce qui se traduit en R avec :code:`lm(Y ~ X + Z + T)`.

	* :code:`b` = première ligne après intercept
	* :code:`c` = deuxième ligne après intercept
	* ...

Pour traduire le résultat, si on a :code:`b = 0.6` alors augmenter X de 1 revient
à augmenter Y de 0.6 à c, ... constants.

On peut aussi faire des sommes, si on a :code:`b = 0.6` et :code:`c = 0.1` alors augmenter X de 1 revient
Y de 0.6+0.1 soit 0.7.

3. Précisions sur les variables X, Z, T, ...
=================================================

On a dit que X, ... étaient toutes des variables, mais c'est un plus compliqué. En fait X ne peut être
que

	* binaire
	* quantitative

Sauf qu'en fait, une variable qualitative c'est un vecteur de variables binaires donc si vous passez
une variable qualitative, R sera se dérouiller (mais le résultat n'est pas facile à interpreter si vous ne lisez
pas la suite).

**Variables binaires/quantitatives**

Un exemple serait taille comme étant la variable à expliquer (Y) et l'âge (quantitative) A et le sexe (Homme/Femme : binaire) S.
On peut simplement regarder la valeur de b et en déduire pour les hommes/femmes, si on augmente l'age de 1 alors
de combien augmente/diminue la taille.

	* :math:`Y = a + b A + c S + résidu`
	* ce qui donnerait un cas comme ça selon si on est dans le cas Homme ou Femme
	* :math:`Y = a + b A + c * 0 + résidu`
	* :math:`Y = a + b A + c * 1 + résidu`

**Variables qualitatives**

Mais si on ajoute une variable qualitative, le métier M qui peut être Artisan, Mineur, Autre et Sans emploi par
exemple (des métiers au hasard) alors on voudrait savoir quel est l'impact du métier sur la taille.

Sauf que cette fois, on ne peut pas avoir des trucs comme :math:`Y = a + b A + c * 1 + d * "Artisan" + résidu`
car la multiplication par une string ne fait aucun sens. R va donc créer un vecteur de booléens avec

	* Artisan : 0 ou 1 (coefficient : aucun, car référence, voir plus bas)
	* Mineur : 0 ou 1 (coefficient : d)
	* Autre : 0 ou 1 (coefficient : e)
	* Sans emploi : 0 ou 1 (coefficient : f)

mais ensuite pour calculer la regression, il va utiliser un cas de base=référence, qui est par défaut la première
valeur par ordre alphabétique. Vous pouvez la changer avec :code:`M <- rlevels(M, ref="Artisan")` par exemple.

Pour comprendre tout ça, passons à l'interprétation : la valeur de nos coefficients d,e,f
corresponds à taux d'augmentation de la taille pour les personnes qui ne sont pas artisans. Autrement dit, il a
calculé que si une personne n'est pas artisan mais est mineur (d) alors sa taille va augmenter (ou diminuer) de b.

Cela pose toutefois problème, vous vouliez probablement savoir si le métier avait un impact significatif
sur la taille. On peut le faire simplement, en appelant une nouvelle méthode : :code:`drop1(model, .~., test="F")`.

4. Synergie
=============

Si vous souhaitez savoir si deux variables explicatives (par exemple X ET Z) ont un impact
significatif sur Y alors vous faites :code:`lm(Y ~ X*Y)`. On parle d'interaction ou de synergie.

Attention toutefois, vous ne pouvez pas faire :code:`lm(Y ~ X + Z + X*Z)` sinon les résultats
pour X et Z sont faux mais :code:`X*Z` est bon.

5. Conditions
===============

Les condition de validité du model de regression sont

	* normalité du bruit/des résidus

		* obtenir les résidus : :code:`resid(model)` (ou :code:`residuals(model)`)
		* regarde la normalité : hist, QQ-plot...
		* "l’hypothèse de normalité sous-jacente au modèle"

	* variance du bruit ne doit pas dépendre des expliqués/explicatives
	* pas de structure de corrélation évidente

On peut récupérer les valeurs de regression prédites avec :code:`fitted(model)`.

Plus le "Residual standard error", dit RSE, de notre modèle est petit, et plus notre modèle sera précis.

La valeur "Multiple R-squared" dit :math:`R^2`, multipliée par 100 indique le pourcentage de variance
qui est expliqué par me modèle. Le :math:`R^2` ajusté utile pour comparer des modèles entre eux.

6. Gérer la corrélation
==========================

Pour avoir un modèle qui se casse pas trop la figure, il faut essayer d'avoir un minimum de
corrélation entre les variables explicatives. Calculez la corrélation ou
la matrice de corrélations et regardez. S'il y a des corrélations évidentes,
alors il va valoir faire des choix.

La fonction :code:`rs <- regsubsets(...,nbest=n)` du package :code:`leaps`
avec ... les arguments de votre lm. Il va nous montrer
les meilleurs combinaisons possibles de vos variables.

regsubsets va chercher les meilleurs combinaisons avec 1 variables, 2, ...
nbest détermine le nombre de combinaisons qu'il vous montre

	* nbest = 2 et on a X1 X2 X3
	* X1 (1/2)
	* X2 (2/2)
	* X1 X2 (1/2)
	* X1 X3 (2/2)
	* ... pourrait être un résultat possible)

Il faudra choisir un modèle avec une faible RSE et un fort :math:`R^2`.

Vous aimez pas les étoiles ? Pas de problèmes, tracez
votre truc :code:`plot(rs,scale="adjr2", main="Modèles classés en fonction de r² ajusté")`
et les carrés blancs indiquent que pour obtenir un taux entre de :math:`R^2` entre
les deux y du carrés alors vous devez prendre cette valeur X.

.. image:: /assets/math/stats/subset.png

Vous n'aimez toujours pas ? Dernière alternative avec la librairie :code:`car`
et sa fonction :code:`subsets(rs, statistic="adjr2", legend = "topleft")`. On cherche
les plus petites valeurs.

7. Autres
===========

Si vous souhaitez faire des prédictions, cela se fait avec :code:`predict(model, V, interval="predict",level=0.95)`
avec V qui est un vecteur correspondant aux valeurs que vous avez prévues pour vos
VA. Il existe une forme sans V.

Ce n'est pas abordé mais la distance de Cook mesure l’influence
de l’observation sur les coefficients de régression avec

.. code:: R

		library(olsrr)
		ols_cooksd_chart(model)