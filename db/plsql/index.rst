.. _plsql:

================================
PL/SQL (Procedural Language)
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 12/11/2020}`

Le PL/SQL (PL pour Procedural Language) est un langage complémentaire au SQL
qui ajoute des fonctions appelés procédures, ainsi que des triggers (=déclencheurs).

.. danger::

	Par défaut, la sortie standard n'est pas affichée, donc vous ne verrez pas les print/echo
	donc les affichages de votre procédure. Utilisez la commande suivante
	pour l'activer : :code:`set serveroutput on`.

	Vous pouvez appeler show erreurs pour avoir le détails des erreurs : :code:`show errors`.

1. Procédures
================================

Voici le format général d'une procédure :

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

2. Déclaration des variables
================================

On déclare une variable avant le bloc begin. La syntaxe
est la suivante :code:`v_nom [CONSTANT] type [[NOT NULL] := expression ]` (entre crochets = facultatif).

En gros, vous avez avoir deux utilités aux variables :

	* stocker une valeur (par exemple un 5, ...)
	*
		récupérer le résultat d'une requête **qui ne retourne qu'une seule ligne**, si vous voulez
		récupérer le résultat d'un :code:`select *`, alors il vous faudra autant de variables qu'il
		y a de lignes, on utilise donc un curseur pour éviter ça.

.. code:: sql

		--on met un v devant le nom pour se rappeler que c'est une variable locale
		-- exemple avec une constante
		v_constante CONSTANT integer := 5;
		-- exemple avec une variable
		v_variable real NOT NULL;

Il est possible/recommandé de demander aux variables de prendre le type d'un attribut,
plutôt que de leur donner directement le type (donc vous laissez %type).

.. code::sql

		v_nom table.attribut%type ; -- d'une colonne (attribut)
		--ou
		v_nom v_variable%type ; -- d'une autre variable

3. Structures basiques
=======================

Voici toutes les structures en PL/SQL.

.. code:: sql

		-- if
		if condition THEN [ELSIF condition THEN]
			[ELSE condition THEN]
		END IF;

		-- do ... while
		LOOP ... EXIT WHEN condition END LOOP;

		-- for i in seq ...
		FOR i IN min AND max LOOP ... END LOOP;

		-- while
		WHILE condition LOOP ... END LOOP;

		-- if(){} else if(){} ...
		CASE variable WHEN valeur THEN instruction
			WHEN valeur THEN instruction
			ELSE instruction
		END CASE;

Pour afficher quelque chose, on utilise

.. code:: sql

	dbms_output.put_line('texte');

.. note::

	Le symbol pour concaténer deux chaines est :code:`||`.

Pour récupérer les résultats des requêtes retournant un nombre fixe
de lignes, vous allez utilise select into.

.. code:: sql

		Select ... into v_var1 v_var2 ... -- autant de variables que de résultats du select
		from ... ;

		-- select count(*) in v_count from ... va stocker le count(*) dans la variable v_count (qui a été déclarée)

4. Curseurs et requêtes a nombre de lignes variables
================================================================

Lorsque le nombre de résultats n'est pas fixe (+ d'une ligne),
on utilise un curseur (=structure).

Dans la partie de déclarations de variables

.. code:: sql

		--déclaration (donc dans la partie déclarations)
		CURSOR nom_curseur IS
		--requête du curseur
		SELECT attribut, attribut ... FROM relation ;
		--déclaration des variables du curseur dans lesquelles les attributs seront conservés
		v_nom type ;
		...

Puis dans votre partie d'instructions :

.. code:: sql

		--ouvrir
		OPEN nom_curseur;

		--lecture
		FETCH nom_curseur INTO variable, variable, ...;
		-- chaque lecture va déplacer le curseur de lecture et donc la prochaine lecture lira la ligne suivante.

		--fermer
		CLOSE nom_curseur;

Les exceptions ne marchent pas sur les curseurs, vous devez utiliser des
if et vérifier les propriétés du curseurs et gérer tout ça vous même.

.. code:: sql

		-- Renvoi NULL si aucun appel a Fetch, TRUE si Fetch a réussi à retourner une ligne ou le cas échéant FALSE
		nom_curseur%FOUND

		-- Renvoi NULL si aucun appel a Fetch, FALSE si Fetch a réussi à retourner une ligne ou le cas échéant TRUE.
		nom_curseur%NOTFOUND

		-- Retourne TRUE si le curseur est ouvert sinon FALSE
		nom_curseur%ISOPEN

		-- Renvoi le nombre de lignes Equivalent du NO_DATA_FOUND si renvoi 0
		nom_curseur%ROWCOUNT

5. Exceptions
================================

Vous mettez vos exceptions dans le bloc EXCEPTIONS.

.. code:: sql

		-- Pas de données trouvés
		WHEN NO_DATA_FOUND THEN instructions END

		-- Division par zero
		WHEN ZERO_DIVIDE_THEN THEN instructions END

		--	Requête retourne plus d’éléments que on n’as déclaré de variables dans le into (voir curseurs)
		WHEN TOO_MANY_ROWS THEN instructions END

		--	Autres
		WHEN OTHERS THEN instructions END

6. Triggers/Déclencheurs
===========================

.. note::

	Cette partie n'est pas encore disponible

-----

**Crédits**
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune