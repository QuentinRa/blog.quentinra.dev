===================================
Statistiques et R
===================================

Les prérequis sont de savoir lire du R (concepts de base et un peu avancés). Attention,
mon niveau de compréhension en statistiques est faible.

1. Introduction
===================

L'objectif des statistiques est depuis des observations (=données=Data)
de déterminer une loi de probabilité qui se rapproche aux observations
ce qui nous permettra de déduire ou émettre des hypothèses.

On considère généralement des données de la forme d'une matrice. Les colonnes (j)
sont appelés variables et les lignes (i) sont les individus (ce qui forme une population).
La valeur i,j corresponds à la valeur de la variable j pour l'individu i.

Il existe deux types de variables, dites variables

	* quantitatives : généralement les valeurs sont des nombres (entiers/réels par exemple : un age)

		* continue : peut prendre beaucoup de valeurs (loi continue)
		* discrète : peut prendre un nombre fini de valeurs (loi discrète)

	* qualitatives : généralement une valeur permettant de qualifier l'individu (ex: groupe d'ages comme seniors, jeunes, ...)

Attention, un nombre n'est pas formée une variable quantitatives et une texte ou autre
n'est pas forcément une variable qualitatives. R détecte les variables qualitatives en leur
donnant le type :code:`factor` mais parfois il se trompe (lui aussi :p) donc il faudra
forcer le type. Je crois qu'une variable est qualitative si on peut l'utiliser pour grouper
les individus (~groupes importants).

