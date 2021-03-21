====================
Test de normalité
====================

Il existe 4 tests mais utilisez le diagramme QQ-Plot qui permet
de tracer ce qu'on appelle la droite de Henry car c'est un bon outil pour vérifier
la normalité (plus que les tests qui vérifient la non-normalité).

	* **Shapiro-Wilk**
	* **Anderson-Darling**
	* **Cramer-von Mises**
	* **Lilliefors**

On vérifie la possibilité que la distribution suit une loi normale donc

	* H0 : les deux variables semblent pouvoir suivre une loi normale
	* H1 : les deux variables ne suivent pas une loi normale

Généralement, les prochains tests demanderont à ce que la loi converge vers une loi normale
(a.k.a suive une loi normale), si ce n'est pas le cas de votre distribution, guettez
les tests avec le mot RANG dedans car ils n'ont pas cette condition.

.. hint::

	Il existe d'autres tests appelés tests d'adéquations qui permettent entre autres de vérifier la normalité.

Shapiro-Wilk
***************

:code:`Conditions`
	Avoir peu de valeurs identiques. Il vaut mieux aussi éliminer les valeurs extrêmes/aberrantes
	(outliers).

:code:`Description`
	Test plus puissant que les autres. Il s'agit de la somme des écarts à la moyenne divisé
	par le carré de la somme des différences.

:code:`Fonction`
	On utilise la fonction :code:`shapiro.test(ech)`.

Anderson-Darling
********************

:code:`Conditions`
	???

:code:`Description`
	Variante du test d'ajustement de Kolmogorov-Smirnov.

:code:`Fonction`
	| La fonction :code:`ad.test(ech)` du package :code:`nortest`.
	| La fonction :code:`ad.test(ech, pnorm)` du package :code:`ADGofTest`.

	Dans le second cas, le test est

		* H0 : ech est un échantillon de la loi pnorm
		* H1 : ech ne semble pas être un échantillon généré par pnorm

	et pnorm n'est pas une fonction mais un échantillon généré avec pnorm et les paramètres
	que vous pensez être ceux que la loi normale originale.

Cramer-von Mises
********************

:code:`Conditions`
	???

:code:`Description`
	Variante du test d'ajustement de Kolmogorov-Smirnov.

:code:`Fonction`
	La fonction :code:`cvm.test(ech)` du package :code:`nortest`.

Lilliefors
************

:code:`Conditions`
	???

:code:`Description`
	Variante du test d'ajustement de Kolmogorov-Smirnov.

	"The Lilliefors (Kolomorov-Smirnov) test is the most famous EDF omnibus test for normality;
	compared to the Anderson-Darling test and the Cramer-von Mises test it is known to perform worse.",
	selon la documentation R, d'un autre package que le notre ayant cette fonction.

:code:`Fonction`
	La fonction :code:`lillie.test(ech)` du package :code:`nortest`.

----

**Références**

	* https://cran.r-project.org/web/packages/nortest/nortest.pdf
	* http://www.jybaudot.fr/Inferentielle/testsnormalite.html
	* https://www.rdocumentation.org/packages/SciencesPo/versions/1.3.9/topics/lilliefors