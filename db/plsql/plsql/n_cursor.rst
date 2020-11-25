============================================
Déclaration des curseurs
============================================

Un curseur non lié est un curseur non associé
à une requête SQL.

Déclaration
--------------------

La syntaxe est

.. code:: sql

	c_nom REFCURSOR; -- curseur pas associé à une requête

Utilisation
------------------------

.. code:: sql

	--ouvrir
	OPEN curseur non lie FOR requête_sql; -- requête du curseur

	-- si requête_sql utilise un argument externe (ex: celui de la fonction, ...)
	OPEN curseur non lie FOR EXECUTE requête_sql;

	--lecture
	-- chaque lecture va déplacer le curseur de lecture et donc la prochaine lecture lira la ligne suivante.
	FETCH nom_curseur INTO variable, variable, ...;-- soit vous déclarez une variable pour chaque attribut
	-- ou alternativement
	FETCH curseur INTO record; -- avec record une variable de type record

	--fermer
	CLOSE nom_curseur;

Exceptions
---------------------

aucun changement.