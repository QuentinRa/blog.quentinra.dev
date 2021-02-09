===========================
Statistiques et R
===========================

Il existe un cours plus détaillé mais il demande
des bases en R donc je détaille ici ce qui est important pour la suite.

On appelle population notre jeu de données et échantillon une partie de
la population tirée aléatoirement avec chaque élément ayant autant de chances
d'être choisi (i.i.d).

Notre population est une liste d'individus (lignes) dont on a observé
selon des critères (variables, colonnes) les valeur qu'ils ont. Le tout
est mis dans une matrice individus par variables.

Exemple (1,2,...) sont les numéro de ligne des individus,
Sex, Wr.Hnd, ... sont les variables.

.. code:: R

		> library("MASS")
		> data("survey")
		> head(survey)
		  Sex	 Wr.Hnd	 NW.Hnd W.Hnd Fold	Pulse Clap Exer Smoke Height      M.I    Age
		1 Female   18.5   18.0 Right  R on L    92    Left Some Never 173.00   Metric 18.250
		2   Male   19.5   20.5  Left  R on L   104    Left None Regul 177.80 Imperial 17.583
		3   Male   18.0   13.3 Right  L on R    87 Neither None Occas     NA     <NA> 16.917
		4   Male   18.8   18.9 Right  R on L    NA Neither None Never 160.00   Metric 20.333
		5   Male   20.0   20.0 Right Neither    35   Right Some Never 165.00   Metric 23.667
		6 Female   18.0   17.7 Right  L on R    64   Right Some Never 172.72 Imperial 21.000

On distingue des variables

	* Variable quantitative
		La valeur fait l'objet d'une mesure donc on associe
		une loi qui représente les valeurs pouvant être prises.

			* suivant une loi discrète : nombre de valeurs finies (dénombrable, comptage)
			* suivant une loi continue : nombre de valeurs infinies (non dénombrable, mesure)

		Ces données sont généralement représentées par des histogrammes.

	* Variable qualitative
		La valeur est un critère ou permet de grouper les individus (le sexe, ...). Généralement
		le type est :code:`factor()` en R. Ces données suivent généralement une loi Binomiale.

		En particulier, une variable est généralement qualitative si vous pouvez l'utiliser pour faire
		des groupes (donc par exemple homme/femme/...).

Dans le tableau précédent

	* qualitative : Sex, W.Hnd, Fold, Clap, Exer, Smoke, M.I.
	* quantitative : Wr.Hnd, NW.Hnd, Pulse, Height, Age