=======================================================
2. Manipulation des tuples - Select et From
=======================================================

La clause select prends une suite d'attributs (* pour tous)
qui seront "affichés". Ce ne sont pas les attributs qui sont affichés
mais en faite pour chaque tuple des tables du from, on ne verra que les
valeurs de ces attributs.

La clause From prends un certains nombre de tables, pour indiquer
d'où viennent les tuples affichés à la fin.

.. code:: sql

	-- un exemple
	SELECT attribut,... FROM table1, ... WHERE Condition;

	--tous les attributs
	SELECT * FROM table1, ... WHERE Condition;

	-- pas de doublons
	SELECT DISTINCT * FROM table1, ... WHERE Condition;

	-- certaines tables peuvent avoir des attributs ayant le même nom,
	-- il faut alors spécifier la table devant l'attribut
	SELECT table1.attribut,... FROM table1, ... WHERE Condition;

	-- met la table dans une variable
	SELECT t1.attribut,... FROM table1 t1, ... WHERE Condition;

	-- il est possible de renommer un attribut lors de son affichage
	-- dans le résultat de la requête
	SELECT attribut as "nom_affiché",... FROM table1 t1, ... WHERE Condition;

	-- sélectionner un attribut "invalide"
	Select `date`,... FROM table1 t1, ... WHERE Condition;