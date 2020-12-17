================================================================
2. Présentation de Cypher - Requêtes Cypher
================================================================

**Création d'un nœud/une arête**

.. code:: cypher

	; nœud
	CREATE (john:Person {name: "John"})
	CREATE (maria:Person {name: "Maria"})
	; arête
	CREATE (maria)-[:FRIEND]->(john)-[:FRIEND]->(maria)

Il est possible de faire un CREATE ... RETURN ... pour afficher les nœud/arêtes
crées. Et il est également possible de faire un MATCH - CREATE pour associer
des nœud existant au nouveau nœud.

.. code:: cypher

	MATCH (john:Person{name: "John"})
	CREATE (maria)-[:FRIEND]->(john)-[:FRIEND]->(maria)

**Mise à jour d'un nœud/une arête**

Il faut sélectionner les lignes a mettre a jour avec MATCH
et WHERE et définir comme en SQL avec SET les nouvelles valeurs

.. code:: cypher

	MATCH (p:Person)
	SET p.age=p.age*10
	RETURN p

**Suppression à jour d'un nœud/une arête**

On utilise la clause REMOVE pour supprimer des attributs.
On utilisera DELETE pour supprimer des arêtes et DETACH DELETE pour
supprimer toutes les arêtes d'un nœud et le nœud.

.. code:: cypher

	MATCH (p: Person)
	REMOVE p.adresse
	RETURN p

	MATCH (p: Person)
	DELETE p ; suppression des arêtes

	MATCH (p: Person)
	DETACH DELETE p ; supprime arêtes et noeuds

