==================================
Test de comparaison des variances
==================================

N tests possibles

	* **Test F de Fisher (2 variances)**
	* **Test de Levene et de Brown-Forsythe**
	* **Test de Bartlett**

On considère

	* H0 : les variances sont égales
	* H1 : les variances sont différentes

Test F de Fisher (2 variances)
******************************

:code:`Conditions`
	???

:code:`Fonction`
	| La fonction est :code:`var.test(x=var1,y=var2)`
	| Ou alors vous avez la version :code:`var.test(quant~qualif, data=ech)`

	On peut tester l'égalité de variance entre x,y (deux jeux de données) ou alors
	en faisant des groupes selon une variable quantitative.

Test de Bartlett
******************

:code:`Conditions`
	Plus de 4 individus par échantillon. Le nombre d'individus par groupe (après qu'on ai
	séparé les individus selon un critère qualitatif) doit être supérieur significativement
	au nombre de groupes.

:code:`Description`
	Pareil que le test de fisher à deux variances par groupes.

:code:`Fonction`
	La fonction est :code:`bartlett.test(quant, qualif)`.

Test de Levene et de Brown-Forsythe
**************************************

:code:`Conditions`
	???

:code:`Fonction`
	| La fonction :code:`leveneTest(quant, qual)` du package :code:`car`
	| La fonction :code:`levene.test(quant, qual, location = "median")` du package :code:`lawstat`

----

**Références**
	* https://www.statology.org/f-test-in-r/
	* http://www.jybaudot.fr/Inferentielle/testf.html