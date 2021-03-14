.. _pert:

===========================================
8. Ordonnancement - Méthode P.E.R.T.
===========================================

Dans la méthode PERT, nous allons construire un graphe
tel que les sommets sont les états du projet, et les tâches
sont des arcs qui font passer le projet d'un état à un autre,
après une certaine durée.

Chaque sommet aura en plus sa date au plus tôt (donc le coût des tâches dépendantes)
et sa date au plus tard (donc le coût avec un maximum de retard sans retarder le projet).

L'état début est l'état initial, l'état fin est l'état final.

Un arc (a,b) est en pointillés avec un cout de 0 si pour entrer dans l'état b il faut d'abord
avoir passé l'état a. Cela nous permet de représenter les états dépendant de plusieurs tâches.

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
		class 1 {
			{field} début min: 12
			{method} début max: 12
		}
		class 2 {
			{field} début min: 21
			{method} début max: 21
		}
		class 3 {
			{field} début min: 17
			{method} début max: 18
		}
		class Fin {
			{field} début min: 25
			{method} début max: 25
		}

		Début --> 1 : A(12)
		1 --> 2 : B(9)
		1 --> 3 : C(5)
		3 ..> 2 : 0
		2 --> Fin : D(4)
		3 --> Fin : E(7)

		hide class circle