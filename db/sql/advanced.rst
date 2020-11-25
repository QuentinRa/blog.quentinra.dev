.. _sql_advanced:

==========================================
SQL (Structured Query Language) - avancé
==========================================

| :math:`\color{grey}{Version \ 1.1.4}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/11/2020}`

.. danger::

	Ce cours contient des connaissances avancées en SQL, qui ne vous seront
	généralement utile que pour une utilisation très poussée du SQL (:ref:`sql`).

1. Vocabulaire des pros
=========================================

Vous pouvez pas ne pas savoir les termes suivants.

DML, DDL, DCL
	Pour votre culture,

		* DML = Data Manipulation donc Select, Insert, Update et Delete
		* DDL = Data Definition donc Create, Alter, Drop
		* DCL = Data control donc Grant, Revoke

Ordre des requêtes
	Les requêtes SQL sont fait dans un ordre qui n'est pas logique :
	From -> Where -> GROUP BY -> HAVING -> Select -> Order by.

2. Triggers/Déclencheurs SQL
=========================================

Les triggers/déclencheurs SQL permettent de bloquer des opérations
qui pourraient compromettre vos données.

Par exemple, vous avez une clef étrangère dans une table B qui pointe sur la clef
d'une Table A. Si la table A est supprimée, alors votre clef étrangère n'est plus valide,
ce qui plonge votre base de données dans un état compromis.

Dans la partie :ref:`sql_table_create`, vous pouvez voir que l'on peut placer des
contraintes sur les attributs. La contrainte est vérifiée :

	* à chaque update : NOT DEFERRABLE
	* au commit ou à l’execution (liste set constraint) : DEFERRABLE

Vous pouvez définir des contraintes comme DEFERRED ou IMMEDIATE avec
:code:`SET CONSTRAINT {ALL/LISTE NOMS} {IMMEDIATE/DEFERRED]`.

Enfin, après avoir ajouté des contraints, vous pouvez ajouter une action au trigger parmi

	* CASCADE : propage suppression/mise à jour
	* set default : prends sa valeur par défaut si disponible
	* set null : met la clé étrangère à NULL

Pour les clefs étrangères, on ferait FOREIGN KEY() REFERENCES ... ON DELETE (ou UPDATE) set null/... .

3. Optimisation
=========================================

Il existe déjà un optimiseur SQL qui sert à réduire le temps et le nombre d'accès disque fait
par une requête mais il choisit le bon algorithme que dans 95% des cas.

Voici les commandes a faire autour de :code:`requête_sql` pour observer
son exécution.

.. code:: sql

		--oracle
		set timing on; --temps d'exécution
		set autotrace on; --pile (opérations, tris, ....)
		requête_sql

		--autres
		explain plan for requête_sql ;
		select * from table(dbms_xplan.display());

		--collecter des données
		analyze table nom_table compute statistics;

Sous oracle, la colonne cout contient la cout de l'algorithme. Tous les couts des algorithme sont comparés
et celui avec le plus faible est utilisé.

La colonne time contient le temps estimé pour réaliser l'opération.

Il faut exécuter deux fois la commande, pour supprimer/mettre à 1 la ligne 'recursive calls'
car sinon les données sont faussées.

Les tris sur les disques sont couteux donc éviter d'en avoir.

.. toctree::
    :maxdepth: 1

		Optimiser sa requête      <optimisation/opt>
		Optimiser : balayage      <optimisation/balayage>
		Optimiser : jointures     <optimisation/jointures>
		Optimiser : indexes       <optimisation/indexes>

4. Gestion de la mémoire secondaire
=========================================

Une base de donnée utilise/interagit avec 3 types de mémoire

	* Centrale : ram
	* Secondaire : disque
	* Tertiaire : bande/disque optique

Définitions

	* Enregistrement/Record : ensembles des informations correspondant à un tuple.
	* Organisation de Fichiers : organisation des enregistrement sur disque (séquentielle, indexée ~ 90% des cas, hachage)
	* Méthode d'accès : méthode pour accéder efficacement aux enregistrements
	* blocs/pages : unité d'échange entre la mémoire secondaire et la mémoire principale. Leur taille est fixe (512-8192 octets, 3~20 msec en moyenne de temps pour y accéder)

Les différentes gestions :

.. toctree::
    :maxdepth: 1

		Organisation séquentielle                        <gestion/sequence>
		Organisation Indexée : dense                     <gestion/dense>
		Organisation Indexée : non dense ou creux        <gestion/creux>
		Organisation Indexée : secondaire ou non plaçant <gestion/secondaire>

5. Stratégie de sauvegarde
=========================================

La stratégie de sauvegarde sert à déterminer comment et à quels intervals la base de données
doit être sauvegardée de telle sorte qu'en cas de panne par exemple, on puisse retrouver un
maximum de donnée (1j ? 1s ? aucun perte ?) et le délais de remise en service (aucun ? 1h ? 1j ?)

Les commandes import et export permettent respectivement d'importer et d'exporter les tables d'une base de données.

.. code:: sql

		--redémarrage en mode non cohérent
		Open resetlogs (_resetlogs_corruption=yes)

		--restoration de la base, transparente pour les DBA/Users, depuis logs en ligne
		Instance recovery
		--restoration de la base, non transparente pour les DBA/Users, depuis les logs en ligne et hors ligne
		Database recovery

		Exp/imp
		--on fait la sauvegarde
		Standby database

Standy Database correspond à une base de donnée copié de la DB originale, avec les mêmes logs (redo/undo).

Sauvegarde à froid
	Il s'agit d'une sauvegarde dans laquelle on arrête (shutdown)
	la DB, on copie tous les fichiers physique, les logs (redo/undo), ...
	sur un autre disque dur, et en cas de panne, on écrase les fichiers actuels avec la sauvegarde.
	(1/semaine généralement)

Sauvegarde à chaud
	La base de donnée n'est pas arrêtée, on sauvegarde les fichiers physiques
	sur un autre disque.(1/jour généralement)

Types de pannes

	* action: commande retourne une erreur, par exemple à cause d'un manque de mémoire physique
	* transaction: transaction ne peut pas continuer (verrou mortel, mauvais ordonnancement, ...)
	* système: problème de la RAM.
	* mémoire secondaire: crash d'un disque

6. Concurrence
=========================================

Il est possible que plusieurs utilisateurs font des calculs/modifications soit lecture/écriture sur
une même table au même moment. Comment gérer les accès pour que le lecteur lise des donnée
correctes ou que deux modifications ne se mélangent pas et provoquent une panne de transaction ?

De base, les ordres DML sont fait en local. Lorsque l'utilisateur veut mettre en ligne
ses modifications, il COMMIT. Sinon il supprime les modifications en local avec ROLLBACK.

On parle de transaction pour caractériser l'ensemble des ordres DML suivis d'un COMMIT/ROLLBACK.

.. code:: sql

		Select ...; -- 3
		Insert ...;
		Select ...; -- 4 pour cet utilisateur, 3 pour les autres

		SAVEPOINT nom; -- sauvegarde

		Insert ...;
		Select ...; -- 5 pour cet utilisateur, 3 pour les autres

		ROLLBACK TO nom; -- annuler les actions jusqu'au save point

		Select ...; -- 4 pour cet utilisateur, 3 pour les autres

		COMMIT;

		Select ...; -- 4 pour cet utilisateur, 4 pour les autres

.. toctree::
    :maxdepth: 1

		Verrous                   <concurrence/lock>
		Interblocage              <concurrence/interblocage>

7. Exercices
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

		Non triés                 <exercices/non_rank>


|

-----

**Crédits**
	* Régine LALEAU (enseignant à l'IUT de Sénart-Fontainebleau)
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune