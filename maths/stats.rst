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
sont appelés variables et les lignes (i) sont les individus. La valeur i,j corresponds
à la valeur de la variable j pour l'individu i.

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
		* :code:`head()` : le début donc les premières valeurs
		* :code:`dim()` : savoir combien de lignes=individus/colonnes=variables on manipule
		* :code:`names()` : savoir les noms des variables manipulées
		* :code:`str()` : voir les types des variables et une idée des valeurs prises
		* :code:`complete.cases()` : le nombre de lignes sans NA donc ok
		* D'autres fonctions : :code:`var, sd, quantile, ...`

	* Objectif 3 : présentation

		* Ici on risque généralement de transformer les données
		* par exemple changer un type de variable (quantitative -> qualitatif ou inverse)
		* faire des vérifications (indépendance ou corrélation, ...)

	* Objectif 4 : trouver une loi

		* on peut faire un histogramme, un diagramme de points, ...
		* on peut superposer une loi pour tester
		* on peut observer les moments
		* pour chercher la loi, on peut essayer des trucs comme

			* si la moyenne est 3 : une loi de poisson de paramètre 3
			* ...

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
	* **Student t** : fonction :code:`t`
	* **Uniforme** : fonction :code:`unif`
	* **Weibull** : fonction :code:`weibull`

Donc si on veut calculer :math:`P(X \le k)` on utilise une fonction de type
p. Si on veut calculer :math:`P(X \gt k)` alors on fait :code:`1-fonction_de_type_p`.
Enfin si on veut calculer :math:`P(X = k)` alors on utilise une fonction de type d.

4. Statistiques descriptives
==================================

...