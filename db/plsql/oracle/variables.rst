============================================
Déclaration des variables
============================================

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