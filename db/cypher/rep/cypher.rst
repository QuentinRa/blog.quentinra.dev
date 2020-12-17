================================================================
2. Présentation de Cypher - Requêtes Cypher
================================================================

Une requête Cypher est de la forme

.. code:: cypher

	MATCH (ref:nœud)
	WHERE condition
	RETURN ref.attribut
	LIMIT valeur;

Clause :code:`MATCH`

	* on lui donne le nom dont on veut l'attribut
	* on peut donner des nœuds simples (a), avec nom (ref:nœud)
	* on peut donner des nœuds liés : (ref:nœud)-[:LIEN]->(ref:nœud) (:code:`jointure sql`)
	* des relations : (a)-[r]->b avec r : \*j, \*i..j, \*..j, \*
	* on peut mettre des propriétés du nœud qui auront le même effet qu'un where

Clause :code:`WHERE`

	* comme en SQL
	* Ex: ref.attribut <opérateur> valeur (=, !=, <>, >, <, >=, <=, ...)

Clause :code:`RETURN`

	* équivalent du Select en SQL
	* prends les attributs a afficher comme ref.* (=tous ceux de ref)
	* RETURN AS ...

Clause :code:`LIMIT`

	* comme en SQL, limiter le nombre de lignes affichées
	* LIMIT offset, taille : affiche taille éléments depuis offset
	* LIMIT taille

Clause :code:`OPTIONAL MATCH`

	* juste après MATCH et avant WHERE
	* la requête va afficher les MATCH même s'ils ne respectent pas la clause OPTIONAL MATCH
	* Met des valeurs NULL
	* c'est pareil qu'un LEFT OUTER JOIN en SQL