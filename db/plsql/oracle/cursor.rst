============================================
Déclaration des curseurs
============================================

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