Il arrive assez souvent qu'il manque des données (donc la valeur NA) en
R. Vous pouvez voir avec :code:`summary()` dans chaque colonne la ligne :code:`NA's:<nombre>`
qui indique le nombre de valeurs nulles correspondant à cette variable.

	* solution 1 : supprimer les lignes (et donc perdre beaucoup d'informations)
	* solution 2 : remplacer NA par une valeur entière (uniquement possible si c'est une variable quantitative)
	* solution 3 : remplacer NA par une valeur (en tenant compte des autres valeurs pour ne rien fausser)
	* ... d'autres solutions ... ?

Vous pouvez aussi graphiquement voir les données manquantes (pourcentages totaux) avec
:code:`library(visdat);vis_miss(...data ici...)`.

On rappelle la fonction :code:`data("data_set")` qui importe un dataset
depuis un nom ou liste les dataset disponibles.

On appelle Modèle votre hypothèse du comportement de la population, généré
depuis les observations.

2. Recherche d'une stratégie d'analyse
============================================

Voici un essai d'une stratégie selon mes observations. Il faudra
lire tout le cours par contre avant d'avoir des détails.

	* Objectif 1 : séparation

		* Cette partie est "faite" en même temps que notre second objectif
		* C'est ici qu'on traite le cas des valeurs NA
		* Il faudra découper nos observations en 2 catégories [#1]_

	* Objectif 2 : avoir une idée générale des données que l'on manipule

		* :code:`summary()` : le nombre de NA, les moyennes, ...
		* :code:`view()` : afficher (graphiquement)
		* :code:`head()` : le début donc les premières valeurs
		* :code:`dim()` : savoir combien de lignes=individus/colonnes=variables on manipule
		* :code:`names()` : savoir les noms des variables manipulées
		* :code:`str()` : voir les types des variables et une idée des valeurs prises
		* :code:`complete.cases()` : le nombre de lignes sans NA donc ok
		* :code:`range()` : retourne le min et le max
		* D'autres fonctions : :code:`var, sd, quantile, ...`

	* Objectif 2 : Statistiques descriptives

		* Ici on risque généralement de transformer les données
		* par exemple changer un type de variable (quantitative -> qualitatif ou inverse)
		* on va faire plusieurs graphiques pour essayer de trouver des propriétés à tester
		* on va essayer de regarder si la distribution semble normale, les variables indépendantes, ...
		* on peut faire un histogramme, un diagramme de points, ...
		* on peut superposer une loi pour tester
		* on peut observer les moments
		* pour chercher la loi, on peut essayer des trucs comme

			* si la moyenne est 3 : une loi de poisson de paramètre 3
			* si la distribution est linéaire, c'est sûrement une loi normale/gaussienne

	Objectif 4 : Statistiques inférentielle

		* ici on va faire des tests pour vérifier notre modèle
		* certains tests on besoin de conditions (autres tests) pour être faits (normalité, indépendance, ...)
		* un test ne suffit pas à conclure
		* on distingue les tests paramétriques (modèle suit une loi normale) des tests non paramétriques

.. [#1] On va généralement partitionner nos observations entre deux parties (75%/25% par exemple)
	pour avoir une majorité de données servant à construire notre modèle (apprentissage) et un autre
	set d'observations permettant de vérifier notre modèle (validation).

	On peut utiliser :code:`sample()` en R pour prélever aléatoirement un échantillon d'individu
	qui servirons pour l'apprentissage/la validation.

3. Lois de probabilités
===================================

Tout d'abord, les fonctions en commencent par ... suivie du nom de la loi
donc par exemple :code:`rbeta` pour la loi Beta.

	* :code:`r[nom]` : suit la loi de probabilité nom
	* :code:`p[nom]` : fonction de réparation de la loi (:math:`P(X \le k)`)
	* :code:`q[nom]` : inverse de la fonction de répartition soit les quantiles
	* :code:`d[nom]` : densité (loi continue) ou :math:`P(X=k)` (loi discrète)

Les différentes lois sont

	* Beta : fonction :code:`beta`
	* **Binomiale** : fonction :code:`binom`, ex: dbinom(x=3,size=5,prob=0.5) soit 3 succès sur 5 avec proba 0.5
	* **Cauchy** : fonction :code:`cauchy`
	* **Khi-deux** : fonction :code:`chisq`
	* **Exponentielle** : fonction :code:`exp`
	* F : fonction :code:`f`
	* Gamma : fonction :code:`gamma`, :code:`gamma(n)=(n-1)!`
	* **Géométrique** : fonction :code:`geom`
	* **Hypergéométrique** : fonction :code:`hyper`
	* Logistique : fonction :code:`logis`
	* Log Normale : fonction :code:`lnorm`
	* **Binomiale négative** : fonction :code:`nbinom`
	* **Normale** (Gaussienne) : fonction :code:`norm` (norm(x,mu,sigma) avec mu=moyenne, sigma=écart type donc 0,1 = centrée)
	* **Poisson** : fonction :code:`pois`
	* **Student T** : fonction :code:`t`
	* **Uniforme** : fonction :code:`unif`
	* **Weibull** : fonction :code:`weibull`

Donc si on veut calculer :math:`P(X \le k)` on utilise une fonction de type
p. Si on veut calculer :math:`P(X \gt k)` alors on fait :code:`1-fonction_de_type_p`.
Enfin si on veut calculer :math:`P(X = k)` alors on utilise une fonction de type d.

4. Transformer nos variables
==============================

Il est possible, pour des raisons de lisibilités, faciliter le traitement ou autre
que vous vouliez transformer une variable quantitative en qualitative par exemple.

L'utilité de faire des groupes est de pouvoir observer à différentes échelles
la répartition, ... donc de regarder sur le grand ensemble global puis redescendre
à des ensembles locaux.

Discrétisation non supervisée
	On ne sait pas comment former des groupes qualitatifs donc on laisse R faire.
	On charge la librairie :code:`arules`.

	On peut choisir de découper en x parties nos données : :code:`discretize(data, method = "frequency", breaks = x)`
	ce qui donne des groupes a peu près égaux.

	On peut choisir de découper en x intervals de même taille : :code:`discretize(v, method = "interval", breaks = x)`
	mais qui ne contiennent pas forcément le même nombre de valeurs.

	On peut faire des groupes homogènes donc les valeurs ont
	l'air d'être dans des groupes proches/logiques : :code:`r <- discretize(Age, method = "cluster", breaks = x)`.

	On peut voir graphiquement avec :code:`plot (default), ggplot (ggplot2), ...`

Discrétion supervisée
	Il s'agit d'un découpage dans lequel on essaye de regrouper le plus d'individus dans un groupe
	ayant un caractère qualitatif.

	Discrétion avec Khi-deux
		On va regarder pour un tableau de données si les données sont suffisamment proches (alpha) pour
		qu'elles soient dans le même groupe.

		La fonction est :code:`chiM(data, alpha = ...)` de la librairie :code:`discretization`.

Fusion
	Attention, pour l'analyse un groupe doit avoir au moins 5 individus et parfois
	au minimum 30 (loi normale). Vous pouvez faire une jointure/fusion avec :code:`merge`
	par exemple si deux jeux de données ont une colonne
	en commun avec :code:`merge(data1, data2, by="nom_colonne")`.

Données "doubles"
	Il est possible que certaines données aient étés mal rentrées par faute de frappe
	parce qu'on a rentrée 500 fois la même valeur à la main au lieu d'utiliser
	les jointures et un code/id.

	Par exemple imaginons dans vos données [Firefox, mozilla, Mozilla]. Vous pouvez alors les regrouper
	dans un groupe avec :code:`fct_collapse(data, "col" = c("Firefox","mozilla", "Mozilla"))`
	du package :code:`forcats`.

Statistiques pondérées
	Si on a des valeurs associés à une probabilités dans deux vecteurs, alors on peut soit
	les fusionner soit travailler dessus sans les désagréger avec :code:`wtd.mean(v,p)`,
	:code:`wtd.mean(v,p)`, ... du package :code:`questionr`.

5. Statistiques descriptives
==================================

Le but des statistiques descriptives est de décrire notre échantillon.

Améliorer nos graphiques
	On peut ajouter des droites comme la moyenne sur nos axes pour situer
	la répartition des données.

	On peut également tester la fonction de répartition (:code:`ecdf(rloi(...))` en R)
	en la superposant à un graphique précédemment obtenu (on rappelle le add=TRUE).

Occurrences et fréquence
	Avec :code:`table(v)` vous obtenez le nombre d'occurrences de chaque valeur dans v.

	Vous pouvez obtenir les probabilités (la fréquence) de chaque valeur avec :code:`prop.table`.
	Si vous donnez 1/2 alors le calcul ne sera fait que sur les lignes/colonnes.

	Un histogramme semble être le meilleur moyen d'observer graphiquement ces valeurs.

Diagrammes a bandes
	Fonction :code:`barplot` (space=augmenter l'espacement).

	Vous pouvez ordonner avec sort() avant. Attention ce n'est pas très lisible s'il y a beaucoup
	de valeurs, donc uniquement pour les variables qualitatives.

Histogramme
	Généralement on l'utilise pour voir graphiquement le nombre d'individus (:code:`hist()`)
	mais on peut aussi l'utiliser pour retrouver la loi.

	Lorsqu'on met :code:`proba=TRUE`, on obtient un histogramme des densités sur lequel on
	pourra superposer une loi. La différence est que les x sont des probas (densité)
	au lieu d'être un nombre (fréquence).

Tableaux croisés
	Observer l'évolution de deux variables aléatoires. On a généralement X1, X1 par rapport
	à X2, ... et ce pour toutes les variables.

	On utilise la fonction :code:`qhpvt` de la librairie :code:`pivottabler`.

	Forme : :code:`qhpvt(data, rows = ..., columns = ..., calculations = "...")`

		* data : vos données (data.frame)
		* rows : la colonne du DataFrame dont chaque valeur aura une ligne
		* cols : la colonne du DataFrame dont chaque valeur aura une colonne
		* calculations/cal : le calcul de chaque valeur i,j

			* "mean()" : faire la fonction mean (moyenne)
			* "n()" : faire la fonction n (nombre d'éléménets)
			* ...

		* formats : format d'une cellule (list("%.1f") par exemple)
		* totals : ligne total (vous pouvez la renommer/retirer avec :code:`totals='totals=NONE'`)

	Vous pouvez faire plusieurs calculs, mettre plusieurs lignes/colonnes en utilisant
	des vecteurs.

Quantiles
	On utilise généralement :code:`boxplot` car on peut voir graphiquement les 3 quartiles,
	la médiane ainsi que le min et le max. La fonction :code:`quantiles()` retourne tous les quantiles.

	Les valeurs extrêmes sont inférieures à :code:`Q1-1.5(Q3-Q1)` ou supérieures à :code:`Q3+1.5(Q3-Q1)`.

	Il est possible de faire un boxplot pour chaque groupe, séparés selon une variable
	quantitative avec :code:`tableau ~ nom_variable_qualitative` (ex: tableau des ages
	et un sexe (H/F) alors on obtient deux boxplot, une pour chaque sexe).

Moments
	| Moment d'ordre 1 : E(X)
	| Moment d'ordre 2 : V(X)
	| Moment d'ordre 3 : Skewness ou coefficient d’asymétrie, :code:`E[(X-\mu)^3]/\sigma^3`
	| Moment d'ordre 4 : Kurtosis ou coefficient d’aplatissement, :code:`E[(X-\mu)^4]/\sigma^4 - 3`

	Si Skewness est proche de 0 alors la distribution est symétrique.

	Si Kurtosis est faible alors la répartition est équilibrée sinon il y a un pic. En particulier,
	si Kurtosis vaut 3 alors on a une loi gaussienne.

	On étudie les moments avec :code:`mean`, :code:`var`. :code:`` et :code:`` sont
	dans la librairie :code:`e1071` (ou :code:`moments`).

6. Statistique inférentielle
==============================

L'objectif est de pouvoir déduire le comportement d'une population
inconnue depuis les résultats d'analyse d'une population connue. En particulier,
les tests servent à vérifier le modèle que nous avons choisi pour représenter
la distribution.

On va donc faire des tests et généralement on va devoir
vérifier que des préconditions sont vraies pour que les test soient valides.

Le test est généralement **acceptable** si la :code:`p-value` est au dessus
de 5% donc 0.05 (le "je suis sûr au seul de 95%").

Attention ! Les tests permettent de renforcer vos suppositions mais en aucun
cas il ne certifient qu'elles soient vraies. Ce n'est donc pas suffisant
et il faudra probablement faire des tests de plus en plus précis.

QQ plot/Diagramme Quantile-Quantile
	Si les observations et la distribution sont la même, alors les points
	tourneront autour de la droite. Cela peut être un moyen utile de vérifier un test.

	On utilisera les fonctions comme :code:`qqplot, qqline, qq, ...`. :code:`datax=TRUE` est utile
	pour mettre en fonction de l'axe x.

Test paramétriques et non paramétriques (distribution free)
	Un test paramétrique demande a ce que la distribution suive une loi normale
	ce qui est le cas pour de nombreux tests (anova, Student T, ...). Les
	autres, dits non paramétriques, sont moins puissants mais ne demande pas ce prérequis.

Test d’indépendance
------------------------

:code:`Motivation` : variables qualitatives indépendantes si p-value acceptable.

du Khi deux (:code:`chisq.test(tab,correct=FALSE)`)
	| :code:`Prérequis` : tab de 2 variables qualitatives, au moins 5 individus

	On peut regarder le :code:`$expected` pour vérifier ou encore les résidus
	:code:`$residuals` (valeur ij élevé = joue un rôle élevé dans la liaison des variables)
	calculés selon la formule :math:`(observed - expected) / sqrt(expected)`.

	Le correct corresponds à la correction de continuité (T=oui, F=non).

de Fisher (:code:`fisher.test(tab)`)
	| :code:`Prérequis` : tab de 2 variables qualitatives

	Très gourmand en ressources, préférez le célèbre test du Khi-Deux.

Test d’adéquation du Khi deux
--------------------------------

*Également appelé test de conformité*.

| :code:`Motivation` : tester si une distribution inconnue est de la forme d'une loi connue.
| :code:`chisq.test(observations , p = théorie)`

L'idée est d'observer la différence entre la théorie et nos valeurs.

On a généralement deux lois X (1,...,p) et Y (1, ..., q) alors on a une loi du Khi Deux
qui suit (p-1)(q-1) degrés de liberté (ou alors k-r-1 avec k groupes/classes, r paramètres estimés).

On note df le degré de liberté qu'il faut vérifier. Si R a échoué
a trouvé le bon degré, on devra faire le calcul manuellement.

.. code:: r

	> temp <- sum((observed-expected)^2/expected)
	> res <- 1-pchisq(temp, df=...vrai_df...)

Test de normalité
------------------

| :code:`Motivation` : tester si une distribution suit une loi normale/gaussienne.

| de **Shapiro-Wilk** : :code:`shapiro.test()`
| de **Anderson-Darling** (package nortest)  : :code:`ad.test()`
| de **Cramer-von Mises** (package nortest) : :code:`cvm.test()`

Droite de Henry
	Il s'agit d'un QQ-Plot mais pour une loi normale. On utilise
	la fonction :code:`qqnorm` pour tracer les points et :code:`qqline`
	pour tracer la droite.

Test de comparaison/sur les proportions
----------------------------------------

| :code:`Motivation` : trouver la proportion d'individus suivant un certain critère

Cas 1 proportion (:code:`prop.test(x,n,p=proba,correct=FALSE)` (ou binom.test))
	On a reçu x succès sur n, p=proba et on veut vérifier si c'est vrai

	Le résultat indique l'intervalle dans lequel peut être p et sa valeur estimée,
	en plus de p-value.

Cas 2 proportions (:code:`prop.test(x=c(x,y), n=c(N1,N2),correct=FALSE)`)
	On a x succès sur N1 et y sur N2.

Tests d'égalités de variances
----------------------------------

de Fisher (2 variances, :code:`var.test(...)`)
	:code:`Prérequis` : test de normalité ok, populations indépendantes

	On peut donner deux dataset (x,y) ou un dataset (data) et un dataset divisé en 2 groupes (formula).

	En gros vous pouvez soit tester la variance en général de deux jeux de données ou alors
	vous pouvez filtrer pour prendre une seule variable, divisée par groupe et tester l'égalité de
	la variance des sous-groupes.

de Bartlett (:code:`bartlett.test(v_quantitatif, v_qualitatif)`)
	:code:`Prérequis` : test de normalité ok, 4 individus minimum par échantillon et pas trop d'échantillons par rapport à leur taille

	On va donner un vecteur de valeurs quantitatives et un vecteur qualitatif (factor) permettant
	de faire des groupes (échantillons) de valeurs du premier vecteur. On va ensuite
	comparer l'égalité de la variance de chaque groupe. Il est moins puissant que Fisher.

Tests d’égalité de moyennes
----------------------------------

On suppose une population de plus de 30 individus ou alors que vous avez fait le test
de normalité.

de Student T à moyenne fixée (:code:`t.test(x=data, alternative="two.sided", mu=valeur)`)
	| :code:`Prérequis` : test de normalité ou plus de 30 individus

	| (2) :code:`t.test(x=data1, y=data2, alternative="two.sided", var.equal=TRUE)`

	Elle consiste a tester si pour un échantillon la moyenne vaut bien mu.

de Student T a deux moyennes (:code:`t.test(x=data1, y=data2, alternative="two.sided", var.equal=TRUE)`)
	| :code:`Prérequis` : test de normalité ou plus de 30 individus, test de variance égales

	On test si la moyenne de deux échantillons est la même.

Tests d’égalité de médiane
----------------------------------

avec le test des signes (:code:`SIGN.test(data, md = médiane, alternative = "two.sided", conf.level = 0.95)`)
	| :code:`Prérequis` : aucun

	La fonction est dans le package :code:`BSDA`.

(SignedRank) de Wilcoxon (:code:`wilcox.test(data, mu = mu, alternative = "two.sided", conf.level = 0.95)`)
	| :code:`Prérequis` : population symétrique

	Test plus puissant que le celui des signes (utilise le rang).

Mann–Whitney U (comparaison de 2 médianes)
	| :code:`Prérequis` : 2 échantillons n1 et n2 avec n1+n2>30, fonctions de répartition (ecdf) ne se croisent pas.
	| :code:`Info` : moyenne :math:`n1(n1+n2+1)/2` et variance :code:`n1n2(n1+n2+1)/12`
	| :code:`wilcox.test(data,alternative = "two.sided", conf.level = 0.95)`

	Aussi appelé Mann–Whitney–Wilcoxon (MWW), Wilcoxon rank-sum test, ou Wilcoxon–Mann–Whitney test.

Test sur les données appariés
-------------------------------

Attention si votre jeu de données contient des données appariés, c'est-à-dire que vous
avez un échantillon A et un échantillon B concernant les mêmes individus (par exemple
a deux moments différents).

Test (de nullité) du coefficient de corrélation linéaire
	| :code:`Prérequis` : test de normalité ou plus de 30 individus, deux variables quantitatives
	| :code:`Résultat` : 0 = corrélation possible, ou valeur entre -1 et 1
	| :code:`Calcul` : :code:`cor.test()` (test de corrélation)

	Matrice des corrélations
		On peut utiliser :code:`cor.mtest(data)$p` du package :code:`corrplot`
		pour voir la matrice des corrélations, avec data une matrice ou un data.frame
		par exemple. On peut voir les corrélations deux à deux.

	On peut utiliser :code:`corrplot(cor(data), method="circle")` ou
	:code:`corrplot(cor(data), method="number")` du package :code:`corrplot`
	pour avoir un aperçu graphique.

Mann–Whitney U (comparaison de 2 médianes)
	| :code:`Prérequis` : aucun
	| :code:`wilcox.test(data_before, data_after, paired=TRUE)`

ANOVA : analyse de la variance
------------------------------------

Anova a permet de comparer une ou plusieurs variables quantitatives
selon une ou plusieurs variables qualitatives. On va donc faire
des groupes de population selon un ou plusieurs critères.

Anova à un critère (n quantitative, 1 qualitative)
	| :code:`Prérequis` : test normalité, égalité des variances (peuvent être omis sous conditions)

	.. code:: R

		anova <- aov(data ~ qualif, data=data)
		summary(anova) # si Pr(>F) < 5% alors différence significative

	Le test compare les moyennes et si il est valide, alors le type (qualification)
	a une influence sur la variable quantitative (data, un dataframe de valeurs).

	Tests (des étendues) de Tukey/test DSH (:code:`TukeyHSD(anova)`)
		Ce test permet de voir si la différence des moyennes est significative ou non.
		On vérifie que "p adj" est supérieur à 5% sinon le test n'est pas valide.

Anova à deux critères (n quantitative, 2 qualitative)
	| :code:`Prérequis` : test normalité, égalité des variances
	| :code:`Exemple` : (Alcool,vitesse) sur risque d’accident

	.. code:: R

		anova <- aov(data ~ qualif1+qualif2+qualif1:qualif2, data=data)
		summary(anova) # si Pr(>F) < 5% alors différence significative

	On fait un test anova, sauf qu'on demande de faire data par qualification1,
	data par qualification2 puis data par qualification1 et qualification2
	(testez `qualif1:qualif2` pour voir le vecteur utilisé).

-----

**Crédits**

	* Nicolas BRUNEL (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* "Initiation à R" de Eric Preud’homme (Université du Havre)
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