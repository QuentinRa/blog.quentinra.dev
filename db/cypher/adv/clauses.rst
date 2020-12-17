==================================================================
2. Présentation de Cypher - Requêtes avancées - Clauses avancées
==================================================================

Clause :code:`WITH`

La clause WITH permet de glisser une requête dans une requête,
donc de faire une requête imbriquée dont les résultats du Select
pourront être utilisés par la requête qui a appelé WITH.

La clause WITH est associé a la clause MATCH qui la précède.

.. code:: cypher

	MATCH (p:Person)-[A_COMMANDE]->(o:Objet)
	WITH p, SUM(o.prix) AS prix WHERE p.age < 40 ORDER BY p.nom DESC
	RETURN DISTINCT p