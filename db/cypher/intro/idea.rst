===================================
1. Introduction - L'idée
===================================

L'idée

	* On a un sommet (dit **nœud**) pour chaque tuple
	* Chaque nœud a des propriétés : attributs
	* Les relations entre chaque nœuds (lien \"clef étrangère\") sont des **arêtes**
	* une table est donc un ensemble de nœuds et d'arêtes

Complément sur les arêtes
***************************

`Les relations entre chaque nœuds (lien \"clef étrangère\") sont des arêtes`

Ex : vous avez une table entreprise et un table salariés,
et sûrement une table "travaille_pour" qui fait le lien entre entreprise et salarié.
Dans ce cas, on créé un nœud pour chaque salarié et un nœud pour l'entreprise et on ajoute une arête avec pour nom travaille_pour.