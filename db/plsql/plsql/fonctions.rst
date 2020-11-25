============================================
Déclaration de fonctions
============================================

.. code:: sql

		CREATE [OR REPLACE] FUNCTION nom (nom type, ...)
		RETURNS type de retour AS $nom_variable_retour$
		BEGIN
		-- instructions
		RETURN nom_variable_retour;
		END;
		LANGUAGE langage; -- plpgsql, ...

		-- ou

		CREATE [OR REPLACE] FUNCTION nom (nom type, ...)
		RETURNS type de retour AS $nom_variable_retour$
		BEGIN
		-- instructions
		RETURN nom_variable_retour;
		END;
		/ -- compile