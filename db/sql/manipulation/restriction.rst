=======================================================
2. Manipulation des tuples - Where
=======================================================

Le clause where vous permet de restreindre les tuples
affichés à ceux pour lesquels un attribut à une certaine valeur etc...
donc selon un critère.

.. code:: sql

		-- opérateurs logiques
		-- opérateurs : < > >= <= != = <> (notez que <> et != veulent dire la même chose)
		WHERE attribut != 'valeur';
		WHERE attribut1='valeur' AND attribut2='valeur';
		WHERE attribut1='valeur' OR attribut2='valeur';

		-- d’autres opérateurs spéciaux
		-- in ou not in un ensemble de valeurs
		WHERE attribut IN (valeurs, ...);
		WHERE attribut IN (Select attribut FROM ...);

		-- IS ou IS NOT une valeur (par exemple NULL)
		WHERE attribut IS valeur
		WHERE attribut IS NOT valeur

		-- requête SQL retourne au moins une ligne
		-- NOT EXISTS pour la négation
		-- exemple plus bas car compliqué
		WHERE EXISTS (requête_sql);

		-- un intervalle, bornes inclues
		WHERE attribut BETWEEN min AND max;

		-- une comparaison
		-- pattern, regex avec _ pour un caractère est % pour une chaine de caractères
		WHERE attribut like 'pattern';

		-- opérateurs ensemblistes

		-- opération vraie pour tous les résultats
		-- par exemple attribut > ALL (Select attribut ...)
		WHERE attribut opérateur ALL (requête_sql);
		-- opération vraie pour au moins 1 résultat
		WHERE attribut opérateur ANY (requête_sql);

L'opérateur EXISTS (ou NOT EXISTS) est un peu compliqué, parce que vous devez
avoir un paramètre commun entre votre requête initiale et la requête imbriquée (wtf?).

.. code:: sql

	-- relation catalogue(id_catalogue, nom, date_sortie)
	-- relation achat(date, id_catalogue)

	Select *
	From catalogues c -- ici on va utiliser c comme paramètre
	Where EXISTS (
		Select * FROM achat
		WHERE c.id_catalogue=achat.id_catalogue -- ici on voit que l'on compare avec notre paramètre
	);