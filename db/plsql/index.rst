.. _plsql:

================================
PL/SQL (Procedural Language)
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 12/11/2020}`

Le PL/SQL (PL pour Procedural Language) est un langage complémentaire au SQL
qui ajoute des fonctions appelés procédures, ainsi que des triggers (=déclencheurs).

On vous propose deux cours dans la continuité des concepts généraux proposés
ici pour apprendre l'implémentation dans les SGBD (syntaxe différente)

.. toctree::
	 :maxdepth: 1

		 PL/SQL sous Oracle             <oracle>
		 PL/SQL sous Postgre            <postgre>

1. Vocabulaire
======================

DML (rappel)
	Ordres SELECT, INSERT, UPDATE et DELETE donc les ordres qui manipulent les données.

Les principales utilités du PL/SQL est de

	* créer des **fonctions** appelées **procédures**
		* pour des ordres souvent exécutés
		* pour des ordres complexes
		* pour simplifier/faciliter la manipulation de données
	* créer des **déclencheur** ou **trigger**, c'est-à-dire du code exécuté à chaque ordre DML
		* pour vérifier l'intégrité des données
		* si vous avez des tuples qui ont des attributs dérivés calculés dans la base

Le symbol pour concaténer deux chaines est :code:`||`.

2. La syntaxe des fonctions et procédures
=============================================

.. toctree::
	 :maxdepth: 1

	 Déclaration d'un bloc de code       <plsql/declare>
	 Déclaration des variables           <plsql/variables>
	 Structures (IF, WHILE, ...)         <plsql/structures>
	 Déclaration des curseurs            <plsql/cursor>
	 Déclaration des curseurs (non liés) <plsql/n_cursor>
	 Capturer des exceptions             <plsql/exceptions>

3. Fonctions
===========================

Une fonction est qui ne retourne généralement rien et a pour but de réaliser
une action est appelé procédure et est crée différemment sous oracle.

.. toctree::

	Déclaration de fonctions             <plsql/fonctions>

4. Triggers/Déclencheurs
===========================

L'idée est qu'il y a des événements qui déclenche/trigger votre
déclencheur qui va exécuter une action.

	* Ex : ajout, suppression, update va par exemple trigger la vérification des clef étrangères
	*
		Ex : si vous avez un attribut d dérivée d'un calcul, alors vous pouvez
		faire en sorte qu'a chaque update/insert, d soit recalculé et mis à jour et spécifier comment.
	* Ex: archiver les anciennes données après une suppression

Il existe 3 types de triggers

	* DML : exécuté sur tous les lignes de l'événement
	* DML ligne : exécuté une fois par événement
	* schéma DDL ou base : exécuté une fois

.. toctree::
  :maxdepth: 1

		Déclaration de triggers             <plsql/triggers>

-----

**Crédits**
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.tutorialspoint.com/plsql/index.htm
	* https://pediaa.com/what-is-the-difference-between-procedure-and-function-in-oracle/
	* https://www.guru99.com/subprograms-procedures-functions-pl-sql.html
	* https://www.tutorialspoint.com/postgresql/postgresql_functions.htm