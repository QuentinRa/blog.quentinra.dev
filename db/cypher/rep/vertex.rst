================================================================
2. Présentation de Cypher - Représentation d'une arête
================================================================

On va avoir pour chaque tuple (relationnel), un nœud a créer noté
:code:`ref1-[(ref: nom{attribut: valeur, ...})]->ref2`.

	* ref, nom, ... ont la même signification que pour les nœuds, il s'agit des infos dans la classe d'association
	* ref1 et ref2 sont les références de 2 nœuds

Notes

	* :code:`--` : arête anonyme sans direction
	* :code:`-->` : arête anonyme avec direction
	* :code:`-[:nom]->` : arête nom avec direction
	* :code:`-[:nom {attribut:valeur}]->` : arête nom avec 1 attribut avec direction
	* on a 0 ou ref1, ref2 pas l'un des deux ou plus (donc pas ref1 --> ref2,ref3 ni ref1 --> <rien>)
	* Pour une association n-aire, on créé n nœud et 1 pour l'association qu'on relie aux n nœuds.