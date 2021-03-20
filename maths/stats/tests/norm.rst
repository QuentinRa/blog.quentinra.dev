====================
Test de normalité
====================

Il existe 3 tests mais utilisez le diagramme QQ-Plot qui permet
de tracer ce qu'on appelle la droite de Henry car c'est un bon outil pour vérifier
la normalité (plus que les tests qui vérifient la non-normalité).

	* **Anderson-Darling**
	* **Cramer-von Mises**
	* **Shapiro-Wilk**

On vérifie la possibilité que la distribution suit une loi normale donc

	* H0 : les deux variables semblent pouvoir suivre une loi normale
	* H1 : les deux variables ne suivent pas une loi normale

Shapiro-Wilk
***************

:code:`Conditions`
	Avoir peu de valeurs identiques.

:code:`Description`
	Test plus puissant que les autres.

:code:`Fonction`
	On utilise la fonction :code:`shapiro.test(ech)`.

Anderson-Darling
********************

:code:`Conditions`
	???

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

:code:`Fonction`
	La fonction :code:`cvm.test(ech)` du package :code:`nortest`.