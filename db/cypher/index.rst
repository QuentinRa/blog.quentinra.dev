.. _cypher:

================================
Bases de données Graphes
================================

| :math:`\color{grey}{Version \ 0.1.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 12/12/2020}`

1. Introduction
===================================

Une nouveau type de base de données autre que relationnelles apparu vers 2010
sont les bases de données "graphes".

Elles ont étés introduites par/pour les entreprises
comme Google, Facebook, Twitter, ... pour pouvoir gérer plus facilement des données
complexes et différentes (hétérogènes).

On parle de :code:`NOSQL` (NotOnlySQL) pour pas seulement SQL car il s'agit d'un ajout ou d'une surcouche
qui complète les SGBD relationnels.

.. toctree::
	 :maxdepth: 1

		Les points clefs         <intro/key>
		L'idée                   <intro/idea>

Motifs graphe
	Il s'agit d'une règle, par exemple x-motif->y. On liste toutes les arêtes avec leurs valuations en on obtient
	un ensemble avec toutes les valeurs x et leur y associé qui correspondent a la règle. Apparement c'est utile pour
	faire des recherches.

**Nous allons utiliser Neo4J et son langage : Cypher dans ce cours.**

2. Présentation de Cypher
==================================

...

-----

**Crédits**
	* Stefania DUMBRAVA (enseignant à l'ENSIIE)
	* Cypher Neo4J Doc (https://neo4j.com/developer/cypher/)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Base_de_donn%C3%A9es_orient%C3%A9e_graphe