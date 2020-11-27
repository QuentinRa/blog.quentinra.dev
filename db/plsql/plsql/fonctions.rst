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
		LANGUAGE langage; -- plpgsql, c, java, ...

		-- ou

		CREATE [OR REPLACE] FUNCTION nom (nom type, ...)
		RETURNS type de retour AS $nom_variable_retour$
		BEGIN
		-- instructions
		RETURN nom_variable_retour;
		END;
		/ -- compile

Notez que les arguments peuvent également être accédés avec $1 (premier argument),
$2 (2e ...), ... Donc vous pouvez ne pas donner de noms à vos arguments.