==============================
Quantile-Quantile (QQ plot)
==============================

Diagramme Quantile-Quantile

| **Fonction** : :code:`qqplot`, :code:`qqnorm`, :code:`qqline`
| **Note** : vecteurs numériques

Si les observations et la distribution sont la même, alors les points
tourneront autour de la droite. Cela peut être un moyen utile de vérifier un test.

On voit visuellement si les points sont alignés sur la droite d'une distribution.

.. code:: R

	# voir les quantiles d'une variable
	qqnorm(ech$var)
	# mets les quantiles en Y
	# qqnorm(ech$var, datax = TRUE)

	# test avec loi de poisson
	qqline(rpois(100, mean(ech$var)))
	# on regarde graphiquement le résultat
	# et on voit que ce n'est pas le cas

.. image:: /assets/math/stats/desc/qqplot.png