=======================================================
2. Manipulation des tuples - Insert, Update, Delete
=======================================================

La clause INSERT permet d'insérer
des tuples dans une table. Il est recommendé après le nom
de la table, de mettre ses attributs entre parenthèses, car les valeurs
du insert selon ajoutés aux colonnes dans le même order que celui entre parenthèses.

La clause Update met à jour les tuples récupérés depuis un table
après application de la condition. Elle change les attributs
de set et leur donne la nouvelle valeur choisie.

La clause Delete supprime des lignes de table,
qui correspondent à la condition.

.. code:: sql

		-- créer un tuple
		-- préciser les attributs permet d'être sur de l'attribut
		-- auquel la valeur est assignée (ex: changement de l'ordre des colonnes)
		-- et seulement les attributs spécifiés seront à remplir, les autres prendront
		-- leur valeur par défaut.
		INSERT INTO table[(attribut,...)] VALUES (valeur, ...)

		-- mettre à jour un tuple
		UPDATE table SET attribut='valeur' WHERE condition

		-- suppression
		DELETE FROM table Where condition

.. warning::

	Après un insert, update ou delete,
	les changements ne sont généralement pas sauvegardés dans le base (donc juste en local).

	On peut annuler ses modifications avec ROLLBACK ou les sauvegarder avec COMMIT.