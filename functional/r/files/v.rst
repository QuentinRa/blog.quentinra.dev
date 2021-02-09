=====================
Structures de données
=====================

Tables
-------

Une table, crée avec :code:`table(vecteur)` est un tableau
qui contient des valeurs (uniques) associées a leur nombre d'occurrences
dans le vecteur.

Liste
------

Une liste est un vecteur dans lequel les éléments peuvent avoir des types différentes.
On utile :code:`list(clef = valeur, valeur, ...)` pour créer une liste.

Si un élément à une clef/nom, on utile :code:`$` pour y accéder. On peut récupérer
un élément avec :code:`[[indice]]` ou obtenir une sous-liste avec :code:`[]`.

.. code:: r

	> l <- list(age = 42, id = 13, nom = "Joseph", 1117521156)
	> l$nom # accès à un élément nommé
	[1] "Joseph"
	> info <- l[c("id", "nom")] # contient $id 13 et $nom "Joseph"
	> l[[1]]
	42

Matrice
---------

Si un vecteur a une dimension (:code:`dim(vecteur)`) alors
c'est une matrice. Vous pouvez créer explicitement une matrice
avec :code:`matrix(data, nrow, ncol)`.

.. code:: r

	> y <- seq(1,10)
	# déclaration d'une matrice depuis y
	# byrow = remplissage de haut en bas, FALSE par défaut
	> matrix(y, 2, 5, byrow = FALSE)
	 [,1] [,2] [,3] [,4] [,5]
	[1,] 1 3 5 7 9
	[2,] 2 4 6 8 10
	> dim(y) <- c(2,5) # ou on force la dimension en transformant y
	> y
	 [,1] [,2] [,3] [,4] [,5]
	[1,] 1 3 5 7 9
	[2,] 2 4 6 8 10
	# ajouter des colonnes (avant et/ou après)
	> cbind(colonne_before, matrice, colonne_after)

Il est possible de faire des matrices ayant 3, ... dimensions en modifiant
dim(m).

Fonctions importantes

	* :code:`t(m)` : transposée
	* :code:`solve(m)` : inverse une matrice
	* :code:`solve(A,b)` : résous Ax=b
	* :code:`diag(...)` : comme matrix, mais crée une matrice diagonale
	* :code:`m1 %*% m2` : produit matriciel
	* :code:`eigen(m)` : valeur et vecteur propre (utiliser $vector ou $values)

Autres fonctions utiles sur les matrices : :code:`ncol(m)`, :code:`nrow(m)`,
:code:`cbind(...)` (insérer colonnes), :code:`rbind(...)` (insérer lignes),
:code:`rownames(m)` (noms lignes), :code:`colnames(m)` (noms colonnes)...
Alternativement, vous pouvez définir row/col avec :code:`dimnames(m) <- list(c("col1row1", ...), ...)`

Pour récupérer seulement une partie, on utilise :code:`[indice_i,indice_j]`
vous donnez deux indices (vous pouvez omettre j = tous mais laissez la virgule).
Le sélecteur sélectionne tous les lignes i et toutes les colonnes j.

Parfois, R transforme en un vecteur la sous-matrice. Vous pouvez empêcher
cette transformation avec :code:`[i,j,drop=FALSE]`.

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