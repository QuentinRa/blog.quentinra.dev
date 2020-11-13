.. _sql_advanced:

==========================================
SQL (Structured Query Language) - avancé
==========================================

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

2. Vues
===========================

Pour donner la permissions de voir/modifier... certains champs par des utilisateurs
ou pour faciliter des accès, on crée un table fictive : une vue.

La table fonctionne ensuite comme une table normale cependant certaines insertions
peuvent échouer s’il nous manque les clés dans les attributs.

LES VUES AVEC UN CALCUL/GROUP BY ne peuvent pas être mises à jour.

.. code:: sql

		-- Création d'une vue
		CREATE VIEW nomVue [Attributs] AS requête SQL>
		-- regarde delete/update possible avant de le faire.
		CREATE VIEW nomVue [ Attributs ] AS requête WITH CHECK OPTION
		-- supprimer
		DROP VIEW nom_vue;

3. Triggers/Déclencheurs SQL
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

4. Optimisation
=========================================

...

5. Gestion de la mémoire secondaire
=========================================

...

6. Stratégie de sauvegarde
=========================================

...

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune