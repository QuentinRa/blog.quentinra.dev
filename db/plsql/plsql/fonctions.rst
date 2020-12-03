============================================
Déclaration de fonctions
============================================

.. code:: plpgsql

		CREATE [OR REPLACE] FUNCTION nom (nom type, ...)
		RETURNS type_de_retour AS $nom_variable_retour$
		BEGIN
		 -- instructions
		 RETURN nom_variable_retour;
		END;
		$nom_variable_retour$ LANGUAGE langage; -- plpgsql, c, java, ...

ou

.. code:: plpgsql

		CREATE [OR REPLACE] FUNCTION nom (nom type, ...)
		RETURNS type de retour AS nom_variable_retour
		BEGIN
			-- instructions
			RETURN nom_variable_retour;
		END;
		/ -- compile



Notez que les arguments peuvent également être accédés avec $1 (premier argument),
$2 (2e ...), ... Donc vous pouvez ne pas donner de noms à vos arguments.