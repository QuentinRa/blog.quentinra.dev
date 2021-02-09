=============
Matrices
=============

Comme un vecteur, une matrice est la même chose qu'une matrice en maths. Elle est composée
de lignes qui sont des vecteurs. En particulier, on peut transformer un vecteur dans le type
matrix en lui donnant une valeur de ligne+colonnes.

On peut créer une matrice avec :code:`matrix(data, nrow, ncol)` avec data des valeurs,
et nrow/ncol le nombre de lignes/colonnes. Les valeurs sont disposées par colonne par défaut
mais vous pouvez mettre :code:`matrix(data, nrow, ncol, byrow = TRUE)` pour ajouter
les éléments par ligne.

La méthode :code:`dim(m)` permet d'obtenir le nombre de lignes, colonnes de
la matrice. Vous pouvez également utiliser :code:`ncol(m)` et :code:`nrow(m)`.

.. code:: R

		# on rappelle que 1:9 = vecteur de [1,2,...,8,9]
		# on veut une matrice 3,3
		> matrix(1:9,3,3)
		 [,1] [,2] [,3]
		[1,]    1    4    7
		[2,]    2    5    8
		[3,]    3    6    9
		> matrix(1:9,3,3, byrow = TRUE)
		 [,1] [,2] [,3]
		[1,]    1    2    3
		[2,]    4    5    6
		[3,]    7    8    9
		# on transforme un vecteur
		# en une matrice
		> y <- 1:9
		> matrix(y, 3,3) # comme plus haut
		# sinon
		> dim(y) <- c(3,3)
		> y
		 [,1] [,2] [,3]
		[1,]  1    4    7
		[2,]  2    5    8
		[3,]  3    6    9

Vous pouvez ajouter des colonnes=vecteurs ou des matrices avant/après votre
matrice avec :code:`cbind(un_vecteur, ma_matrice, une_autre_matrice, un_vecteur, ...)`.
Les colonnes seront alors dans l'ordre de gauche à droite des arguments.

Il existe la même fonction avec les lignes.

**Indices**

Le principe est le même que les vecteurs, mais vous devez donner le i et le j
ou au moins mettre une virgule.

.. code:: R

	> m[,] # toute la matrice
	> m[1,] # première ligne
	> m[,1] # première colonne
	> m[1,1] # valeur 1,1

Parfois, il faudra utiliser :code:`m[i,j,drop=FALSE]` pour éviter que R déférence
en un vecteur la matrice sélectionnée par i,j.

**Calcul matriciel**

	* :code:`t(m)` : transposée
	* :code:`solve(m)` : inverse une matrice
	* :code:`solve(A,b)` : résous Ax=b
	* :code:`diag(...)` : comme :code:`matrix()`, mais crée une matrice diagonale
	* :code:`m1 %*% m2` : produit matriciel
	* :code:`eigen(m)` : valeur et vecteur propre (utiliser $vector ou $values)

**Autres**

	* :code:`dimnames(m)` : nom des lignes et colonnes
	* :code:`colnames(m)` : nom des colonnes
	* :code:`rownames(m)` : nom des lignes