=======================================================
2. Manipulation des tuples - Gérer les résultats
=======================================================

Il est possible d'appliquer des opérations sur les
résultats :

	* trier les résultats : ORDER BY
	* limiter le nombre de lignes sélectionnées : LIMIT

ORDER BY
-----------------

ORDER BY par défaut trie par ordre croissant (ASC) les résultats,
on peut trier par ordre décroissant avec DESC. Vous n'êtes pas obligé de préciser
ASC.

.. code:: sql

	Select attribut1, attribut2 WHERE ...
	ORDER BY attribut1 DESC

	Select attribut1, attribut2 WHERE ...
	ORDER BY attribut1 -- donc ASC

	(Select attribut1 FROM ...)
	UNION
	(Select attribut1 FROM ...)
	ORDER BY attribut1; -- le order by DOIT être dehors

LIMIT
-----------------

Limit permet de choisir une portion des résultats et de l'afficher.

| On considère offset = quel ligne est la première que vous voulez
| On considère size = combien de lignes depuis celle d'offset au maximum on affiche

.. code:: SQL

		LIMIT offset[, size]; --size facultatif