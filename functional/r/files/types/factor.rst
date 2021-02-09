=============
Facteurs
=============

C'est un type assez compliqué. Un factor est utilisé pour représenter
une variable qualitative. Il possède des niveaux
qui sont les différentes valeurs que peut prendre cette variable.

On parle de niveaux car ils ont un ordre.

On utilise :code:`factor(v, levels = niveaux)`
pour créer un facteur. Si vous ne donnez pas les niveaux, alors
ce sera les valeurs uniques du vecteur v dans l'ordre alphabétique.

.. code:: R

		> f <- factor(c("oui", "oui", "non", "jsp", "oui","non"), levels = c("oui","non", "jsp"))
		[1] oui oui non jsp oui non
		Levels: oui non jsp
		# automatique, par ordre alphabétique
		> factor(c("oui", "oui", "non", "jsp", "oui","non"))
		[1] oui oui non jsp oui non
		Levels: jsp non oui

Vous pouvez identifier les facteurs avec :code:`levels(f)`. Vous pouvez
supprimer un niveau avec :code:`droplevels(f, nom)`

.. code:: R

		> levels(f)
		[1] "oui" "non" "jsp"
		> droplevels(f, "jsp")
		[1] oui  oui  non  <NA> oui  non
		Levels: oui non

		# ajout d'un niveau
		> levels(f) <- c(levels(f), "???")
		> levels(f)
		[1] "oui" "non" "jsp" "???"
