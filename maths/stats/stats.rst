===================================
Statistiques et R
===================================

Les prérequis sont de savoir lire du R (concepts de base et un peu avancés).
Ceci n'est pas un cours de maths donc ce ne sont pas des vraies statistiques
mais uniquement un cours d'initiation du point de vue d'un programmeur.

1. Introduction
===================

L'objectif des statistiques est depuis des observations (=données=Data)
d'une population (pas forcément humaine),
de déterminer des caractéristiques puis une loi de probabilité (~fonction de répartition)
qui est proche des observations
ce qui nous permettra de déduire ou émettre des hypothèses.

Population
	On considère nos données comme ceux d'une population. Il s'agit généralement
	d'une matrice.

Variables
	Il s'agit généralement des colonnes (j) de la matrice. Elles sont (de caractère)
	qualitatives ou quantitatives.

	Variable quantitative
		La valeur fait l'objet d'une mesure (1,4,5, ... cm) donc on associe
		une loi qui représente les valeurs pouvant être prises.

			* suivant une loi discrète : nombre de valeurs finies (dénombrable, comptage)
			* suivant une loi continue : nombre de valeurs infinies (non dénombrable, mesure)

		Ces données sont généralement représentées par des histogrammes.

	Variable qualitative
		La valeur est un critère ou permet de grouper les individus (le sexe, ...). Généralement
		le type est :code:`factor()` en R. Ces données suivent généralement une loi Binomiale.

Individu
	Il s'agit d'une ligne (i) de la matrice. Ainsi, la valeur
	i,j corresponds à la valeur de la variable j pour l'individu i.

Valeur
	La valeur i,j corresponds à la valeur de la variable j pour l'individu i.
	On note NA l'absence de valeur.

Échantillon (représentatif)
	Il s'agit d'une sous-partie de la population. Généralement, il faut que les variables
	aléatoires soient indépendantes et identiquement distribuée (i.i.d) sinon cela
	pourra fausser des test (utiliser :code:`sample()`).

Modèle
	On appelle modèle nos hypothèses sur la distribution de l'échantillon. Il s'agit
	généralement d'une loi de probabilité avec ses paramètres.

Données appariés
	Si vous avez deux jeux de données concernant les mêmes individus (mais par exemple
	a deux moments différents) alors on parle de données appariés. Ces données ont leur
	propres tests car il ne respectent pas le critère d'indépendance par exemple.

On rappelle la fonction :code:`data("data_set")` qui importe un dataset
depuis un nom ou liste les dataset disponibles.

Pour la suite, on considère data : notre jeu de données, ech = échantillon
et var : une variable (qualitative/quantitative), quant : une variable
quantitative et qual : une variable quantitative.

2. Fondements mathématiques
=================================

Moyenne
	* arithmétique/empirique : somme des valeurs/nombre de valeurs
	* pondérée par les effectifs (E(x)) : somme(valeur * fréquence) avec fréquence=#occurrences/#total

	Dispersion des écarts absolus : somme des \|valeur-moyenne\|

Médiane (moyenne milieu)
	Valeur qui coupe la population en deux parties égales. On peut lire la médiane sur un graphique
	(F(x) ou :code:`ecdf(loi)` en R : la médiane se trouve au f(x)=0.5)

	Dispersion des écarts absolus (:code:`mad()`) : somme des \|valeur-médiane\|

Médiale
	Valeur qui divise en deux parties la somme cumulée des valeurs (permet de savoir
	combien d'individus sont en dessous/...).

Mode
	Valeur qui apparait le plus de fois.

Quantiles :code:`quantiles`
	Il s'agit d'un découpage de la distribution en part égales (4=quartile,10=déciles, 100=centiles...).

	Le quartile 3 (ou 3ème quartile) désigne ainsi la valeur séparant 3/4 de la distribution et le
	dernier 1/4.

Covariance :code:`cov`
	Si X,Y sont indépendantes alors la covariance vaut 0 (pas réciproque), sinon une covariance
	faible indique des variables faiblement dépendantes et une covariance forte indique des variables
	fortement dépendantes (=liées). On calcule généralement
	une matrice des covariance (X1, ... Xn) pour voir les dépendances deux à deux.

Corrélation :code:`cor`
	Si X et Y (deux v.a.) sont dépendantes et Y augmente quand X augmente (corrélation positive), sinon
	Y diminue lorsque X augmente (corrélation négative). On calcule généralement
	une matrice des corrélation (X1, ... Xn) pour voir les corrélations deux à deux.

	Le coefficient de corrélation linéaire est généralement entre -1 et 1. S'il vaut 0 alors
	les variables ne sont pas corrélés. Sinon lorsqu'il est proche de -1 (corrélation négative parfaite)
	ou 1 (corrélation imparfaite) alors elles sont
	fortement corrélés.

3. Recherche d'une stratégie d'analyse
============================================

J'essaye actuellement d'élaborer un plan pour analyser les données.

	* Objectif 1 : Découverte, il s'agit de comprendre ce qu'on manipule

		* identifier s'il y a des valeurs NA et les gérer
		* extraire l'échantillon d'analyse
		* identifier le nombre d'individus/variables
		* identifier le type des variables
		* identifier les potentielles points à étudier
		* transformer des variables (qualitatives->quantitatives ou inverse)

	* Objectif 2 : Statistique descriptive (analyse de la distribution)

		* on cherche à trouver des propriétés (modèle) de notre distribution
		* on va faire plein de graphiques (histogramme, ...) et observer
		* on regarde si notre distribution suit une loi normale
		* on regarde si nos variables sont indépendantes
		* on peut observer les moments
		* on peut superposer une loi pour tester

	* Objectif 3 : Statistiques inférentielle (test du modèle)

		* on va faire des tests pour vérifier notre modèle
		* un test ne suffit pas à conclure
		* il faut déterminer des intervalles de confiance

4. Découverte
=========================

Extraire un échantillon
	On va généralement faire un échantillon (:code:`ech <- sample(data, size)`)
	de 75% de nos données pour avoir une majorité de données servant à construire notre modèle (apprentissage) et un autre
	set d'observations permettant de vérifier notre modèle (validation).

	Il est important que toutes les valeurs de l'échantillon soient prises au hasard (même chance d'être prises)
	sinon l'échantillon est biaisé.

