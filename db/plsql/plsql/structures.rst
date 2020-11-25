============================================
Structures (IF, WHILE, ...)
============================================

Voici toutes les structures en PL/SQL.

.. code:: sql

		-- if
		if condition THEN [ELSIF condition THEN]
			[ELSE condition THEN]
		END IF;

		-- do ... while
		LOOP ...
			EXIT WHEN condition
		END LOOP;

		-- for i in seq ...
		FOR i IN min AND max LOOP ... END LOOP;
		-- inverse
		FOR i IN REVERSE min AND max LOOP ... END LOOP;

		-- while
		WHILE condition LOOP ... END LOOP;

		-- if(){} else if(){} ...
		CASE variable
			WHEN valeur THEN instruction
			WHEN valeur THEN instruction
			ELSE instruction
		END CASE;

Pour récupérer les résultats des requêtes retournant un nombre fixe
de lignes, vous allez utilise select into.

.. code:: sql

		Select ... into v_var1 v_var2 ... -- autant de variables que de résultats du select
		from ... ;

		-- select count(*) in v_count from ... va stocker le count(*) dans la variable v_count (qui a été déclarée)