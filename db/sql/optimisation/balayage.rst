=====================================
4.2 Optimiser : balayage
=====================================

La balayage correspond à la façon dont la/les tables et leur tuples sont lus.

	* Full table scan: balayage de toute la table
	* Rowid Scan: accès direct à la ligne (rapide)
	* Index Scan: récupère les données contenues dans l'index
	* Cluster Scan: récupération sous la forme de cluster d'index
	* Hash Cluster Scan: récupération sous la forme d'un hash cluster
	* Sample Table Scan: utilisé lorsque l'opération SAMPLE est utilisée (select * from A SAMPLE BLOCK(1))

.. code:: sql

		--forcer l'utilisation d'un algorithme
		select /*+ FULL(Table)*/ ...
		select /*+ PARALLEL(Table)*/ ...
		select /*+ ORDERED(Table)*/ ...