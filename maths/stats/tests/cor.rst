====================================================
Test de la nullité du coefficient de corrélation
====================================================

Test (de nullité) du coefficient de corrélation linéaire est de la forme

	* H0 : il existe une corrélation entre X et Y
	* H1 : il existe pas de corrélation entre X et Y

Test classique de Pearson
****************************

:code:`Conditions`
	L'une des distributions X ou Y doit suivre une loi normale.

:code:`Fonction`
	On utilise la fonction :code:`cor.test(X, Y)`.

:code:`Note`
	On peut utiliser :code:`cor.mtest(data)$p` du package :code:`corrplot`
	pour voir la matrice des corrélations, avec data une matrice ou un data.frame
	par exemple. On peut voir les corrélations deux à deux.

	On peut utiliser :code:`corrplot(cor(data), method="circle")` ou
	:code:`corrplot(cor(data), method="number")` du package :code:`corrplot`
	pour avoir un aperçu graphique.

Corrélation des rangs de Spearman
***********************************

:code:`Conditions`
	???

	Il me semble que faire un test de Spearman c'est uniquement pour les variables
	qui ne suivent pas une loi normale.

:code:`Fonction`
	On utilise la fonction :code:`cor.test(X, Y, method="spearman")`.