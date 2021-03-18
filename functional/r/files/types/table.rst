=============
Table
=============

Une table est un tableau donc les colonnes sont
des valeurs uniques et dont les valeurs sont le nombre
d'occurrences de ces valeurs dans le vecteur de départ.

.. code:: R

		# on tire 50 valeurs entières entre 0 et 10
		# on utilise sample pour que ce soit équiprobable
		> vect <- sample(0:10, 50, replace = TRUE)
		> table(vect)
		vect
		0  1  2  3  4  5  6  7  8  9 10
		4  6  4  6  5  5  5  6  6  1  2

On peut aussi afficher le résultat avec un graphique
avec :code:`barplot(table(vect))`. Si on mets
une taille de 2000000 par exemple au lieu de 50, on pourra
voir que la probabilité est bien équiprobable.

Un autr truc sympa avec les tables c'est :code:`useNa = "always"`
pour voir les valeurs NA