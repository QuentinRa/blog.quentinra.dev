.. _graph:

Théorie des graphes
================================

Graphe
	On note G(V,E) un graphe composé de d'un ensemble arêtes V (vertices)
	et d'un ensemble de sommets E (edges).

	On note une arête A, B : [A,B]

	Graphe Orienté (GO)
		Il s'agit d'un graphe dans lequel les arêtes on un sens.

		On ne parle plus d'arêtes mais d'arc.
		On représente l'arc A, B: (A, B)

L'ordre d'un graphe corresponds au nombre de sommets (E) du graphe soit \|E| ou card(E) ou \#E.

1. Définitions
********************************

Adjacent ou Voisins
	On dit que deux sommets sont adjacents s'ils sont reliés par une arête.

	On parle aussi de Voisins d'un sommet X, noté N(X) ou :math:`\Gamma(X)` (Gamma).

	.. note::

		| :math:`N^{+}(X)` signifie les voisins entrants/arrivant sur X.
		| :math:`N^{-}(X)` signifie les voisins sortants.

Degré
	Il s'agit du nombre de voisins.

	* Dans un graphe non orienté, c'est :math:`d(X) = |\Gamma(X)|`.
	*
		Dans un Graphe orienté c'est : :math:`|\Gamma^{+}(X)| + |\Gamma^{-}(X)| = d^+(X) + d^-(X)` soit la
		somme du demi-degré extérieur + demi-degré intérieur.
		On parle de prédécesseur (entrants) et de successeur (sortants).

Incidence
	Une arête est incidente à un sommet si elle est reliée à ce sommet.

Graphes particuliers
		==================== ====================
		Graphe non orienté   Graphe orienté
		==================== ====================
		Chaine								Chemin
		Cycle						      Circuit
		Étoile						    Étoile
		Roue						      Roue
		==================== ====================

	.. note::

		Il existe également :

			* les graphes dit k-régulier : tous les sommets sont de degré k
			* les graphes complets : chaque sommet est adjacent à tous les autres (:math:`|V| = \frac{n(n-1)}{2}`)
			*
				les graphes bi-parti : les sommets sont classé en deux groupes, ceux d'un degré = a et ceux
				d'un degré=b (:math:`b > a \ge 1`).


2. Propriétés complexes
********************************

2.1 Sous-Graphe
---------------------------------------

Sous-graphe (dit sous-graphe induit)
	G' est un sous-graphe de G si et seulement si il a été obtenu

		* en ne supprimant que des sommets de G
		* en ne supprimant que les arrêtes liées/incidentes au sommets supprimés

2.2 Connexité et forte connexité
---------------------------------------

Connexe
	Un graphe est connexe s'il est composé d'une seule composante connexe.

Composante connexe
	Une composante connexe est un sous-graphe dans lequel on a un chemin qui passe par tous les sommets.

	.. warning::

		Une composante connexe est maximale c'est à dire qu'on ne peux pas ajouter un autre sommet
		et toujours obtenir un chemin.

	Algorithme

	.. code-block::

		On part d'un sommet choisi.
		Soit Ci la composante connexe i et i = 0.

		Tant qu'il reste des sommets

			On ajoute notre sommet dans Ci.
			Tant qu'un sommet dans Ci à des voisins qui ne sont pas dans Ci, alors on les mets.

		i=i+1

Forté connexité (f-connexe)
	Un graphe est dit fortement connexe lorsqu'il est possible depuis chaque sommet d'atteindre
	n'importe quel autre.

	Algorithme

	.. code-block::

		On prends un sommet au hasard et on le marque + et -.

		On marque tous ses ses successeurs (partent) par +, tant que c'est possible.

		On note tous ses prédécesseurs (arrivent) par -, tant que c'est possible.

		Tous les sommets marqués par + et - forment une composante fortement connexe. Si tous les sommets
		sont dans la composante fortement connexe, alors le graphe est connexe.

	.. note::

		Une composante fortement connexe est un sous-graphe maximal fortement-connexe

Graphe réduit
	Il s'agit d'un graphe, dont les sommets sont les composantes fortement connexes
	d'un graphe

Isthme
	On appelle isthme une arrête telle que la retirer rends le graphe non connexe.

2.3 Fermeture Transitive et Graphe partiel
--------------------------------------------------

