=============
Histogramme
=============

| **Fonction** : :code:`hist`
| **Note** : Variables numériques uniquement

Généralement on l'utilise pour voir graphiquement le nombre d'individus (y=#individus) (:code:`hist()`)
mais on peut faire un histogramme de fréquences/densité (y=freq) avec :code:`proba=TRUE`.

On peut faire un histogramme des différences (:code:`x = b-a`) avec b et a des vecteurs.

.. code:: R

	hist(ozone.summer.urbain, proba = TRUE,
	col = "red",
	main = "Densité d'O3 l'été en zone urbaine (NEUIL)",
	xlab = "Polution de l'air (O3)")

.. image:: /assets/math/stats/desc/hist.png