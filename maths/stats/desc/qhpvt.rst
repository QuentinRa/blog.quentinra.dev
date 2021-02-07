=================
Tableaux croisés
=================

| **Fonction** : :code:`qhpvt`
| **Note** : super pratique, librairie :code:`pivottabler`

Un tableaux croisés permet d'observer l'évolution de deux variables aléatoires.
On a généralement X1, X1 par rapport à X2, ... et ce pour toutes les variables.

Forme : :code:`qhpvt(data, rows = ..., columns = ..., calculations = "...")`

	* data : vos données (data.frame)
	* rows : la colonne du DataFrame dont chaque valeur aura une ligne
	* cols : la colonne du DataFrame dont chaque valeur aura une colonne
	* calculations/cal : le calcul de chaque valeur i,j

		* "mean()" : faire la fonction mean (moyenne)
		* "n()" : faire la fonction n (nombre d'éléménets)
		* ...

	* formats : format d'une cellule (list("%.1f") par exemple)
	* totals : ligne total (vous pouvez la renommer/retirer avec :code:`totals='totals=NONE'`)

Vous pouvez faire plusieurs calculs, mettre plusieurs lignes/colonnes en utilisant
des vecteurs (:code:`row = c(..., ...)`).