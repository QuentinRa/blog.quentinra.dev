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

2. Les procédures
=========================

Cette partie est différente selon votre SGBD, l'idée est

	* une partie [DECLARE] pour déclarer les variables
	* une partie [BEGIN] pour le code
	* une partie [EXCEPTION] pour les erreurs appelés exceptions
	* END; pour indiquer que la déclaration du bloc est finie.

Quelques notes
	* les noms des variables commencent généralement (faites le !) par :code:`v` pour variable
	* on peut stocker les résultats des requêtes qui retournent une ligne dans une variable (une par attribut)
	* si une requête retourne plusieurs lignes, on utilise un **curseur**

COMMIT et ROLLBACK
	Il s'agit de deux instructions ULTRA IMPORTANTES donc a connaître.

	Lorsque vous faites une ordre DML, le SGBD ne sauvegarde pas automatiquement les changements sur le serveur.
	Si vous êtes sûr de vos changements, allez vous utiliser la requête SQL :code:`COMMIT;` sinon vous pouvez annuler
	vos modifications locales avec :code:`ROLLBACK`.

Curseur
	Lorsqu'une requête retourne plusieurs lignes, on utilise un curseur.
	Un curseur va pointer sur la ligne actuellement lu.

	Ses attributs sont les attributs du select et leurs valeurs sont celles de la ligne actuellement
	lue.

	Vous pouvez avancer d'une ligne mais généralement pas reculer.

	Si une curseur est vide ou il y a un problème alors aucune EXCEPTION n'est levée. Vous devez donc
	faire un IF et vérifier s'il y a un problème en regardant les propriétés du curseur (nombre de lignes, ...).

3. Triggers/Déclencheurs
===========================

...

-----

**Crédits**
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.tutorialspoint.com/plsql/index.htm