Fermeture transitive (noté :math:`\tau` (tau))
	Il s'agit d'ajouter toutes les arrêtes qui peuvent être obtenues par transitivité.
	Donc si on a A vers B et A vers C alors on ajoute une arrête A vers C.

	Algorithme de Roy-Warshall (on considère les arc comme étant des arêtes)

		.. code-block::

			On commence à un sommet A
			Pour tout sommet, on relie les prédécesseur aux successeurs

Graphe partiel
	Un graphe partiel est un graphe dans quel on a retiré des arrêtes.

:math:`\tau`-équivalent
	Deux graphes G et G' sont :math:`\tau`-équivalents s'ils ont la même fermeture transitive et
	que G' est un sous-graphe de G.

:math:`\tau`-minimal :math:`\tau`-équivalent
	Il s'agit d'un graphe :math:`\tau`-équivalent tel que retire une arête fait qu'il n'est plus
	:math:`\tau`-équivalent.

:math:`\tau`-minimum :math:`\tau`-équivalent
	Il s'agit d'un graphe :math:`\tau`-minimal :math:`\tau`-équivalent avec le minimum d'arcs

2.4 Matrices d'adjacence et Matrice d'incidence
--------------------------------------------------

Matrices d'adjacence
	Il s'agit d'une matrice Sommet*Sommet (départ->arrivé dans un GO) dans laquelle on met un 1 s'il existe un arrête
	entre deux sommets, 0 sinon.

	.. note::

		Dans un GNO, la matrice est symétrique.

Matrice d'incidence
	Sur le même principe que la matrice d'adjacence, dans un Graphe orienté, il se peut qu'on veuille savoir si l'arrête
	est entrante ou sortante : on met -1 si sortant, 1 si entrant et 0 sinon.

3. Tris et parcours
********************************

3.1 Tri Topologique
---------------------------------------

Tri Topologique
	Il s'agit d'un ordre dans lequel chaque sommet est avant ses successeurs.

	Donc on commence avec les sommets qui n'ont pas de prédécesseurs, puis on les retires
	ainsi que leur arrêtes, et on recommence.

3.2 Parcours en profondeur
---------------------------------------

Parcours en profondeur (DFS : depth-first search)

	.. code-block::

		1: On prends un sommet au hasard, on l'empile.
		2: On prends un voisin, on l'empile tant que possible.
		3: On marque le sommet bloquant "fini", on recommence avec 2: si possible
			sinon on fait 3:

3.1 Parcours en largeur
---------------------------------------

Parcours en largeur (BFS : breadth-first search)

4. Graphes eulérien et graphes hamiltoniens
**********************************************

4.1 Graphes eulérien
---------------------------------------

Graphes eulérien
	Un graphe est eulérien s’il est connexe et tous ses sommets sont de degré pair.
	Un graphe est eulérien s'il possède un cycle eulérien.

Cycle eulérien
	On passe une seule et unique fois par chaque arrête

Chaine eulérienne ou Cycle semi-eulérienne
	C'est un chaine qui passe par toutes les arrêtes une et une seule fois

	Un graphe est semi-eulérien s’il est connexe et que tous sauf 2 des sommets sont de degré pair.

	.. note::

		Il est dit "semi" eulérien car ajouter une arête le rends eulérien

Algorithme

	.. code-block::

		Prends un sommet au hasard.
		Tant qu'une arrête n'est pas un isthme et qu'il nous reste des arêtes à parcourir
			Ajoute à G l'arête parcourue
		G contient un cycle/une chaine eulérienne (en fonction de si sommet départ=sommet d'arrivée)

* Rappel: un isthme est une arête qui rends un graphe connexe non connexe si elle est retirée.

4.2 Graphes hamiltoniens
---------------------------------------

|

------

Crédits
	| Jérémy POSSAMAÏ (enseignant à l'IUT de Sénart-Fontainebleau)
	| Massimissa MERABET (enseignant à l'ENSIIE)

Sources
	| https://fr.wikipedia.org/wiki/Lexique_de_la_th%C3%A9orie_des_graphes
	| http://atomurl.net/math/
	| https://fr.wikiversity.org/wiki/Th%C3%A9orie_des_graphes/Propri%C3%A9t%C3%A9s
	| https://fr.wikipedia.org/wiki/Tri_topologique
	| https://fr.wikipedia.org/wiki/Graphe_eul%C3%A9rien