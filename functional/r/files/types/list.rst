=============
Listes
=============

Une liste est un vecteur dans lequel les éléments peuvent avoir des types différents.
On utile :code:`list(clef = valeur, valeur, ...)` pour créer une liste.

C'est le type le plus utilisé en R notamment beaucoup de fonction
retournent une liste.

Contrairement aux vecteurs, ... on utilise :code:`$clef`
pour accéder à une valeur associée à une clef ou on utilise :code:`[[indice]]`
mais indice est forcément une valeur. On peut également utiliser :code:`[indice]`
qui fonctionne comme pour les vecteurs mais retourne une liste.

.. code:: r

	# création
	> l <- list(age = 42, id = 13, nom = "Joseph")
	# accès d'un élément nommé
	> l$nom
	[1] "Joseph"
	# sous liste
	> info <- l[c("id", "nom")]
	$id
	[1] 13

	$nom
	[1] "Joseph"
	# accès d'un élément via l'indice (1 = age)
	> l[[1]]
	42