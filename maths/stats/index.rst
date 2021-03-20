.. _stats:

===================================
Statistiques et R
===================================

| :math:`\color{grey}{Version \ 0.21.62}`
| :math:`\color{grey}{Dernière \ édition \ le \ 20/03/2021}`

Les prérequis sont de savoir lire du R (concepts de base et un peu avancés).
Ceci n'est pas un cours de maths donc ce ne sont pas des vraies statistiques
mais uniquement un cours d'initiation du point de vue d'un programmeur.

1. Introduction
===================

L'objectif des statistiques est depuis des observations (=données=Data)
d'une population (pas forcément humaine),
de déterminer des caractéristiques puis une loi de probabilité (~fonction de répartition)
qui est proche des observations
ce qui nous permettra de déduire ou émettre des hypothèses. Les matheux chercheront
à démontrer à quel point il est vraisemblable (ça semble ok) d'affirmer
que les observations sont le résultat de cette loi.

Population
	On considère nos données comme ceux d'une population. Il s'agit généralement
	d'une matrice (d'individus i par variables j).

Variables
	Il s'agit généralement des colonnes (j) de la matrice. Elles sont (de caractère)
	qualitatives ou quantitatives.

	Variable quantitative
		La valeur fait l'objet d'une mesure donc on associe
		une loi qui représente les valeurs pouvant être prises.

			* suivant une loi discrète : nombre de valeurs finies (dénombrable, comptage)
			* suivant une loi continue : nombre de valeurs infinies (non dénombrable, mesure)

		Ces données sont généralement représentées par des histogrammes.

	Variable qualitative
		La valeur est un critère ou permet de grouper les individus (le sexe, ...). Généralement
		le type est :code:`factor()` en R. Ces données suivent généralement une loi Binomiale.

Individu
	Il s'agit d'une ligne (i) de la matrice.
	La valeur i,j corresponds à la valeur de la variable j pour l'individu i.
	On note NA l'absence de valeur.

Échantillon (dit représentatif)
	Il s'agit d'une sous-partie de la population. Généralement, il faut que les variables
	aléatoires soient indépendantes et identiquement distribuées (i.i.d) sinon cela
	pourra fausser des test (utiliser :code:`sample()`).

Modèle
	On appelle modèle nos hypothèses sur la distribution de l'échantillon. Il s'agit
	généralement d'une loi de probabilité avec ses paramètres.

Données appariés
	Si vous avez deux jeux de données concernant les mêmes individus (mais par exemple
	a deux moments différents) alors on parle de données appariés. Ces données ont leur
	propres tests car il ne respectent pas le critère d'indépendance par exemple.

On rappelle la fonction :code:`data("data_set")` qui importe un dataset
depuis un nom ou liste les dataset disponibles (si aucun nom).

Nos variables du cours
	On considère les variables data (population), ech (échantillon),
	var (une variable qualitative/quantitative), quant (une variable
	quantitative) et qual (une variable quantitative). J'explicite mais data
	n'est qu'un gros échantillon donc si on mets ech on peut généralement aussi
	tester data et inversement.

2. Fondements mathématiques
=================================

Moyenne :code:`mean(ech)`
	* arithmétique/empirique : somme des valeurs/nombre de valeurs
	* pondérée par les effectifs (E(x)) : somme(valeur * fréquence) avec fréquence=#occurrences/#total

	Dispersion des écarts absolus : somme des \|valeur-moyenne\|

Médiane (moyenne milieu) :code:`median(ech)`
	Valeur qui coupe la population en deux parties égales. On peut lire la médiane sur un graphique
	(F(x) ou :code:`ecdf(loi)` en R : la médiane se trouve au f(x)=0.5)

	Dispersion des écarts absolus (:code:`mad(ech)`) : somme des \|valeur-médiane\|

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

	Si vous avez des NA : :code:`cor(x,y,use="complete.obs")`.

