=====================
Structures de données
=====================

DataFrame
------------

La particularité d'une matrice est que tous les éléments
ont le même type. Si ce n'est pas le cas, alors utilisez
un dataframe.

.. code:: r

		# création, mettez des vecteurs et/ou des matrices
		> dataframe <- data.frame(vecteur, matrice, ...)
		# mettre des noms aux colonnes
		colnames(dataframe) <- vecteur_noms_colonnes

Vous pouvez utiliser :code:`$` comme pour les listes
car dataframe hérite de list. Vous pouvez utiliser le :code:`[i,j]`
des matrices, avec i/j pouvant être dataframe$nom_colonne par exemple.

Vous pouvez utiliser :code:`order` pour obtenir les indices des lignes
dans l'ordre et utiliser cette valeur pour i.