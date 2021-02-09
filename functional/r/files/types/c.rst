=============
Vecteurs
=============

Un vecteur corresponds environ à un tableau simple de valeurs en C
ou sinon c'est littéralement un vecteur en maths.

Vous pouvez faire des opérations dessus (ex: vecteur * 2 + 100) comme en python avec un numpy array.
Dans ce cas, l'opération sera faite sur **chacun** des éléments ce qui donne ainsi un nouveau vecteur.

On crée un vecteur avec :code:`c(valeur, ...)`, :code:`n:m` (vecteur de n à m inclus)
ou encore un vecteur vide de taille n avec :code:`vector(mode="type", length=n)`.

.. code:: R

	> c(1,2,3,4,5)
	[1] 1 2 3 4 5
	> 1:5
	[1] 1 2 3 4 5
	> v <- vector(mode = "numeric", 5)
	# on tire une valeur entre 1 et 5
	> sapply(v, function (x){ return(sample(1:5, 1)) })
	[1] 2 1 5 4 1

	> c(1, 2, 3, 4) + c(0,10)
	# recyclage
	# 1=1+0, 12=2+10, 3=3+0 et 14=4+10
	[1]  1 12  3 14

Attention pour le recyclage, le plus petit doit avoir une taille
multiple du plus grand (sinon warning).

**Indices**

Pour accéder à une valeur on utilise :code:`mon_vecteur[indice]`, avec un indice qui commence à 1 pour le premier élément.
On peut également donner un vecteur d'indices qui correspondent aux valeurs retournées. Si le vecteur
est négatif (- devant toutes les valeurs ou devant le vecteur), alors toutes les valeurs
sauf celles aux indices donnés sont retournées.

.. code:: r

	# passe vecteur d'indices de 1 à 25 donc les 25 premiers de vecteur
	> vecteur[1:25]
	[1] 76 90 66 59 28 93 20 68 27 67 38 96 11 48 68 64 46 28 47 93 17 53 86 97 46
	> vecteur[c(1,2)] # seulement les 2 premiers
	[1] 76 90
	> vecteur[-c(1,2)] # tous sauf deux premiers
	[1] 66 59 28 93 20 68 27 67 38 96 11 48 68 64 46 28 47 93 17 53 86 97 46
	> vecteur[c(-1,-2)] # tous sauf deux premiers (pareil que plus haut)
	[1] 66 59 28 93 20 68 27 67 38 96 11 48 68 64 46 28 47 93 17 53 86 97 46
	> y <- seq(1,10)
	> vecteur[y] # y donc seq(1,10) donc les indexes 1 à 10
	[1] 76 90 66 59 28 93 20 68 27 67

**Indices nommés**

Vous pouvez nommer des indices d'un vecteur avec :code:`nom = valeur`.
On peut obtenir/modifier des noms avec :code:`names()`.

.. code:: r

	# création
	> r <- c(oui = 1, non = 0)
	> r["oui"]
	oui
	1
	# forcer des noms
	> r <- c(r, 2) # taille 3
	> names(r) <- c("oui", "non", "jsp")

Vous pouvez alors utiliser la fonction match pour récupérer plusieurs
indices nommés :code:`match(c("nom1", "nom2", ...), names(x))`
(et vous pouvez mettre un - devant match pour inverser).