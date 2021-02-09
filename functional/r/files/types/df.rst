============
data.frame
============

Le data.frame est une sorte de tableau mais avec
des colonnes de types différentes. En fait, généralement lorsque
vous ouvrez un fichier (excel, un csv, ...) alors
vous obtenez un data.frame.

Vous pouvez créer un data.frame avec :code:`data.frame(nom_colonne = v1, ... )`.

.. code:: R

		# exemple idiot
		> df <- data.frame(nombre = sample(1:100, 6), name = "Léon")
		> df
		 nombre name
		1     98 Léon
		2     36 Léon
		3    100 Léon
		4     27 Léon
		5      7 Léon
		6     28 Léon

Un data.frame est une liste donc les éléments peuvent
avoir des types différents et surtout
vous pouvez utiliser :code:`df$nom_colonne`.

Les fonctions et les opérateurs sur les matrices sont
généralement également disponibles.