=============
Table
=============

Tableaux de contingence simples
************************************

Une table, plutôt appelée par les pros un tableau de contingence,
est un tableau dont les colonnes sont des valeurs uniques et dont les valeurs sont le nombre
d'occurrences de ces valeurs dans le vecteur de départ.

.. code:: R

		# on tire 50 valeurs entières entre 0 et 10
		# on utilise sample pour que ce soit équiprobable
		> vect <- sample(0:10, 50, replace = TRUE)
		> table(vect)
		0  1  2  3  4  5  6  7  8  9 10
		4  6  4  6  5  5  5  6  6  1  2

Ici 0,1,... sont nos valeurs uniques et 4,6,4,6,5,... sont le nombre
d'occurrences de chacune soit 0 (4 fois) de 1 (6 fois), ...

On peut aussi afficher le résultat avec un graphique
avec :code:`barplot(table(vect))`. Si on mets
une taille de 2000000 par exemple au lieu de 50, on pourra
voir que la probabilité est bien équiprobable.

Un autre truc sympa avec les tables c'est :code:`useNa = "always"`
pour voir les valeurs NA

Tableaux de contingence compliqués
************************************

Vous pouvez faire des tableaux de contingence avec :code:`xtabs(~ qual + quant, ech)`
ce qui revient au même que de faire :code:`table(ech$qual, ech$quant)`

L'avantage est qu'on peut utiliser des formules ce qui est utile en stats pour
la regression, les tests ...