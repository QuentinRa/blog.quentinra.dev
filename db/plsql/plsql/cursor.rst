============================================
Déclaration des curseurs
============================================

Lorsqu'une requête retourne plusieurs lignes, on utilise un curseur.
Un curseur va pointer sur la ligne actuellement lu.

Ses attributs sont les attributs du select et leurs valeurs sont celles de la ligne actuellement
lue.

Vous pouvez avancer d'une ligne mais généralement pas reculer.

Si une curseur est vide ou il y a un problème alors aucune EXCEPTION n'est levée. Vous devez donc
faire un IF et vérifier s'il y a un problème en regardant les propriétés du curseur (nombre de lignes, ...).

Déclaration
--------------------

La syntaxe est

.. code:: sql

	c_nom CURSOR IS requête_sql; --requête du curseur
	-- ou
	c_nom CURSOR FOR requête_sql; --requête du curseur
	-- ou
	CURSOR c_nom FOR requête_sql; --requête du curseur

Utilisation
------------------------

.. code:: sql

		--ouvrir
		OPEN nom_curseur;

		--lecture
		-- chaque lecture va déplacer le curseur de lecture et donc la prochaine lecture lira la ligne suivante.
		FETCH nom_curseur INTO variable, variable, ...;-- soit vous déclarez une variable pour chaque attribut
		-- ou alternativement
		FETCH curseur INTO record; -- avec record une variable de type record

		--fermer
		CLOSE nom_curseur;

Quelques instructions supplémentaires

	* MOVE [direction {FROM | IN}] curseur;
		* FROM : LAST {<nombre>}, RELATIVE {<nombre>}, FORWARD {<nombre>}
	* Si vous parcourez le curseur avec un for i in, le curseur est automatiquement parcouru

Exceptions
---------------------

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

