=====================
Noyau et stabilité
=====================

Stabilité
	Un ensemble stable S est un sous-ensemble tel que les sommets de l'ensemble ne sont jamais
	voisins.

	Stable maximal : on ajoute un sommet et il n'est plus stable

	Stable maximum : on ne peut pas créer d'ensemble S plus grand. On note :math:`\alpha (G) = card(stable\ maximum)`

	Soit h le degré maximal et n le nombre de sommets, :math:`|Stable\ maximal| \ge \lceil \frac{n}{h+1} \rceil`.

Partitionnement
	On peut partitionner un graphe en cliques. Une partition

		* est un ensemble de cliques
		* tous les sommets doivent être dans une clique
		* les sommets doivent être présent dans exactement une clique

	:math:`|S| \le |P|`. Si :math:`|S| = |P|` alors S est stable maximum et P une partition minimum.

Ensemble absorbant
	Une ensemble A absorbant est un ensemble tel que tout sommet qui
	n'est pas dans l'ensemble à un successeur d'un sommet dans A. Donc pour reformuler tous les autres sommets
	qui ne sont pas dans l'ensemble absorbant ont une flèche vers un élément de l'ensemble absorbant.

	:math:`\beta (G) = card(plus\ grand\ ensemble\ absorbant)`

Noyau
	Sous-ensemble stable et absorbant.

	Un graphe peut avoir 0,1 ou plusieurs noyaux.

Fonction de grundy
	Soit un graphe orienté, la fonction de grundy g(v) retourne le plus petit
	entier non attribué aux successeurs de v.

	Tous les sommets ayant comme valeur 0 sont censés composer le noyau (vérifiez!).

	Il est recommandé de partir d'un sommet qui n'a pas de prédécesseur,
	car il fait forcément parti du noyau.