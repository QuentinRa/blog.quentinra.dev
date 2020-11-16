================================================
2. Ordonnancement - Méthode Potentiel-tâches
================================================

Dans la méthode Potentiel-tâches, on va construire un graphe
des tâches dans lequel les sommets sont des tâches et les arcs portent
un poids qui est le coût de la tâche.

Chaque sommet aura en plus sa date au plus tôt (donc le coût des tâches dépendantes)
et sa date au plus tard (donc le coût avec un maximum de retard sans retarder le projet).

On ajoute deux sommets : début et fin. Les arcs partant de début vers
les sommets n'ayant pas de tâches antérieures ont pour coût zéro.

Définitions
----------------------

Coût optimal
	La chaine ayant le plus haut coût.

Marges
	| **totale** : Retard possible pouvant être pris sur une tâche sans affecter le coût optimal.
	| :code:`calcul` : début max-début min
	| **libre** : marge totale mais sans modifier les dates de début des tâches suivantes
	| :code:`calcul` : pour chaque sommet, on regarde de combien on peut augmenter le début sans que début+cout > début des suivants
	| **certaine** : marge libre mais en considérant que toutes les tâches ont commencé au plus tard
	| :code:`calcul` : Pour chacun prédécesseur de i, si leur début max+coût-début max de i >= a > 0 pour tous, a est la marge libre

Tâche critique et chaine critique
	Une tâche est critique si ça date de début et sa date maximale de début sont la même.

	Une chaine critique est une chaine de tâches critiques.

Déterminer la date au plus tôt
	La date au plus tôt du premier est zéro. La date au plus tôt de n'importe quel sommet
	est le plus grand coût parmi la somme des (date au plus tôt + coût) des prédécesseurs.

Déterminer la date au plus tard
	On part de la fin, sa date au plus tard est sa date au plus tôt. La date au plus tard
	est le minimum parmi (date au plus tôt du sommet actuel - coût du prédécesseur).

Exemple
-----------------

=============== =================== ===============
Tâches          Tâches dépendantes  Coût
=============== =================== ===============
A                                   12
B               A                   9
C               A                   5
D               B,C                 4
E               C                   7
=============== =================== ===============

Donne la graphe

.. uml::

		class Début {
			{field} début min: 0
			{method} début max: 0
		}
		class TacheA {
			{field} début min: 0
			{method} début max: 0
		}
		class TacheB {
			{field} début min: 12
			{method} début max: 12
		}
		class TacheC {
			{field} début min: 12
			{method} début max: 13
		}
		class TacheD {
			{field} début min: 21
			{method} début max: 21
		}
		class TacheE {
			{field} début min: 17
			{method} début max: 18
		}
		class Fin {
			{field} début min: 25
			{method} début max: 25
		}

		Début --> TacheA : 0
		TacheA --> TacheB : 12
		TacheA --> TacheC : 12
		TacheB --> TacheD : 9
		TacheC --> TacheD : 5
		TacheC --> TacheE : 5
		TacheD --> Fin : 4
		TacheE --> Fin : 7

		hide class circle

Le chemin critique est A,B,D. On ne doit donc prendre aucun retard sur ces tâches.