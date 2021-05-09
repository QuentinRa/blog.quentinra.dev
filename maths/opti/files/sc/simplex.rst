===================
Algo du Simplexe
===================

	* On cherche le maximum/minimum pour une fonction :math:`f(z)`.
	*

		On va introduire des variables artificielles/écart pour chacun des contraintes, notée :math:`S_i` par exemple.

			* aucun si c'est une égalité
			*

				une variable négative (donc moins devant) si c'est une contrainte de supériorité mais vous devrez utiliser
				la méthode des deux phases

			* une variable positive si c'est une contrainte d'infériorité

.. hint::

	en gros c'est un peu sous la forme 100 010 001 si on a trois contraintes, l'un des 3 variables
	de bruit sera ajouté avec un coefficient 1 selon la contrainte et les deux autres à 0.

* on fait une matrice des coefficients A et on va chercher à résoudre Ax=b avec b le vecteur des résultats des inéquations.

Pour ce faire, on va créer un tableau, qui sera mis à jour à chaque itération

=========== ============== ============== ============ ============ ============ ============ ============
base        X              Y              :math:`...`  :math:`S_1`  :math:`...`  :math:`S_n`  b
=========== ============== ============== ============ ============ ============ ============ ============
:math:`S_1` :math:`a_{11}` :math:`a_{12}` :math:`...`  :math:`1`    :math:`0`    :math:`0`    :math:`b1`
:math:`...` :math:`...`    :math:`...`    :math:`...`  :math:`...`  :math:`...`  :math:`...`  :math:`...`
:math:`S_n` :math:`a_{n1}` :math:`a_{n2}` :math:`...`  :math:`0`    :math:`0`    :math:`1`    :math:`bn`
\           :math:`c_1`    :math:`c_2`    :math:`...`  \            \            \`           :math:`R + z`
=========== ============== ============== ============ ============ ============ ============ ============

Quelques détails

	* les :math:`c_i` sont les coefficients devant chaque variable de la fonction objective à maximiser
	* :math:`z` est la valeur que nous cherchons à maximiser

**1. choix de la variable avec** :math:`c_i`

On va ensuite prends la colonne qui à

	*

		le plus grand :math:`c_i` (maximise). Si la colonne qui contient cette valeur ne contient
		que des valeurs négatives alors STOP car optimum non borné.

	*

		le plus petit :math:`c_i` (minimise). Si la colonne qui contient cette valeur ne contient
		que des valeurs négatives alors STOP car optimum non borné.

On va considérer que c'est X donc :math:`c_1` pour la suite, afin de ne pas être trop abstrait.

**2. Le** :math:`S_i` **du plus petit** :math:`bi/a_{ij}` sachant :math:`c_i`

L'objectif va être de trouver la valeur minimum pour :math:`bi/a_{ij}` seulement si :math:`a_{ij}` est
positif (strict). Ce qui donnerait par exemple pour X (si tous les termes sont positifs sinon vous retirez les négatifs)

.. math::

			min(
				b1 / a_{11},
				...,
				bn / a_{n1}
			)

On note la variable de bruit :math:`S_i` correspondant.

**3. échelonner**

La variable trouvée est appelée pivot, et comme dans Gauss on va résoudre la matrice, donc le tableau
plus haut pour obtenir un 1 dans le :math:`a_{ij}` trouvé et que des zéros dans le reste de la colonne.
La ligne des coefficients compte et doit être mise à 0 dans la colonne choisie.

X (ici) entre dans la base, donc dans la colonne :code:`base`, à la ligne :math:`S_i` on remplace
et on mets X.

Une fois que toutes nos coûts réduits, soit la dernière ligne ne contient que des

	* valeurs positives si minimum
	* valeurs négatives si maximum

alors on s'arrête.

Le résultat corresponds à :math:`-R` (le moins je crois c'est parce qu'on cherchait le maximum
mais la valeur R corresponds au minimum).

Au tour 2, on aurait par exemple ce tableau

=========== ============== ============== ============ ============ ============ ============ ============
base        X              Y              :math:`...`  :math:`S_1`  :math:`...`  :math:`S_n`  b
=========== ============== ============== ============ ============ ============ ============ ============
:math:`X`   :math:`a_{11}` :math:`a_{12}` :math:`...`  :math:`1`    :math:`0`    :math:`0`    :math:`?`
:math:`S_2` :math:`0`      :math:`a_{22}` :math:`...`  :math:`...`  :math:`...`  :math:`...`  :math:`...`
:math:`...` :math:`0`      :math:`...`    :math:`...`  :math:`...`  :math:`...`  :math:`...`  :math:`...`
:math:`S_n` :math:`0`      :math:`a_{n2}` :math:`...`  :math:`?`    :math:`?`    :math:`?`    :math:`?`
\           :math:`0`      :math:`???`    :math:`...`  :math:`???`  :math:`???`  :math:`???`  :math:`R'+ z`
=========== ============== ============== ============ ============ ============ ============ ============

mais trop de valeur vont changer avec la résolution de Gauss pour mettre des 0 donc je ne peux pas aller plus
loin dans l'explication.