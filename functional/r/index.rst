.. _r:

================================
Langage R
================================

| :math:`\color{grey}{Version \ 0.2.7}`
| :math:`\color{grey}{Dernière \ édition \ le \ 28/01/2021}`

1. Introduction
===================

Le R est un langage complet permettant de faire des statistiques. Les fonctions
(ouvrir un fichier, ...) marchent sous tout système d'exploitation.

Comme en OCaml/Python/..., vous pouvez écrire un fichier :code:`.R`
ou alors écrire directement dans l'interpréteur.

Vous pouvez coder du R dans RStudio ou dans IntelliJ.

Quelques points

	* en mode interpréteur, taper le nom d'une variable affiche sa valeur
	* la documentation est généralement écrite en RMarkdown

2. Notes
===================================

Vous pouvez obtenir de l'aide sur une fonction avec :code:`?nom_fonction`
qui sous RStudio/IntelliJ ouvre une page de documentation. Vous
pouvez faire :code:`args(fonction)` pour voir ses arguments. Vous
pouvez voir des exemples d'utilisation avec :code:`example(fonction)`.

Les commentaires se font avec :code:`#`. Pas de symbol en fin de ligne.

La commande :code:`ls` liste toutes les variables. Pour nettoyer
toutes vos variables, tapez :code:`rm(list=ls())`.

Vous pouvez obtenir de l'aide avec :code:`help.start()`.

3. Types et Opérateurs
========================

Le R est faiblement typé mais les données sont implicitement
de l'un des types suivant

	* nombres (dit numeric) : 1,2,4, 4.5, ...
	* les booléens (dits logical) : TRUE ou FALSE
	* autre : la valeur NULL, la valeur NA (not available), la valeur Inf (infini)
	* les strings (dit character) : "chaine de caractères"
	* les vecteurs, les matrices et les DataFrames

Pour être exact, toutes les valeurs en R sont des vecteurs (valeur=vecteur de taille 1).
La valeur NA est utilisée lorsqu'une donnée est manquante. Tout calcul utilisant
NA retourne NA.

Fonctions utiles : :code:`is_na`, :code:`class(data)` (savoir le type), ...

Les opérations sont

	* les basiques : :code:`+,-,/,*`, :code:`nombre^puissance`
	* l'assignation : :code:`variable <- valeur` (= marche mais à éviter)
	* autre : :code:`sqrt, abs, log, xor, sum, ...`
	* concatenation (string) : :code:`paste(string, string, ...)`

Les conditions sont

	* les basiques : :code:`>, >=, <=, <, ==, !=`
	* ou logique : :code:`|` (tester une condition vraie)
	* et logique : :code:`&` (tester plusieurs conditions vraies)
	* négation : :code:`!` (inverse le résultat de la condition)

4. Vecteurs, Matrices et DataFrames
====================================

Un vecteur corresponds à un tableau de valeurs en C. Mais vous
pouvez faire des opérations dessus (ex: vecteur * 2 + 100) comme en python avec un numpy array.
Dans ce cas, alors l'opération sera faite sur chacun des éléments
ce qui donnera un vecteur.

Vous utiliser le constructeur :code:`c(valeur, valeur, ...)` pour créer un vecteur.
Si vous donnez un vecteur comme valeur, alors les valeurs du vecteurs seront
concaténées pour former le nouveau vecteur.

Dans le cas ou vous manipulez deux vecteurs de taille différente, alors on re-parcours
le plus petit vecteur depuis le début. Attention cependant,
le plus petit doit avoir une taille multiple du plus grand (sinon warning).

.. code:: r

		> (1, 2, 3, 4) + c(0,10)
		[1]  1 12  3 14 # résultat de 1 + 0, 2+10, 3 + 0, 4 + 10

Il est possible de créer un vecteur depuis un interval avec :code:`debut:fin`
donc :code:`1:100` crée un vecteur ayant 100 valeurs allant de 1 à 100 inclus.

Un vecteur est comme un tableau en C, donc on peut récupérer des valeurs
avec :code:`vecteur[indices]`. Les différences sont que vous pouvez passer
un vecteur d'indices, que R ne fait pas d'erreur si vous utilisez un indices
en dehors du vecteur (donc faire attention) et que les indices comment à 1. Vous
pouvez prendre tout sauf les indices donnée en mettant un :code:`-` (moins)
devant le vecteur/chaque indice.

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

