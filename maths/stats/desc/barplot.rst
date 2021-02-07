====================
Diagrammes a bandes
====================

| **Fonction** : :code:`barplot`
| **Note** : bien si variable qualitative ou si pas beaucoup de valeurs différentes (sinon illisible).

C'est comme un histogramme sauf que les x sont des valeurs uniques du vecteur passé en argument.
Typiquement, vous pouvez afficher graphiquement une :code:`table` donc :code:`barplot(table(qual))`.

.. code:: R

	barplot(table(ozone.summer.year), main = "Durée des observations de l'étée en jour",
	ylab = "nombre de jours", xlab = "année")

.. image:: /assets/math/stats/desc/barplot.png