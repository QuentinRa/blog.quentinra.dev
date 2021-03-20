======================
Regression logistique
======================

Maintenant que Y est une probabilité, on a un problème
car la partie de droite (ex: :code:`Y = a + b X`) vit dans
R mais Y vit dans [0,1].

Les mathématiciens ont pondus une formule

.. math::

	\log(\frac{P(X=n)}{1-P(X=n)}) = a + b X + c T

Il n'y a plus de résidu. Tout marche pareil que pour
la regression linéaire, sauf que la fonction est
:code:`glm(Y~X, family="binomial")` pour :math:`Y = a + b X`.

Si X est binaire, alors l'interprétation est simple : exp(b)
à la même interprétation que b dans une regression linéaire. En fait exp(b) = odds-ratio =
= twoby2(1-Y, 1-X) = multiplicateur de la probabilité de Y, **seulement si Y est un événement rare**.
En fait on Y n'est pas toujours rare, donc ça ne marche pas souvent...

:code:`exp(coefficients(model)` permet d'avoir tous nos b, c, ...

Attention, on fait maintenant :code:`drop1(model, .~., test="Chisq")` pour appeler drop1.

**Conditions de validité**

Au moins 5-10 événements par variable explicative. En fait, on va calculer
un nombre n qui corresponds au nombre d'individus concernés par l'événement Y. En probabilité,
c'est le #A lorsqu'on fait #A/#Omega.

La propriété à vérifier est

	* soit :math:`(|X|+|Z|+|T|) * 5 <= n`
	* ou mieux :math:`(|X|+|Z|+|T|) * 10 <= n`

Pour une variable quantitative/binaire, :math:`|X| = 1`
mais sinon pour les autres variables qualitatives (non binaires), ils
s'agit de :code:`length(levels(qual))-1`.

Les plus malins remarqueront qu'il s'agit du nombre de lignes
de la regression donc le nombre de coefficients que vous avez avec summary (pas drop1).