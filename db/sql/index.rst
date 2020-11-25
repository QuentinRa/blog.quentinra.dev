.. _sql:

================================
SQL (Structured Query Language)
================================

| :math:`\color{grey}{Version \ 1.3.7}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/11/2020}`

Le SQL est un language permettant d'accéder à une base de données (BD ou DB).

Il est possible de simplifier la gestion d'une base de données ou d'ajouter
des nouveaux usages avec le PL/SQL (:ref:`plsql`), une extension du SQL.

.. note::

	Dans la continuité de ce cours, vous pouvez en apprendre plus
	sur ce cours dans la partie avancée (:ref:`sql_advanced`).

	Le cours :ref:`relation` introduit les étapes pour concevoir une base de données
	depuis des spécifications.

1. Vocabulaire et syntaxe basique
=========================================

1.1 Le Vocab' à savoir
-----------------------------

SGBD
	Système de gestion de base de données. Il s'agit d'un outils
	gérant vos bases de données.

	Quelques SGBD : :code:`mariaDB`, :code:`Oracle`, :code:`postgreSQL`,
	:code:`mysql`, :code:`sqlite`.

Base de données (relationnelle)
	Une base de données est composées de tables (implémentation d'une classe)
	contenant des **tuples**/lignes (implémentation d'un objet).

	Vous avez un cours ici sur la :ref:`relation`.

Schéma (compliqué mais important)
	Un schéma est un ensemble d'informations, classés dans une table.

	Le schéma d'un utilisateur regroupe ses tables, ses vues, ses contraintes.

	Le schéma d'une requête c'est les tables récupérés, les attributs sélectionnés

	Le schéma d'une base de données (INFORMATION_SCHEMA) est le catalogue de la base, il contient les tables
	(TABLES), les utilisateurs (USERS), les attributs (COLUMNS/DOMAINS), les contraintes (CHECK_CONSTRAINTS) etc...

	Pour appeler une table d’un schéma on fait : schema.table.

SQL-89 et SQL-92
	Toutes les bases sont généralement dans une version qui supporte le SQL-92,
	cependant certaines sont encore en SQL-89, donc vous devrez apprendre les quelques
	différences et savoir faire les deux.

Clef et Clef étrangère
	Une clef (dite clef primaire ou primary key) est un attribut ou un ensemble d'attributs qui sont uniques et non nulls.

	Une clef étrangère (dite foreign key) est un attribut ou un groupe d'attributs qui pointent sur les clefs d'une autre relation.

Table
	Une table est la représentation d'une relation (voir :ref:`relation`). Elle possède des attributs
	qui sont ses colonnes.

	Les lignes sont appelées tuples (ou enregistrement), il s'agit des valeurs prises par les attributs.

	Par exemple une relation viticulteur(#n_viticulteur:number, nom:varchar, prenom:varchar, v_ville:varchar) donne la table suivante

	.. image:: /assets/db/sql/table.png

1.2 Comment ça marche
-----------------------------

Une requête SQL est de la forme :

.. code:: sql

	-- ceci est un commentaire
	Select * from table where attr=v;

Cette requêtes affiche pour chacune des lignes de table (from table) pour lesquelles
l'attribut attr de table (donc table.attr) à pour valeur v, les valeurs de tous (*) les
attributs de cette ligne (testez sur `w3school/select <https://www.w3schools.com/sql/sql_select.asp>`_
si vous comprenez pas).

.. note::

	Les mots clefs Select, From, ... peuvent être écrits en minuscules ou en majuscules.

	une requête finie toujours par un ; (sauf si elle est simple, mais mettez le tout le temps)

1.3 Les petits trucs à savoir
-------------------------------

La concaténation en SQL se fait avec :code:`||` (surprise !).

L'assignation en SQL se fait avec :code:`:=` (ou = mais vous étonnez pas si vous voyez ça).

Le modulo en SQL se fait avec :code:`MOD(x,y)`.

Vous pouvez extraire un élément d'une date/timestamp avec :code:`EXTRACT(element from attribut)`
avec element : YEAR, MONTH, DAY, MICROSECOND, SECOND, MINUTE, HOUR.

On utilise généralement :code:`\ ` (backslash) pour échapper un caractère mais dès fois
on doit utiliser un :code:`'` (single quote) (à vous de tester !).

Si votre nom de table ou d'attribut réservé (par exemple appeler un attribut
date alors que c'est déjà un type), vous devrez empêcher son interprétation avec \`nom invalide\` (quotes obliques).

Vous pouvez extraire des caractères d'un texte avec :code:`LEFT(attribut, taille)` (ou RIGHT en partant de la droite).

Liste complète : `SQL Server Functions <https://www.w3schools.com/SQL/sql_ref_sqlserver.asp>`_.

Les types sont

=============================== ========================================================================================
Type                            Description
=============================== ========================================================================================
varchar(n)                      chaine de caractères de taille maximum n
int/number ou int(n)            un entier (si n alors n chiffres, 11 par défaut, int(0) = booléen)
text                            chaine de caractères de taille infinie
float ou real                   un réel
decimal(n,p)                    chiffre de taille n dont p chiffres après la virgule
date                            contient une date
enum(...)                       ne peux prendre que l'un des valeurs ...
=============================== ========================================================================================

2. Manipulation des tuples
=========================================

Manipuler des tuples consistes à

	* sélectionner des tuples : SELECT, FROM (dit projection)
	* restreindre selon une condition : Where (dit restriction)
	* ajouter/mettre à jour/supprimer des tuples : Insert, Update, Delete

Pour éviter de surcharger cette page (car c'est long), les explications sont sur d'autres pages.

.. toctree::
    :maxdepth: 1

		Select et FROM            <manipulation/projection>
		Where                     <manipulation/restriction>
		Insert, Update, Delete    <manipulation/update>
		Gérer les résultats       <manipulation/order>
		Opérations ensemblistes   <manipulation/ensembles>

3. Jointures
=========================================

Imaginez deux tables, dans lesquelles vous avez un attribut qui à la même valeur
dans deux chacun des deux. Vous pouvez joindre les deux tables sur cet attribut :
c'est ce qu'on appelle une jointure.

En relation, ça donne :

	* personne(id_personne, nom, prénom)
	* commande(id_commande, id_personne, description)
	*
		jointure sur id_personne nous donne pour chaque commande, le nom et prénom de la personne (et inversement) :
		pXc(id_commande, description, id_personne, nom, prénom).

Jointure Naturelle
	N'existe que depuis SQL-92. Fait une jointure sur TOUTES les colonnes ayant le même nom.

	.. code:: sql

		-- SQL 92
		[...] FROM R1 NATURAL JOIN R2 [...]

		-- équivalent SQL 89
		[...] FROM R1, R2 WHERE R1.attribut=R2.attribut [...]

Jointure sur un attribut
	.. code:: sql

		-- équi-jointure (attribut) : on spécifie sur quel attribut on fait la jointure
		[...] FROM R1 JOIN R2 USING(attribut) [...]

		-- équi-jointure (critère) : on spécifie la condition de jointure dans le FROM
		[...] FROM R1 JOIN R2 ON R1.attribut=R2.attribut

Jointures externes
	Les jointures externent affichent quand même les tuples qui n'ont pas de correspondant
	dans l'un des deux tables (ou les deux)

	.. code:: sql

			-- externe gauche : les valeurs de l’attribut2 peuvent être nulles
			FROM R1 LEFT OUTER JOIN R2 ON R1.att1 = R2.att2

			-- externe droite : les valeurs de l’attribut1 peuvent être nulles
			FROM R1 RIGHT OUTER JOIN R2 ON R1.att1 = R2.att2

			-- externe : les valeurs de attribut1 ou attribut2 peuvent être nulles
			FROM R1 FULL OUTER JOIN R2 ON R1.att1 = R2.att2

.. warning::

	Si une jointure échoue, le produit cartésien est fait à la place.

4. Calculs
=========================================

Il est possible d'effectuer des calculs dans la clause :code:`select`
(et donc le résultat sera retourné) ou alors dans la clause :code:`HAVING`
(qui est comme le clause where et va retirer les résultats pour lequel le calcul n'est pas valide).

.. code:: sql

		// Renvoi la somme des valeurs prises par attribut
		Select SUM (qualificatif nom_attribut) ...
		// Renvoi la moyenne des valeurs prises par attribut
		Select  AVG (qualificatif nom_attribut) ...
		// Renvoi la moyenne des valeurs prises par attribut
		Select  MAX(nom_attribut) ...
		// Renvoi la moyenne des valeurs prises par attribut
		Select  MIN(nom_attribut) ...
		// Renvoi la moyenne des valeurs prises par attribut
		Select  Count(qualificatif nom_attribut) ...

Les qualificatifs sont :

	*	ALL = tous
	*	DISTINCT = sans doublons
	*	\* = tous y compris les valeurs nulles. (->pas besoin de nom attribut)

.. code:: sql

	Select attribut, SUM(DISTINCT attribut2) -- ici les deux colonnes seront attribut et sum
	FROM ... WHERE ...
	GROUP BY attribut -- crée des groupes, ceux ayant la même valeur dans attribut sont ensembles
	HAVING MAX(attribut2) > 10; -- le calcul de having est fait sur les groupes

Group By ?
	HAVING Fait des opérations sur des groupes, donc nécessite une clause appelée GROUP BY.

	La clause Group by attr1, ... partitionne les résultats tel que les tuples dans chaque
	partition aient la même valeur dans les attributs attr1, ...

	Ainsi, si vous faites HAVING count(*) > 3, vous n'affichez que les partition qui
	ont plus de 3 éléments !

	.. danger::

		Les valeurs données à Group by (attr1, ...) doivent forcément être dans le select.

5. Gestion des table
=========================================

Une base de données est composées de tables
qui ont comme propriétés des attributs. Chaque attribut à un type et des contraintes.

	*	Vous pouvez créer une table avec : CREATE TABLE
	*	Vous pouvez modifier une table avec : ALTER TABLE
	*	Vous pouvez supprimer une table avec : DROP TABLE

Les explications sont ici :

.. toctree::
    :maxdepth: 1

		Creation de tables                      <tables/create>
		Modification et Suppression de tables   <tables/alter>

6. Création d'utilisateurs
=========================================

Le tout premier utilisateur de votre base de données est
souvent :code:`root:aucun mot de passe` (il est recommandé de le désactiver
pour des raisons de sécurité).

	* Vous pouvez créer des utilisateurs avec : CREATE USER
	* Vous pouvez supprimer des utilisateurs avec : DROP USER
	* Vous pouvez gérer les droits des utilisateurs avec : GRANT et REVOKE

Il est possible de créer des rôles, c'est à dire que si vous êtes dans un cas
où les utilisateurs de votre base de données font partie de groupe (client, admins, ...)
alors vous pouvez créer un rôle, donner des permissions au rôle et enfin donner le rôle au utilisateurs.

Les explications sont ici :

.. toctree::
    :maxdepth: 1

		Creation et Suppression d'utilisateurs   <users/create>
		Gestion des permissions                  <users/perms>
		Manipulation des rôles                   <users/roles>

7. Transactions
=========================================

Certaines requêtes SQL peuvent nécessiter d’autres requêtes pour être « valident » dans la base
(par exemple un insert d'une table à besoin d'un insert dans un autre table).

On utilise une transaction pour envoyer ces requêtes liées ensembles.

.. code:: sql

		-- Instructions select:
		set transaction read only /*code*/
		set transaction read committed /*code*/
		-- interdit le chevauchement, exécute tout à la suite
		set transaction serializable;
		-- Instruction update/insert/delete...:
		set transaction read write /*code/

On peut annuler une transaction avec ROLLBACK ou la valider avec COMMIT.

8. Vues
===========================

Pour donner la permissions de voir/modifier... certains champs par des utilisateurs
ou pour faciliter des accès, on crée un table fictive : une vue.

La table fonctionne ensuite comme une table normale cependant certaines insertions
peuvent échouer s’il nous manque les clés dans les attributs.

LES VUES AVEC UN CALCUL/GROUP BY ne peuvent pas être mises à jour.

.. code:: sql

		-- Création d'une vue
		CREATE VIEW nomVue [Attributs] AS requêteSQL
		-- regarde delete/update possible avant de le faire.
		CREATE VIEW nomVue [ Attributs ] AS requêteSQL WITH CHECK OPTION
		-- supprimer
		DROP VIEW nom_vue;

9. Exercices
==============

.. danger::

	Les exercices vous demandent généralement de faire des requêtes donc dans
	une base de données, sur un paquet de données.

	Chaque exercice vous fournit un fichier :code:`setup.sql` qui est à importer
	dans votre base de données dans une base nommée comme vous voulez

	Si vous n'avez pas de base de données sous la main, allez sur
	`sqliteonline.com <https://sqliteonline.com/>`_ et importez le fichier :code:`setup.sql`
	dans une base de données mariadb.

.. toctree::
    :name: exercices
    :maxdepth: 1

		Commandes générales            <exercices/general>
		Jointures				               <exercices/jointures>
		Calculs                        <exercices/calculs>
		Création de tables et vue      <exercices/create>
		Insert, Update, Delete         <exercices/dml>
		Utilisateurs                   <exercices/user>
		Non triés                      <exercices/non_rank>

Dans la continuité du cours

.. toctree::

		SQL (Structured Query Language) - avancé    <advanced>

-----

**Crédits**
	* Régine LALEAU (enseignant à l'IUT de Sénart-Fontainebleau)
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Julien FOREST (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.guru99.com/sql-commands-dbms-query.html
	* https://www.w3schools.com/sql/
	* https://www.w3schools.com/SQL/sql_ref_sqlserver.asp
	* https://www.geeksforgeeks.org/sql-creating-roles/
	* https://mariadb.com/kb/en/