Gérer les valeurs NA
	Vous pouvez voir le nombre de valeurs NA avec :code:`sum(is.na(ech$var))` (pour chaque
	variable qui retourne le nombre de NA), ou alors :code:`summary(ech)` (retourne dans
	:code:`NA's:<nombre>` le nombre de NA par colonne) ou encore graphiquement
	:code:`library(visdat);vis_miss(ech)`.

		* solution 1 : supprimer les lignes (et donc perdre beaucoup d'informations)
		* solution 2 : remplacer NA par une valeur (en tenant compte des autres valeurs pour ne rien fausser)
		* ... d'autres solutions ... ?

Fonctions utiles
		* :code:`summary()` : le nombre de NA, les moyennes, ...
		* :code:`view()` : afficher (graphiquement)
		* :code:`head()` : le début donc les premières valeurs
		* :code:`dim()` : savoir combien de lignes=individus/colonnes=variables on manipule
		* :code:`names()` : savoir les noms des variables manipulées
		* :code:`str()` : voir les types des variables et une idée des valeurs prises
		* :code:`complete.cases()` : le nombre de lignes sans NA donc ok
		* :code:`range()` : retourne le min et le max
		* D'autres fonctions : :code:`var, sd, quantile, ...`

Autre
	* Statistique univariée : une variable
	* Statistique bivariée : deux variable
	* Statistique multivariée : plusieurs variable

5. Statistique descriptive
============================

Vous trouverez d'abord un rappel sur les lois (théorie) et leur fonctions associées en R.

Il est possible (lisibilité/sémantique/...)
que vous vouliez transformer une variable quantitative en qualitative
(ou inversement).

Alternativement, vous pouvez vouloir changer le type d'une variable pour qu'il soit
correctement utiliser par R.

Dans le cas où vous n'auriez pas assez d'individus pour faire certains tests (partie
suivante) avec la contrainte de 30 individus par exemple, vous pouvez
fusionner vos données (entre autres).

La partie fusion de données traite aussi du cas ou vos avez des données ayant étés
rentrées à la main (notamment) et qui ont étés mal écrites (faute, accent manquant, ...).

.. toctree::
	 :maxdepth: 1

		Lois de probabilités (rappels)   <files/lois>
		Lois de probabilités en R        <files/rfunc>
		Transformation de variables      <files/var_t>
		Fusion de données                <files/fusion>

6. Statistiques inférentielle
===============================

...

-----

**Crédits**

	* Nicolas BRUNEL (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* "Initiation à R" de Eric Preud’homme (Université du Havre)
	* "OperaMagistris" de Vincent ISOZ
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**

	* http://www.jybaudot.fr/Inferentielle/ajuskhidx.html
	* https://fr.wikipedia.org/wiki/Test_F
	* https://en.wikipedia.org/wiki/Nonparametric_statistics
	* http://www.unit.eu/cours/cyberrisques/etage_3_frederic/co/Module_Etage_3_22.html
	* https://support.minitab.com/fr-fr/minitab/18/help-and-how-to/modeling-statistics/anova/supporting-topics/basics/understanding-test-for-equal-variances/
	* http://foucart.thierry.free.fr/StatPC/livre/chapitre6/fisher.htm
	* http://www.sthda.com/french/wiki/visualiser-une-matrice-de-correlation-par-un-correlogramme
	* https://fr.wikipedia.org/wiki/Plan_d%27exp%C3%A9riences
	* https://www.alloprof.qc.ca/fr/eleves/bv/mathematiques/le-coefficient-de-correlation-lineaire-m1377
	* https://team.inria.fr/imagine/files/2015/09/tp_lissage.pdf
	* https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_d%27%C3%A9chantillonnage