Moments
	| Moment d'ordre 1 : E(X) donc la moyenne (:code:`mean`)
	| Moment d'ordre 2 : V(X) donc la variance (:code:`var`)
	| Moment d'ordre 3 : Skewness (coefficient d’asymétrie), :code:`E[(X-\mu)^3]/\sigma^3` (:code:`skewness`) [#3]_
	| Moment d'ordre 4 : Kurtosis (coefficient d’aplatissement), :code:`E[(X-\mu)^4]/\sigma^4 - 3` (:code:`kurtosis`) [#3]_

	Si Skewness est proche de 0 alors la distribution est symétrique.

	Si Kurtosis est faible alors la répartition est équilibrée sinon il y a un pic. En particulier,
	si Kurtosis vaut 3 alors on a une loi gaussienne.

	.. [#3] fonctions de la librairie :code:`e1071` (ou :code:`moments`).

Mesures de position/dispersion
	La médiane et la moyenne nous aident à savoir la position des valeurs (mesures de position),
	et l'écart-type est appelé mesure de dispersion. Lorsque la distribution est symétrique et
	suit une loi normale, alors médiane=moyenne (important à retenir pour les tests).

Autre
	* Statistique univariée (le left.sided ou right.sided?) : une variable
	* Statistique bivariée (le two.sided?) : deux variable
	* Statistique multivariée : plusieurs variable

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
	sinon l'échantillon est dit biaisé.

Gérer les valeurs NA
	Vous pouvez voir le nombre de valeurs NA avec :code:`sum(is.na(ech$var))` (pour chaque
	variable qui retourne le nombre de NA), ou alors :code:`summary(ech)` (retourne dans
	:code:`NA's:<nombre>` le nombre de NA par colonne) ou encore graphiquement
	:code:`library(visdat);vis_miss(ech)`.

		* solution 1 : supprimer les lignes (et donc perdre beaucoup d'informations)
		* solution 2 : remplacer NA par une valeur (en tenant compte des autres valeurs pour ne rien fausser)
		* solution 2 (moyenne) : :code:`ech$quant[is.na(ech$quant)] <- mean(ech$quant, na.rm = TRUE)`

Fonctions utiles
		* :code:`summary()` : le nombre de NA, les moyennes, ...
		* :code:`describe()` : comme summary mais un peu plus beau, :code:`library('prettyR')`
		* :code:`View()` : afficher (graphiquement)
		* :code:`head()`/:code:`tail()` : le début/fin donc les premières/dernières valeurs
		* :code:`dim()` ou :code:`length()` : savoir combien de lignes=individus/colonnes=variables on manipule
		* :code:`names()` : savoir les noms des variables manipulées
		* :code:`str()` : voir les types des variables et une idée des valeurs prises
		* :code:`complete.cases()` : le nombre de lignes sans NA donc ok
		* :code:`range()` : retourne le min et le max
		* D'autres fonctions : :code:`var, sd, quantile, ...`

5. Préparation
================

Vous trouverez d'abord un rappel sur les lois (théorie) et leur fonctions associées en R.

Il est possible (question de lisibilité/sémantique/...)
que vous vouliez transformer une variable quantitative en qualitative
(ou inversement). Alternativement, vous pouvez vouloir changer le type d'une variable pour qu'il soit
correctement utilisé par R (transformer date (texte) en vraie data, ...).

Dans le cas où vous n'auriez pas assez d'individus pour faire certains tests (partie
suivante) avec la contrainte de 30 individus par exemple, vous pouvez
fusionner vos données (entre autres).
La partie fusion de données traite aussi du cas ou vos avez des données ayant étés
rentrées à la main (notamment) et qui ont étés mal écrites (faute, accent manquant, ...).

Il arrive généralement que l'on trie les valeurs, ceci ce fait avec :code:`sort`.

Il est généralement avisé et recommandé de traiter les valeurs dites anormales/aberrantes/extrêmes. Il s'agit
de valeur trop importantes/faibles qui donnent des valeurs pouvant ne pas être représentatives. On obtient
une moyenne dite élaguée... L'analyse ANOVA permettra de vérifier si la moyenne est bien représentative.

Intervalles de confiance
	On va généralement donner un interval (moyenne, variance, ...) plutôt qu'une valeur car on travaille
	sur une partie de la population (de taille n car il faudra aussi donner la valeur de n). L'erreur suit au travail
	sur un échantillon est appelée : fluctuation d'échantillonnage.

	On répète les résultats plusieurs fois sur un échantillon
	similaire et on obtient un résultat distribué autour de la moyenne
	donc le résultat le plus probable. En pratique, une seule mesure est faite
	et il faut déterminer l'erreur faite en choisissant cette valeur comme moyenne.

	.. code:: r

		library('binom')
		# affiche un interval de confiance de la loi binomiale
		# on utilise method="all" pour voir toutes les méthodes
		# vous pouvez ne regarder que la méthode "exact" par exemple
		binom.confint(nb_success, nb_trials, method="all")

Enfin, on va pas cherche une loi exacte mais une loi qui rende les observations le plus vraisemblable possible,
donc qui maximise la loi : L (vraisemblance). La/Les valeurs de theta qui maximisent L(theta)
sont appelées estimateurs du maximum de vraisemblance. Des estimateurs sont par exemple : :code:`variance, écart-type, ...`.

.. toctree::
	 :maxdepth: 1

		Lois de probabilités (rappels)   <files/lois>
		Lois de probabilités en R        <files/rfunc>
		Transformation de variables      <files/var_t>
		Fusion de données                <files/fusion>

Le Théorème Central Limite (TCL) indique que la somme de n variables i.i.d
centrée et réduite suit une loi normale centrée réduite. Donc dans la majorité des cas, nous pourrons
approcher notre distribution par une LNCR.

6. Statistique descriptive
===============================

Occurrences et fréquence
	Avec :code:`table(v)` vous obtenez le nombre d'occurrences de chaque valeur dans v.

	Vous pouvez obtenir les probabilités (la fréquence) de chaque valeur avec :code:`prop.table`.
	Si vous donnez 1 ou 2 alors le calcul ne sera fait que sur les lignes ou colonnes
	ce qui donne :code:`prop.table(table(v), 1)` par exemple.

Valeurs aberrantes
	Utiliser des boîtes à moustaches (boxplot) pour voir la présence de valeurs extrêmes.

Il est généralement pratique de tester des variables quantitatives après
leur avoir appliqué une variable qualitative (fait des groupes selon un critère
comme les notes du BAC par filière) pour étudier la répartition dans un plus petit ensemble.

Dans la prolongation de la recherche de caractéristiques (estimateurs) de vraisemblance,
le diagramme QQ-plot ou Quantile-Quantile permet de comparer notre distribution à une distribution existante.

Quelques notes

	* on se rappelle que pour une loi de poisson, moyenne = variance = paramètre
	* si la moyenne est 3, tester une loi de poisson de paramètre 3 ?
	* si la distribution est linéaire, c'est sûrement une loi normale/gaussienne

Cette partie contient une liste d'outils pour décrire votre échantillon.

.. toctree::
	 :maxdepth: 1

		Histogramme (var numérique)               <desc/hist>
		Diagrammes a bandes (var qual/~quant)     <desc/barplot>
		Boîtes à moustaches (quantiles, ...)      <desc/boxplot>
		Tableaux croisés (plusieurs variables)    <desc/qhpvt>
		Quantile-Quantile (QQ plot)               <desc/qq>

7. Aparté : Vraisemblance
===============================

Il s'agit d'une notion, avec les estimations de Monte-Carlo que je pensais, naïvement pouvoir
éviter (car c'est compliqué) mais il s'agit d'une partie vraiment cruciale en statistiques
donc je vais essayer d'expliquer ça ici.

Un estimateur sert à estimer les paramètres et caractéristiques d'une loi comme
la moyenne ou la variance d'un échantillon. Les critères qui font un bon estimateur sont

	* biais
	* convergence
	* efficacité
	* robustesse

Un estimateur est une fonction :math:`h_n(X_1,...,X_n) = \hat{\theta}_n` (ou :math:`T(...)` ou :math:`f(...)`)
qui prends des v.a. i.i.d (important) et qui retourne pour chaque valeur de la loi un estimateur
qui est une v.a. notée :math:`h_n(x_1,...,x_n) = \hat{\theta}_n`.

On va chercher à réduire l'erreur que nous faisons en prenant :math:`\hat{\theta}`
comme étant la vrai paramètre de la loi.

Il y a des types de biais sur les estimateurs

	* biais : :math:`B(\hat{\theta}) = E[\hat{\theta}] - \theta`
	* sans biais : :math:`B(\hat{\theta}) = 0`
	* asymptotiquement sans biais : :math:`\lim_{n \rightarrow +\infty} E[\hat{\theta}] = \theta`
	* écart/erreur quadratique moyen.ne : :math:`MSE(\hat{\theta}) = E[(\hat{\theta}-\theta)^2] = Var(\hat{\theta})+B(\hat{\theta})^2`

| Estimateur (sans biais) de la moyenne : :math:`\hat{\mu} = \frac{1}{n} \sum_{i=1}^{n} X_i`.
| Estimateur (asymptotiquement sans biais) de la variance : :math:`S^2_{n} = \frac{1}{n} \sum_{i=1}^{n} (X_i-\hat{\mu})^2`.
| Estimateur (sans biais) de la variance : :math:`S^2_{n} = \frac{1}{n-1} \sum_{i=1}^{n} (X_i-\hat{\mu})^2`.

Lorsque l'estimateur converge vers la vraie valeur, on parle d'estimateur convergent.

Un estimateur est efficace si sa variance est faible.

Un estimateur qui n'est pas trop sensibles aux outliers (valeurs extrêmes et délirantes)
est considéré comme robuste.

Une estimation du maximum de vraisemblance consiste à trouver une fonction
:math:`L` qui maximise donc qui trouve un :math:`\hat{\theta}` qui soit
le plus probable de correspondre à :math:`\theta`.

.. math::

		f(x;\theta) \begin{cases}
		f_{\theta}(x) & \text{si X v.a. continue, f la fonction de densité} \\
		P_{\theta}(X=x) & \text{si X v.a. discrète, f la probabilité discrète}
		\end{cases}

8. Statistiques inférentielle
===============================

L'objectif est de pouvoir déduire le comportement d'une population
inconnue depuis les résultats d'analyse d'une population connue. En particulier,
les tests servent à vérifier que le modèle choisi pour représenter
la distribution semble cohérent.

On distingue deux types de test

	* paramétriques : la loi doit être normale ou prérequis d'une moyenne/variance/corrélation
	* non-paramétriques (distribution free) : les autres tests (utilisent les statistiques de rangs)

Un test permet de vérifier s'il est possible que la loi suive une loi normale et
non d'affirmer que la loi suit une loi normale.

**Attention** : cette partie est très technique et cela me fait beaucoup d'informations
à rassembler, de formules à lire et comprendre donc je ne garantit rien (encore moins que d'habitude)
de tout ce que vous pourriez lire ci-après.

Les conditions des tests ne sont pas fixes, il y a généralement des cas pour lesquels
les conditions ne sont pas respectés mais le test marche, donc j'ai fait avec
ce que j'ai trouvé car il n'y a jamais vraiment de conditions explicitées.

.. toctree::
	 :maxdepth: 1

		Comprendre les tests                                  <tests/how>
		Test de normalité                                     <tests/norm>
		Test de comparaison des proportions                   <tests/pour>
		Test de comparaison des moyennes                      <tests/moy>
		Test de comparaison des variances                     <tests/var>
		Technique du Boostrap                                 <tests/mdb>
		Test de la nullité du coefficient de corrélation      <tests/cor>
		Test sur les données appariées                        <tests/paired>

9. Regression linéaire
=======================

...

-----

**Crédits**

	* Nicolas BRUNEL (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* "Initiation à R" de Eric Preud’homme (Université du Havre)
	* "OperaMagistris, éléments de mathématiques appliqués" de Vincent ISOZ
	* "R programming" de Vincent ISOZ, Daname KOLANI
	* Enseignants de Paris-Saclay (Mooc https://www.fun-mooc.fr/courses/course-v1:ParisSaclay+71007+session15/about)
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
	* http://www.fabricemonna.com/wp-content/uploads/2019/12/Poly-eudiant-Estimation-et-intervalle-de-confiance.pdf
	* http://mapage.noos.fr/jerome.giovendo/CoursFluctuation.pdf
	* https://openclassrooms.com/fr/courses/4525256-initiez-vous-au-langage-r-pour-analyser-vos-donnees/6250873-utilisez-les-facteurs
	* https://fr.wikibooks.org/wiki/Programmer_en_R
	* http://www.math-evry.cnrs.fr/_media/members/pneuvial/demstat/201411_ds1_04.testsechapp.pdf
	* https://vincentarelbundock.github.io/
	* https://www.lmd.polytechnique.fr/~sturquet/teaching_data/mu001/chap6.pdf
	* https://fr.sawakinome.com/articles/education/difference-between-parametric-and-nonparametric-test.html
	* http://www.dagnelie.be/
	* https://www.math.univ-toulouse.fr/~xgendre/ens/l3sid/L3SID_SE_TP1.pdf
	* https://odr.inra.fr/intranet/carto/cartowiki/index.php/Statistiques_descriptives_avec_R
	* https://larmarange.github.io/analyse-R/statistique-univariee.html
	* http://www.sthda.com/french/wiki/logiciel-r
	* https://fr.wikipedia.org/wiki/Cat%C3%A9gorie:Test_statistique
	* https://lepcam.fr/index.php/les-etapes/test/
	* http://jybaudot.fr/Inferentielle/signes.html
	* https://www3.nd.edu/~steve/Rcourse/Lecture7v1.pdf
	* http://www.sthda.com/english/wiki/unpaired-two-samples-wilcoxon-test-in-r
	* http://www.sthda.com/english/wiki/unpaired-two-samples-t-test-in-r
	* https://fr.wikipedia.org/wiki/Maximum_de_vraisemblance
	* https://fr.wikipedia.org/wiki/Estimateur_(statistique)
	* https://fr.linkedin.com/learning/r-les-statistiques-parametriques/produire-un-test-t-de-student-homoscedastique-ou-heteroscedastique
	* https://reference.wolfram.com/language/ref/CramerVonMisesTest.html
	* http://pwer21c.github.io/