Vous pouvez obtenir la taille d'un vecteur avec :code:`length(vecteur)`.

Si un vecteur a une dimension (:code:`dim(vecteur)`) alors
c'est une matrice. Vous pouvez créer explicitement une matrice
avec :code:`matrix(data, nrow, ncol)`.

.. code:: r

	> y <- seq(1,10)
	> matrix(y, 2, 5) # déclaration d'une matrice depuis y
	 [,1] [,2] [,3] [,4] [,5]
	[1,] 1 3 5 7 9
	[2,] 2 4 6 8 10
	> dim(y) <- c(2,5) # ou on force la dimension en transformant y
	> y
	 [,1] [,2] [,3] [,4] [,5]
	[1,] 1 3 5 7 9
	[2,] 2 4 6 8 10
	# ajouter des colonnes (avant et/ou après)
	> cbind(colonne_before, matrice, colonne_after)

La particularité d'une matrice est que tous les éléments
ont le même type. Si ce n'est pas le cas, alors utilisez
un dataframe.

.. code:: r

		# création, mettez des vecteurs et/ou des matrices
		> dataframe <- data.frame(vecteur, matrice, ...)
		# mettre des noms aux colonnes
		colnames(dataframe) <- vecteur_noms_colonnes

5. Fonctions utiles en stats
==============================

Général

	* :code:`runif(n)` : génère n nombres aléatoires entre 0 et 1
	* :code:`pi` : variable qui contient pi
	* :code:`LETTERS` : vecteur qui contient l'alphabet
	* les fonctions min/max
	* :code:`summary(data)` : prends un vecteur/... et fait une analyse (moyenne, ...)
	* :code:`seq(from = x, to = y, length = l)` : suite "séquentielle" de l nombres entre x et y
	* :code:`rep(valeur, n)` : vecteur de taille n contenant n fois valeur
	* :code:`sample(v, n)` : prends un échantillon de n valeur d'un vecteur v

Lois

	*	Gaussienne/Normale : :code:`rnorm(n,mean=0,std=1)`
	*	Uniforme : :code:`runif(n,min=0,max=1)`
	*	Poisson : :code:`rpois(n,lambda)`
	*	Exponentielle : :code:`rexp(n,rate=1)`
	*	χ^2 : :code:`rchisq(n,df)`
	*	Binomiale : :code:`rbinom(n,size,prob)`
	*	Cauchy : :code:`rcauchy(n,location=0,scale=1)`

6. Gérer son environnement
============================

Fonctions de déplacement

	* :code:`getwd()` : retourne le répertoire courant
	* :code:`sedwd(path)` : change le répertoire courant
	* :code:`dir()` ou :code:`list.files()` : liste les fichiers du répertoire

Fonctions de manipulation

	* :code:`file.path(partie, partie, ...)` : crée un path [#2]_
	* :code:`dir.create(path)` : créer un dossier
	* :code:`file.create(path)` : créer un fichier
	* :code:`file.exists(path)` : TRUE si existe sinon FALSE
	* :code:`file.info(path)` : infos sur un fichier
	* :code:`file.copy(path,new_path)` : copie un fichier
	* :code:`file.rename(path,new_path)` : renomme un fichier

.. [#2] :code:`file.path("dossier1", "dossier2", "fichier")`. Le path marche sous tout
	système d'exploitation (donc mettra des / sous Linux et des \\ sous Windows).

Manipulation de chaine de caractères

	* :code:`paste(s1, ..., collapse = C)` : fusionne les résultats en les séparant par C
	* :code:`paste(s1, ..., sep = S)` : s1, ... sont fusionnés avec le séparateur S entre

7. Affichage graphique
========================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* "Take only pictures, leave only footprints."
	* Swirl, R programming
	* https://pbil.univ-lyon1.fr/R/pdf/lang01.pdf
	* https://pbil.univ-lyon1.fr/R/pdf/lang02.pdf
	* https://pbil.univ-lyon1.fr/R/pdf/lang03.pdf
	* https://pbil.univ-lyon1.fr/R/pdf/lang04.pdf
	* https://fxjollois.github.io/cours-2016-2017/initiation-a-r-tp1.html
	* https://fxjollois.github.io/cours-2016-2017/index.html
	* https://fr.wikibooks.org/wiki/Programmer_en_R/Les_fonctions_statistiques_de_base
	* https://www.dunod.com/sites/default/files/atoms/files/9782100712861/Feuilletage.pdf