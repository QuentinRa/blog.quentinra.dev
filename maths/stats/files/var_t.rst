=============================
Transformation de variables
=============================

Changer le type
	Il existe des fonctions de la forme :code:`as.type()`
	donc :code:`as.integer(), as.Date(), ...`. Ensuite, par exemple
	si vous faites :code:`date2-date1` alors R retourne le nombre de jour
	entre deux dates donc avoir un type adapté est pratique.

Qualitative vers Quantitative
	Normalement, c'est simple il suffit de transformer
	le type en entier (par exemple).

Quantitative vers Qualitative (cas simple)
	Si votre variable n'a que peu de valeurs différentes alors
	vous faites simplement :code:`factor(ech$quant)`.

	Vous pouvez voir les groupes de valeurs avec :code:`levels(ech$qual)`
	ou encore :code:`table(ech$qual)`.

Quantitative vers Qualitative (cas discrétisation non supervisée)
	Vous avez trop de valeurs et voulez faire des groupes automatiquement.
	On considère que votre valeurs seront divisés en groupe selon un critère
	quantitatif déterminé par R.

		On charge la librairie :code:`arules`.

		Groupes par nombre de valeurs
			* :code:`discretize(data, method = "frequency", breaks = x)`
			* mets x valeurs par groupe

		Groupes par interval
			* :code:`discretize(v, method = "interval", breaks = x)`
			* découper en x intervals de même taille

		Groupes homogènes
			* :code:`r <- discretize(Age, method = "cluster", breaks = x)`
			* mets des valeurs proches ensembles

Quantitative vers Qualitative (cas discrétisation supervisée)
	Il s'agit d'un découpage dans lequel on essaye de regrouper le plus d'individus dans un groupe
	ayant un caractère qualitatif.

	Discrétion avec Khi-deux
		On va regarder pour un tableau de données si les données sont suffisamment proches (alpha=0.05=valeurs proches
		à 0.05 près) pour qu'elles soient dans le même groupe.

		La fonction est :code:`chiM(ech$quant, alpha = ...)` de la librairie :code:`discretization`.