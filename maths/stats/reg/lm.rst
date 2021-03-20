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

...