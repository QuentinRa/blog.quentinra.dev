=====================
Structures de données
=====================

Un vecteur corresponds à un tableau de valeurs en C. Mais vous
pouvez faire des opérations dessus (ex: vecteur * 2 + 100) comme en python avec un numpy array.
Dans ce cas, alors l'opération sera faite sur chacun des éléments
ce qui donnera un vecteur.

Vous utilisez le constructeur :code:`c(valeur, valeur, ...)` pour créer un vecteur
(ou :code:`vector(mode="type", length=n)`).
Si vous donnez un vecteur comme valeur, alors les valeurs du vecteurs seront
concaténées pour former le nouveau vecteur.

Dans le cas ou vous manipulez deux vecteurs de taille différente, alors on re-parcours
le plus petit vecteur depuis le début. Attention cependant,
le plus petit doit avoir une taille multiple du plus grand (sinon warning).

.. code:: r

		> c(1, 2, 3, 4) + c(0,10)
		[1]  1 12  3 14 # résultat de 1 + 0, 2+10, 3 + 0, 4 + 10

Il est possible de créer un vecteur depuis un interval avec :code:`debut:fin`
donc :code:`1:100` crée un vecteur ayant 100 valeurs allant de 1 à 100 inclus.

**Indexes**

Un vecteur est comme un tableau en C, donc on peut récupérer des valeurs
avec :code:`vecteur[indices]`. Les différences sont que vous pouvez passer
un vecteur d'indices, que R ne fait pas d'erreur si vous utilisez un indices
en dehors du vecteur (donc faire attention) et que les indices comment à 1. Vous
pouvez prendre tout sauf les indices donnés en mettant un :code:`-` (moins)
devant le vecteur/chaque indice.

.. code:: r

	# passe vecteur d'indices de 1 à 25 donc les 25 premiers de vecteur
	> vecteur[1:25]
	[1] 76 90 66 59 28 93 20 68 27 67 38 96 11 48 68 64 46 28 47 93 17 53 86 97 46
	> vecteur[c(1,2)] # seulement les 2 premiers
	[1] 76 90
	> vecteur[-c(1,2)] # tous sauf deux premiers
	[1] 66 59 28 93 20 68 27 67 38 96 11 48 68 64 46 28 47 93 17 53 86 97 46
	> vecteur[c(-1,-2)] # tous sauf deux premiers (pareil que plus haut)
	[1] 66 59 28 93 20 68 27 67 38 96 11 48 68 64 46 28 47 93 17 53 86 97 46
	> y <- seq(1,10)
	> vecteur[y] # y donc seq(1,10) donc les indexes 1 à 10
	[1] 76 90 66 59 28 93 20 68 27 67

**Fonctions utiles**

	* :code:`length(vecteur)` : retourne la taille
	* :code:`which.min/which.max` : retourne l'indice du min/max
	* :code:`which(...)` : retourne les indices des éléments selon la condition (ex: vecteur > 10)
	* :code:`rev` (inverse), :code:`sum/prod` (somme/produit de tous les éléments)
	* :code:`attributes(vecteur)` : voir les attributs
	* :code:`any/all` : retourne true si un/tous les éléments respectent une condition
	* :code:`sort` : trie les données

**Indexes nommés**

Vous pouvez nommer des indices d'un vecteur avec :code:`nom = valeur`.
On peut obtenir/modifier des noms avec :code:`names()`.

.. code:: r

	# création
	> r <- c(oui = 1, non = 0)
	> r["oui"]
	oui
	1
	# forcer des noms
	> r <- c(r, 2) # taille 3
	> names(r) <- c("oui", "non", "jsp")

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