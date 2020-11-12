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
		* DCL = Data control donc Create, Alter, Drop

Schéma
	... expliquer les différents schéma etc...

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

3. Optimisation
=========================================

...

4. Gestion de la mémoire secondaire
=========================================

...

5. Stratégie de sauvegarde
=========================================

...

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune