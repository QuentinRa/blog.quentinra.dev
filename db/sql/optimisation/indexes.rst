=====================================
4.4 Optimiser : indexes
=====================================

Vous pouvez choisir l'algorithme d'indexation (donc comment on récupère
les données), certains étant plus efficaces pour certaines requêtes.

	* b-tree: temps de recherche toujours le même, rowid, log(n)
	* bitmap: colonnes non discriminates, associe à chaque ligne un booléen ( (1,0,0) = ligne 1 ok uniquement )
	* reverse key: Clés inversées, clef adjacentes sont séparées
	* function: ...
	* unique: colonne unique
	* composite: ...

.. code:: sql

		--création
		create bitmap|unique|... index nom on table (colonne1,colonne 2,...);
		--index sur l'addition de colonne 1 et 2
		create bitmap|unique|... index nom on table (colonne1 + colonne 2);

		--forcer l'utilisation d'un index
		select /*+ INDEX(Table index)*/ ...
		select /*+ NO_INDEX(Table index)*/ ...

