======================
Fusion de données
======================

Fusion
	Attention, pour l'analyse un groupe doit avoir au moins 5 individus et parfois
	au minimum 30 (loi normale). Vous pouvez faire une jointure/fusion avec :code:`merge`
	par exemple si deux jeux de données ont une colonne
	en commun avec :code:`merge(data1, data2, by="nom_colonne")`.

Lissage de Laplace


Méthode du Bootstrap
	Cette partie est revue en tests mais elle permet de faire des tests sur une petit
	échantillon en l'agrandissant.

Données "doubles"
	Il est possible que certaines données aient étés mal rentrées par faute de frappe
	parce qu'on a rentrée 500 fois la même valeur à la main au lieu d'utiliser
	les jointures et un code/id.

	Par exemple imaginons dans vos données [Firefox, mozilla, Mozilla]. Vous pouvez alors les regrouper
	dans un groupe avec :code:`fct_collapse(data, "col" = c("Firefox","mozilla", "Mozilla"))`
	du package :code:`forcats`.