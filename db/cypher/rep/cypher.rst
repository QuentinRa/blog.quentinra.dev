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
	* Ex: ref.attribut <opérateur> valeur (=, !=, <>, >, <, >=, <=, ...) et AND/OR/NOT/IS/XOR
	* attribut IN [valeur, valeur]
	* REGEX (like en sql) : attribut  =~ 'expression régulière'
	* REGEX : attribut STARTS/ENDS WITH ... ou attribut CONTAINS ...
	* LABELS : attribut:label (=table/classe)
	* TYPE : type(attribut) retourne le type d'un attribut ou exists(ref.attribut)
	* RELATION : vous pouvez spécifier une arête comme condition (marche avec NOT/exists/...)

Clause :code:`RETURN`

	* équivalent du Select en SQL
	* prends les attributs a afficher comme ref.* (=tous ceux de ref) ou * (=tous)
	* RETURN attribut AS ...
	* vous pouvez retourner un nœud, une arête
	* vous pouvez retourner le résultat d'un calcul fait dans le RETURN
	* RETURN DISTINCT = pas de doublons

Clause :code:`LIMIT`

	* comme en SQL, limiter le nombre de lignes affichées
	* LIMIT offset, taille : affiche taille éléments depuis offset
	* LIMIT taille

Clause :code:`OPTIONAL MATCH`

	* juste après MATCH et avant WHERE
	* la requête va afficher les MATCH même s'ils ne respectent pas la clause OPTIONAL MATCH
	* Met des valeurs NULL
	* c'est pareil qu'un LEFT OUTER JOIN en SQL

Clause :code:`ORDER BY`

	* comme en SQL, tris des résultats
	* ASC ou DESC ou un/des attribut(s)

Clause :code:`SKIP`

	* permet de sauter les <x> premiers résultats