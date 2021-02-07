====================
Diagrammes a bandes
====================

On utilise généralement :code:`boxplot` car on peut voir graphiquement les 3 quartiles,
la médiane ainsi que le min et le max.

Rappel, la fonction :code:`quantiles()` retourne tous les quantiles.

Les valeurs extrêmes sont inférieures à :code:`Q1-1.5(Q3-Q1)` ou supérieures à :code:`Q3+1.5(Q3-Q1)`
avec Qi = ième quartile.

Il est possible de faire un boxplot d'une variable quantitative pour chaque groupe (donc
en utilisant une variable qualitative pour faire des groupes)
avec :code:`tableau ~ nom_variable_qualitative` (ex: tableau des ages
et un sexe (H/F) alors on obtient deux boxplot, une pour chaque sexe).

.. code:: R

		# on fait des groupes par année
		# > levels(ozone.summer.year)
		# [1] "2015" "2016" "2017" "2018" "2019"
		# on appelle la fonction
		> boxplot(ozone.summer.urbain~ozone.summer.year,
		main = "Réparition en zone urbaine par année des valeurs d'O3",
		xlab = "années", ylab = "quantité d'O3 signalée")

.. image:: /assets/math/stats/desc/boxplot.png