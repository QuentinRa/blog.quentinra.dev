================================================
Ordonnancement - Méthode Potentiel-tâches
================================================

Dans la méthode Potentiel-tâches, on va construire un graphe
des tâches dans lequel les sommets sont des tâches et les arcs portent
un poids qui est le coût de la tâche.

Chaque sommet aura en plus sa date au plus tôt (donc le coût des tâches dépendantes)
et sa date au plus tard (donc le coût avec un maximum de retard sans retarder le projet).

On ajoute deux sommets : début et fin. Les arcs partant de début vers
les sommets n'ayant pas de tâches antérieures ont pour coût zéro.

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