==============
Types en R
==============

Le R est faiblement typé mais les données sont implicitement
de l'un des types suivant

	* nombres (dit numeric) : 1,2,4, 4.5, ...
	* complexes (dit complex) : i
	* les booléens (dits logical) : TRUE (ou T) ou FALSE (ou F)
	* autre : la valeur NULL, la valeur NA (not available), la valeur Inf (infini)
	* les strings (dit character) : "chaine de caractères"

Et quelques types complexes

	* les vecteurs (c)
	* les matrices (matrix)
	* les DataFrames (data.frame)
	* les listes (list)
	* les tableaux (array)
	* les facteurs (factor)

Pour être exact, toutes les valeurs en R sont des vecteurs (valeur=vecteur de taille 1).
La valeur NA est utilisée lorsqu'une donnée est manquante. Tout calcul utilisant
NA retourne NA.

Fonctions utiles

	* :code:`is_na` (ou nan/finite/infinite) : TRUE si vrai sinon FALSE
	* :code:`class(data)` : savoir le type
	* :code:`mode(data)` : savoir le type/mode
	* :code:`identical(x,y)` : savoir si x identique à y

Vous pouvez créer un valeur en utilisant :code:`complex(n)` pour créer
n nombres complexes par exemple. Vous pouvez convertir
avec des fonctions du style :code:`as.integer(valeur)`.