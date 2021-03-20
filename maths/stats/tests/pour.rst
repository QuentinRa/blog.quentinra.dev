=========================================
Test de comparaison de deux pourcentages
=========================================

Deux tests possibles

	* **khi-deux**
	* **fisher**

Test d'indépendance du Khi-deux
***********************************

:code:`Conditions`
	Au moins 5 individus ou plus précisément que l'effectif ne soit pas trop faible
	(plusieurs dizaines).
	Généralement, on évite ce test si les pourcentages sont proches de 100% ou 0%.

:code:`Description`
	Le test le plus connu et utilisé. Vous pouvez essayer la méthode du boostrap pour augmenter
	la taille si vous n'avez pas assez d'individus.

:code:`Fonction`
	La fonction est :code:`chisq.test(var, var,correct=FALSE)` ou :code:`chisq.test(table(var,var),correct=FALSE)`.

	Le correct corresponds à la correction de continuité (T=oui, F=non). Si activé, le test
	est plus robuste mais moins puissant.

:code:`Note`
	On peut regarder le :code:`$expected` pour vérifier ou encore les résidus :code:`$residuals`.

	Une valeur ij élevée indique que cette valeur joue un rôle élevé dans la liaison des variables.
	C'est calculé selon la formule :math:`(observed - expected) / sqrt(expected)`.

Test exact de Fisher
************************

:code:`Conditions`
	Aucune.

:code:`Description`
	Très très gourmand en ressources, alternative au test du khi-deux lorsqu'on ne satisfait
	pas les conditions.

:code:`Fonction`
	La fonction est :code:`fisher.test(var, var)` ou :code:`fisher.test(table(var,var))`.