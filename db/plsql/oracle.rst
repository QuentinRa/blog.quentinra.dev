.. _plsql_oracle:

============================================
Particularités de Oracle pour le PL/SQL
============================================

| :math:`\color{grey}{Version \ 2.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/11/2020}`

1. Général
===============================================

Par défaut, la sortie standard n'est pas affichée, donc vous ne verrez pas les print/echo
donc les affichages de votre procédure. Utilisez la commande suivante
pour l'activer : :code:`set serveroutput on`.

Pour afficher quelque chose, on utilise

.. code:: sql

	dbms_output.put_line('texte');

Vous pouvez appeler show erreurs pour avoir le détails des erreurs : :code:`show errors`.

2. Procédures
===========================

Les procédures sont des fonctions, je ne sais pas la différence avec des fonctions normales.

.. code:: sql

	CREATE OR REPLACE PROCEDURE
	nomProcedure(nom1 type,nom2 type) IS
	-- declaration des variables
	BEGIN
	-- instructions

	-- COMMIT ou ROLLBACK
	EXCEPTIONS
	--traitement des erreurs
	END NomProcedure;
	/ -- compiler

Explications :

	* :code:`nomProcedure(nom1 type,nom2 type)` est la signature de votre procédure donc le nom et les arguments
	* :code:`-- declaration des variables` dans cet espace, vous devez déclarer toutes vos variables (voir partie correspondante)
	* :code:`-- instructions` ici vous écrivez votre code
	*
		:code:`-- COMMIT ou ROLLBACK` il est recommandé ou obligatoire (si insert) de COMMIT (sauvegarder les modifications
		faites) ou ROLLBACK (annuler les modifications faites).
	* :code:`EXCEPTIONS`, partie facultative permettant de traiter de possibles erreurs

Vous appelez ensuite votre procédure comme suit :

.. code:: sql

		execute nomProcedure(arguments); -- ou execute nomProcedure
		--ou
		call nomProcedure(arguments); -- appelle
		-- ou
		begin
			nomProcedure(arguments);
			--ou
			nomProcedure
		end;
		/

-----

**Crédits**
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune