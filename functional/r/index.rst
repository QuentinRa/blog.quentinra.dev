.. _r:

================================
Langage R
================================

| :math:`\color{grey}{Version \ 0.6.21}`
| :math:`\color{grey}{Dernière \ édition \ le \ 31/01/2021}`

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

Vous allez utiliser des packages (librairies) contenant des fonctions/constantes/... Vous
pouvez voir la liste des packages installés avec :code:`installed.packages()`,
installer un package avec :code:`install.packages("nom")`.
Enfin pour l'utiliser dans le code, il faudra le charger (sauf s'il l'est déjà
par défaut), ceci est fait avec :code:`library("nom");`.

2. Notes
===================================

Vous pouvez obtenir de l'aide sur une fonction avec :code:`?nom_fonction`
qui sous RStudio/IntelliJ ouvre une page de documentation. Vous
pouvez faire :code:`args(fonction)` pour voir ses arguments. Vous
pouvez voir des exemples d'utilisation avec :code:`example(fonction)`.
Enfin, on peut utiliser :code:`body(fonction)` pour voir le corps
d'une fonction.

Les commentaires se font avec :code:`#`. Pas de symbol en fin de ligne.
Vous pouvez mettre plusieurs instructions sur une ligne avec des :code:`;` entre.

La commande :code:`ls` liste toutes les variables. Pour nettoyer
toutes vos variables, tapez :code:`rm(list=ls())`.

Vous pouvez obtenir de l'aide avec :code:`help.start()`.

La fonction :code:`print()` permet d'afficher
quelque chose en mode compilé.

3. Particularités du R
========================

.. toctree::
	 :maxdepth: 1

		Types en R                  <files/types>
		Opérations et Structures    <files/op>
		Structures de données       <files/v>
		Notation nom1.nom           <files/dot>

4. Fonctions
=======================

On déclare un bloc entre crochets :code:`{}` dans lequel
chaque ligne est une expression. La valeur d'une variable
contenant une fonction corresponds à la valeur de sa dernière expression.

.. code:: r

	# La valeur de f corresponds à la valeur de r soit 5^1 = 5
	# x et r existent en dehors du bloc
	> f <- {
	 x <- 5
	 r <- x^(mod(x,2))
	}
	> x
	5

Note: dans un bloc, vous pouvez utiliser des variables de l'extérieur. Si une variable
n'est pas déclarée dans le bloc, alors le bloc parent sera regardé.

Une fonction est déclarée avec le mot :code:`function` suivie
d'un bloc. Les variables n'existent que dans la fonction. Vous pouvez
déterminer des arguments qui ont un nom et optionnellement
une valeur par défaut. Vous retournez le résultat
avec :code:`return(valeur)`.

.. code:: r

	> fest <- function (quotient = 1) {
	 x <- 5 * quotient
	 r <- x^(mod(quotient,3))
	 # # si aucun, alors la ligne précédente est retournée donc pareil
	 return(r); # faudra faire un print() si pas de return
	}
	# x n'existe pas ici

Pour appeler une fonction, vous mettez :code:`nom(arguments)` et
donner les arguments dans l'ordre ou vous pouvez utiliser leurs nom
donc :code:`nom(arg3 = valeur, arg1 = valeur, ...)` et l'ordre
n'a pas d'importance.

Alternativement, s'il n'y qu'un argument
commençant par f par exemple, vous pouvez utiliser f comme nom
lors de l'appel ou un diminutif du vrai nom.

Notez que vous pouvez faire une fonction variadique (donc qui prends
un nombre d'argument variable) en mettant un dernier argument :code:`...`.

5. Fonctions utiles en stats
==============================

Général

	* :code:`runif(n)` : génère n nombres aléatoires entre 0 et 1
	* :code:`choose(n,k)` : choisi n éléments parmi k (vecteur)
	* :code:`factorial(n)` : n factoriel
	* :code:`pi` : variable qui contient pi
	* les fonctions min/max
	* :code:`summary(data)` : prends un vecteur/... et fait une analyse (moyenne, ...)
	* :code:`seq(from = x, to = y, length = l)` : suite "séquentielle" de l nombres entre x et y
	* :code:`rep(valeur, n)` : vecteur de taille n contenant n fois valeur (=vecteur, nombre, ...)
	* :code:`sample(v, n)` : prends un échantillon de n valeur d'un vecteur v
	* :code:`zapsmall(...)` : choisi et round automatiquement pour donner un arrondi propre.

Jeux de données

	* :code:`library(MASS); data(survey)` : données du style {sexe, droitier/gaucher, fumeur?, age, ...}
	* :code:`library(ade4); data(deug)` : données du style {matière, grade, ...}
	* :code:`LETTERS` ou :code:`letters` : vecteur qui contient l'alphabet

Lois

	*	Gaussienne/Normale : :code:`rnorm(n,mean=0,std=1)`
	*	Uniforme : :code:`runif(n,min=0,max=1)`
	*	Poisson : :code:`rpois(n,lambda)`
	*	Exponentielle : :code:`rexp(n,rate=1)`
	*	χ^2 : :code:`rchisq(n,df)` et :code:`chisq.test(v)$expected` pour tester la différence.
	*	Binomiale : :code:`rbinom(n,size,prob)`
	*	Cauchy : :code:`rcauchy(n,location=0,scale=1)`

Vous remarquez que toutes les fonctions commencent par r. Il existe des variantes :

	* :code:`pfunc(q,...)` : pour la probabilité cumulée jusqu'à q (vecteur de quantiles) donc proba d'être :code:`<=q`
	* :code:`qfunc(p,...)` : pour le quantile associée à la probabilité cumulée p (vecteur de probabilités)
	* :code:`dfunc(x,...)` : pour la densité de probabilité en x (vecteur de quantiles)

Fonctions de calculs

	* :code:`mean(x)` : moyenne
	* :code:`median(x)` : médiane
	* :code:`var(x)` : variance
	* :code:`cov(x)` : covariance
	* :code:`cor(x)` : corrélation

6. Gérer son environnement
============================

Fonctions de déplacement

	* :code:`getwd()` : retourne le répertoire courant
	* :code:`sedwd(path)` : change le répertoire courant
	* :code:`dir()` ou :code:`list.files()` : liste les fichiers du répertoire
	* :code:`source(path)` : exécute un fichier R (path/url)
	* :code:`cat(path, sep = S)` : affiche fichier R (S = \\n, ...)
	* :code:`readLines(path)` : lis un fichier R

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

Vous pouvez générer des fichiers contenant un graphique les fonctions (:code:`pdf(path)`,
:code:`jpeg(path),`, :code:`png(path)`, ...). Elle créent un périphérique graphique
qui sera utilisé plutôt que celui par défaut pour dessiner le graphique. Pour fermer
le périphérique, utilisez :code:`dev.off()`. Vous pouvez aussi faire
une sauvegarde du device avec :code:`dev.copy(device=format,"nom")`.

7. Affichage graphique
========================

Les fonctions basiques sont : :code:`plot` (graphique),
:code:`hist` (histogramme), curve, pie, barplot, biplot, image, ...
Elles ont toutes les mêmes arguments ou presque

	* :code:`main = "titre"` : titre
	* :code:`xlab = "titre x"` : titre de l'axe x
	* :code:`ylab = "titre y"` : titre de l'axe y
	* :code:`xlim = valeur` : limite supérieure x
	* :code:`ylim = valeur` : limite supérieure y
	* :code:`col = couleur` : couleur de qqch (ex: red(1.0), package crayon)
	* :code:`border = couleur` : couleur de bordure (histogramme, ...)
	* :code:`breaks = seq(...)` : augmenter le séquencement (histogramme, plus de blocs)
	* :code:`type = "l"` : l=ligne, b=ligne avec points (plot)

Il faut utiliser :code:`proba = TRUE` pour pouvoir par exemple obtenir
la densité (:code:`density(..., adjust = valeur)`). Si valeur vaut plus petite
que 1 alors on regarde le cas discret et si la valeur est plus grande alors on
regarde le cas continu.

Si vous avez beaucoup de points qui se superposent, vous pouvez utiliser
:code:`jitter` ou :code:`sunflowerplot` pour identifier les endroits concernés.

Certains fonctions peuvent prendre une table et donne un graphique :
:code:`hist` (donne un diagramme batons), :code:`pie` (camembert), :code:`balloonplot`
(tableau de contingence)....

Les fonctions de dessin (appliquées sur le dernier graphique)

	* :code:`points` : dessine des points
	* :code:`line` : dessine des points
	* :code:`legend` : ajouter une légende
	* :code:`title` : ajouter un titre
	* :code:`mtext` : ajouter un texte
	* :code:`abline` : trace une droite y=bx+a (paramètres h=x ou v=y si besoin)
	* Autres : rect, segments, polygon, box, grid, ...

La fonction par permet de définir l'environnement (fond, ...) et est utilisée
avant les dessins pour les prochains dessins (ex: :code:` par(bg="...")`).

8. RMarkdown
===========================

Le RMarkdown (fichier .Rmd) est basé sur le Markdown donc vous aurez
plus d'infos sur le cours de Markdown. Voici un exemple
de fichier, avec des métadonnées.

.. code:: md

	---
	title: "Titre du document"
	output: html_document
	---

	# Header1
	## Header2
	### Header3
	....

	[texte affiché](lien)
	![texte si image non trouvée](chemin)

	*Un texte en italique*
	**Un texte en gras**

	> une citation

	```{r}
	Code en R
	```

Bloc de code
	Vous pouvez créer un bloc de code avec CTRL+ALT+I. Vous pouvez même éditer
	le code (completion, ...) et le compiler pour faire apparaitre le résultat
	dans le fichier.

	Vous pouvez faire

		* :code:`{r  include = FALSE}` : compilé mais non affiché
		* :code:`{r  echo = FALSE}` : compilé mais n'affiche pas le code
		* :code:`{r  message = FALSE}` : compilé, pas de messages
		* :code:`{r  warning = FALSE}` : compilé, pas de warnings

Lien utile : https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf

9. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Introduction				<exercices/intro>

-----

**Crédits**
	* Jean R. LOBRY (Université de Lyon)
	* Brigitte SCHAEFFER (INRA-Jouy)
	* Sophie SCHBATH (INRA-Jouy)
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
	* https://rmarkdown.rstudio.com/lesson-1.html
	* https://abcdr.thinkr.fr/redaction-markdown/
	* https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf
	* http://www3.jouy.inra.fr/miaj/public/formation/initiationRv10.pdf
	* https://stackoverflow.com/questions/7526467/what-does-the-dot-mean-in-r-personal-preference-naming-convention-or-more
	* https://stats.stackexchange.com/questions/10712/what-is-the-meaning-of-the-dot-in-r
	* https://www.reddit.com/r/datasets/comments/exnzrd/coronavirus_datasets/
	* https://rviews.rstudio.com/2020/03/05/covid-19-epidemiology-with-r/
	* https://www.dunod.com/sites/default/files/atoms/files/9782100712861/Feuilletage.pdf