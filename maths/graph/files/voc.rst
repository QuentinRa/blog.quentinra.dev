====================================================
1. Définitions basiques - Définitions et Notions
====================================================

Adjacent ou Voisins
	On dit que deux sommets sont adjacents s'ils sont reliés par une arête.

	On parle aussi de Voisins d'un sommet X, noté N(X) ou :math:`\Gamma(X)` (Gamma).

	.. note::

		| :math:`N^{+}(X)` signifie les voisins entrants/arrivant sur X.
		| :math:`N^{-}(X)` signifie les voisins sortants.

Degré
	Il s'agit du nombre de voisins d'un sommet.

	* Dans un graphe non orienté, c'est :math:`d(X) = |\Gamma(X)|`.
	*
		Dans un Graphe orienté c'est : :math:`|\Gamma^{+}(X)| + |\Gamma^{-}(X)| = d^+(X) + d^-(X)` soit la
		somme du demi-degré extérieur + demi-degré intérieur.
		On parle de prédécesseur (entrants) et de successeur (sortants).

Incidence
	Une arête est incidente à un sommet si elle est reliée à ce sommet.

Ordre
	L'ordre d'un graphe corresponds au nombre de sommets (E) du graphe soit \|E| ou card(E) ou \#E.