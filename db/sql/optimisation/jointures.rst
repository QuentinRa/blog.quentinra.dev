=====================================
4.3 Optimiser : jointures
=====================================

Vous pouvez choisir l'algorithme de jointure,
certains étant plus efficaces pour certaines requêtes

	* Nested Loop: boucle imbriquée - cout : accès A + (accès B * nombre de lignes de A)
	* Sort Merge Join: tri fusion - cout : accès A et B + cout de la recherche de A et B
	* Hash Join: jointure par hachage - cout : accès B + (accès A * nombre de partition hashées de B)

.. code:: sql

		--forcer l'utilisation d'un algorithme
		select /*+ USE_MERGE(Table colonne)*/ ...
		select /*+ USE_NL(Table colonne)*/ ...
		select /*+ USE_HASH(Table colonne)*/ ...