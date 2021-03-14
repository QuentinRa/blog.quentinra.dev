===================================
8. Ordonnancement - Définitions
===================================

Coût optimal
	La chaine ayant le plus haut coût.

Marges
	| **totale** : Retard possible pouvant être pris sur une tâche sans affecter le coût optimal.
	| :code:`calcul` : début max-début min
	| **libre** : marge totale mais sans modifier les dates de début des tâches suivantes
	| :code:`calcul` : pour chaque sommet, on regarde de combien on peut augmenter le début sans que début+cout > début des suivants
	| **certaine** : marge libre mais en considérant que toutes les tâches ont commencé au plus tard
	| :code:`calcul` : a est la marge libre si début max de i-(début max+coût prédécesseur) >= a > 0 pour tout prédécesseur de i

Tâche critique et chaine critique
	Une tâche est critique si ça date de début et sa date maximale de début sont la même.

	Une chaine critique est une chaine de tâches critiques.

Déterminer la date au plus tôt
	La date au plus tôt du premier est zéro. La date au plus tôt de n'importe quel sommet
	est le plus grand coût parmi la somme des (date au plus tôt + coût) des prédécesseurs.

Déterminer la date au plus tard
	On part de la fin, sa date au plus tard est sa date au plus tôt. La date au plus tard
	est le minimum parmi (date au plus tôt du sommet actuel - coût du prédécesseur).