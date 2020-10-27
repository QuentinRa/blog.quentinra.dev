.. _macro:

================================
Macroéconomie
================================

.. warning::

	Ce cours sera un jour déplacé dans une autre section, car il n'a rien
	à faire là.

1. Définition et Objectifs
================================

L'économie est divisée en plusieurs "niveaux" ayant chacun des économistes spécialisés
(travail, croissance, publique, extérieur, environnemental, éducation, ...).

1.1 Définitions
****************

Agent (économique rationnel)
	achète un maximum de biens, dépense tout son budget pour être un maximum satisfait

Macroéconomie
	La macroéconomie est l'étude de l'économie à grande échelle (états, ...)
	en observant l'épargne, le PIB, les investissements, la consommation, la croissance, la
	stabilité des prix... appelés agrégats économiques.

microéconomie
	Par opposition à la macroéconomie, la microéconomie est l'étude à petite échelle soit l'activité économique
	des ménages, entreprises...

La gestion économique consiste à étudier pourquoi les agents économiques ont fait tel ou tel choix.
Notamment étudier pourquoi les ressources qui sont finies et limités sont utilisés de tel façon.

1.2 Objectifs
****************

Le macroéconomiste poursuit quatre objectifs majeurs :

		* **comptabilité macroéconomique** : déterminer des agrégats expliquant les mouvements de groupes d'agents
		* **lois macroéconomiques** : déterminer des rapports stables dans le temps
		* **modélisation macroéconomique** : analyse des déséquilibres/changements des agrégats (chômage, ...)
		* **politique économique** : moyens pour corriger les déséquilibre et atteindre des objectifs fixés.

Objectif : Modélisation mathématique de l’économie

La macroéconomie est divisée entre deux grandes familles :

	* la logique Keynésienne : tout part de la demande, l'état doit intervenir [#1]_ pour réguler le marché
	* la logique Néoclassique : tout part de l'offre, le marché s'auto-régule

.. [#1] augmentation des dépenses publiques, variation des taux d'intérêts de la banque centrale...

Plus récemment, une troisième école est apparue, la synthèse moderne qui concilie les deux autres écoles.
Pour être précis, elle accepte que les logiques Keynésienne et Néoclassique existent à court terme
mais que seule la logique Néoclassique existe à moyen terme.

2. Variables clefs
================================

.. note::

	Afin de mesurer l'économie, on introduit des variables pour abstraire des types de données

		* variables endogènes : elles sont calculées dans le model, donc à partir de variables exogènes
		* variables exogènes : elles sont calculées à partir de données extérieures

2.1 Produit intérieur brut
*****************************

Le Produit intérieur brut (PIB) est un indicateur de l'activité économique d'un PIB, ainsi
que de sa croissance, la variable associée est :code:`Yt`.

Il y a trois façons de considérer le PIB d’une économie :

		* le PIB est la valeur des biens et services finaux produits dans l’économie
		* le PIB est la somme des valeurs ajoutées
		* le PIB est la somme des revenus dans une économie

.. note::

	Les valeurs ajoutées notées :code:`VA` sont le chiffre d'affaires notée :code:`CA` moins
	les consommations intermédiaires (matériaux d'une autre Entreprise etc..) notées :code:`CI`

On distingue également deux PIB :

	* PIB réel ou PIB à prix constant : on ne tient pas compte des variations des prix donc quantité*prix constant
	* PIB nominal ou PIB à prix courant : on tient compte des variations des prix donc quantité*prix courant

2.2 Taux de chômage
*****************************

Le taux de chômage (:code:`u`) est le rapport entre le nombre de chômeurs (:code:`U`) et
la population active (:code:`L`) donc :code:`u = U/L`.

La population active (:code:`L`) correspond à la somme du nombre de chômeurs (:code:`U`)
et des non-chômeurs (:code:`N`) donc :code:`L = U + N`.

2.3 Taux d'inflation
*****************************

L'inflation correspond à une augmentation soutenue du niveau des prix.

Le taux d'inflation est le taux d'augmentation de l'inflation donc du niveau des prix.

|
|

-----

**Crédits**
	* Nessrine OMRANI (enseignante à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://business.toutcomment.com/article/differences-entre-macroeconomie-et-microeconomie-269.html
	* https://fr.wikipedia.org/wiki/Carr%C3%A9_magique_de_Kaldor (carré de compétitivité de Kaldor)
	* https://fr.wikipedia.org/wiki/%C3%89conomie_(discipline)