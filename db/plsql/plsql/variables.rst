============================================
Déclaration des variables
============================================

On déclare une variable avant le bloc begin. La syntaxe
est la suivante :code:`v_nom [CONSTANT] type [NOT NULL] [ := expression ]` (entre crochets = facultatif).

Note : vous pouvez remplacer := par DEFAULT.

.. code:: sql

	--on met un v devant le nom pour se rappeler que c'est une variable locale
	-- exemple avec une constante
	v_constante CONSTANT integer := 5;
	-- exemple avec une variable
	v_variable real NOT NULL;

En gros, vous avez avoir deux utilités aux variables :

	* stocker une valeur (par exemple un 5, ...)
	*
		récupérer le résultat d'une requête **qui ne retourne qu'une seule ligne**, si vous voulez
		récupérer le résultat d'un :code:`select *`, alors il vous faudra autant de variables qu'il
		y a de lignes, on utilise donc un curseur pour éviter ça.

Il est possible/recommandé de demander aux variables de prendre le type d'un attribut,
plutôt que de leur donner directement le type (donc vous laissez %type).

.. code:: sql

		v_nom table.attribut%type ; -- d'une colonne (attribut)
		--ou
		v_nom v_variable%type ; -- d'une autre variable

Quelques notes
	* les noms des variables commencent généralement (faites le !) par :code:`v` pour variable (locale)
	* on peut stocker les résultats des requêtes qui retournent une ligne dans une variable (une par attribut)
	* si une requête retourne plusieurs lignes, on utilise un **curseur**

Quelques types méconnus
-------------------------------

Il existe

	* t ARRAY[taille] := {...} qui permet de créer un tableau de taille élément avec chaque élément de type t
	* RECORD := SQL qui permet de stocker le résultat d'une requête SQL retournant une ligne
	* table%ROWTYPE est le type d'un tuple d'une table
	* CREATE TYPE pour créer des types