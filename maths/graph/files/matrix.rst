====================================================
2. Définitions avancées - Matrices
====================================================

Matrices d'adjacence
	Il s'agit d'une matrice Sommet*Sommet (départ->arrivé dans un GO) dans laquelle on met un 1 s'il existe un arrête
	entre deux sommets, 0 sinon.

	.. note::

		Dans un GNO, la matrice est symétrique.

Matrice d'incidence
	Sur le même principe que la matrice d'adjacence, dans un Graphe orienté, il se peut qu'on veuille savoir si l'arrête
	est entrante ou sortante : on met -1 si sortant, 1 si entrant et 0 sinon.