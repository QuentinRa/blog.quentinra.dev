================================
Cypher
================================

.. note::

	Pour faire les exercices, vous aurez besoin d'avoir un compte Neo4J ou d'utiliser
	une alternative qui supporte le Cypher (ex: PHPStorm avec le plugin "Graph Database Console").

	Sur Neo4J, vous allez créer une nouvelle base de données (sandbox/logiciel), la lancer
	et copier le contenu du script de création puis cliquer sur la flèche "run" pour importer
	tous les données. Le script est donné dans le sujet de chaque exercice.

Niveau débutant
***********************

1. Quelques requêtes
------------------------

.. note::

	Fichier de la base : :download:`setup.sql <../../../assets/db/bases/movies.cypher>`

Écrivez les requêtes Cypher qui donnent les résultats suivants.

1. Quels sont tous les noms des Films dans lesquels à joué Meg Ryan ?
2. Quels sont le(s) noms des réalisateur.ice(s) du film \"The Matrix\" ?
3. Quels sont tous les noms des films qui ont été mis en vente entre 1990 et 2000 ?
4. Qui sont les acteurs qui ont joué dans les mêmes films que \"Tom Cruise\" ?
5. Quels sont les personnes qui ont écrit et produit le m^eme film ?
6. Combien y a t-il de personnes qui ont écrit ou produit un film ?
7. Combien d'acteurs sont reliés jusqu à trois degrés à \"Kevin Bacon\" ?
8. Qui sont tous les acteurs directement reliés à \"Kevin Bacon\" ?
9. Qui sont tous les acteurs indirectement reliés à \"Kevin Bacon\" ?
10. Y a t-il des acteurs à strictement plus de 6 degés de séparation de \"Kevin Bacon\" ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<cypher/d1>
	Proposition de correction n°2			<cypher/d2>

| :code:`[TAG] ENSIIE IBD TP4 2020 S1`

-----

**Crédits**
	* Stefania DUMBRAVA (enseignante à l'ENSIIE)