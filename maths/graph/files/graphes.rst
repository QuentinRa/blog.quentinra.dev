====================================================
1. Définitions basiques - Graphes particuliers
====================================================

==================== ==================== ==================================================
Graphe non orienté   Graphe orienté       Description
==================== ==================== ==================================================
Chaine               Chemin               Chaque sommets est de degré 2 sauf les extrémités
Cycle                Circuit              Tous les sommets sont de degré 2
Étoile               Étoile               Un sommet de degré \|E\|-1 et les autres de degré 1
Roue                 Roue                 Tous les sommets de degré 3 sauf 1 de degré \|E\|-1
==================== ==================== ==================================================

Cycle, Chaines élémentaires
	On dit qu'une chaine ou un cycle est élémentaire si on passe 1 seule fois
	par chaque sommet.

Graphes réguliers
		Les graphes dit k-régulier sont des graphes pour lesquels tous les sommets sont de degré k.

Graphe complet
		Un graphe complet est un graphe dans lequel chaque sommet est adjacent à tous les autres
		(:math:`|V| = \frac{n(n-1)}{2}`).

Graphe bi-parti
		les graphes bi-parti : les sommets sont classé en deux groupes/ensembles, ceux d'un degré = a et ceux
		d'un degré=b (:math:`b > a \ge 1`) tel que tous les sommets du premier ensemble ont  a arêtes
		vers ceux du 2e et ceux du 2e ont b arêtes vers ceux du premier.

Sous-graphe (dit sous-graphe induit)
	G' est un sous-graphe de G si et seulement si il a été obtenu

		* en ne supprimant que des sommets de G
		* en ne supprimant que les arrêtes liées/incidentes au sommets supprimés

Clique
	Une clique est un sous-graphe complet.

Complémentaire
	Le complémentaire d'un Graphe G est un graphe G' dans lequel les arêtes
	sont inversées.