.. _math_fin:

================================
Mathématiques financières
================================

| :math:`\color{grey}{Version \ 0.0.001}`
| :math:`\color{grey}{Dernière \ édition \ le \ 28/03/2021}`

Cette page contient des notes de mathématiques financière. Attention
toutefois à vérifier la validité de toute ce qui est écrit ici, encore
plus que dans les autres cours.

1. Introduction
===================================

On considère deux types d'actifs (=ce que vous possédez, par opposé à passif=ce que vous devez)

Actif sans risque
	* vous déposez de l'argent à un instant 0
	* vous avez un taux d'intérêt par unité de temps que vous laissez votre argent qui détermine le gain
	* on considère qu'on est dans le cas d'un placement dans une banque, le taux d'intérêt sera fixe

	Soit :math:`r_n` le taux d'intérêt (sans risque), :math:`1` l'argent déposé
	et :math:`i` le nombre de jours

	.. math::

		gain = (1+r_n)^i

	**Note** : je ne sais pas pourquoi mais 1 est toujours la valeur utilisée par la suite.

Actif risqué
	* vous faite des choix qui peuvent vous rapporter de l'argent ou non après un certain temps
	* on considère des actions et des indices financiers

	Soit :math:`i` le nombre de jours, on note :math:`S_{t_i}` le prix d'une action au moment i.
	On va considérer que le prix peut

		* augmenter : :math:`(1+h_n) * S_{t_{i-1}}`
		* diminuer : :math:`(1+b_n) * S_{t_{i-1}}`

	avec :math:`bn \lt r_n \lt h_n`. En gros, aujourd'hui, le prix va augmenter de plus ou
	moins quelque chose par rapport au prix d'hier.

2. Options
============

On introduit une notion de produit dérivé, qui corresponds en autres à la notion d'options.
Il existe deux types d'options (européennes) étudiées ici : achat et vente.

En gros, une personne va vouloir acheter/vendre quelque chose, à un certain
jour T, appelé date de maturité, mais à un certain prix fixé aujourd'hui. Cette personne
veut une assurance qu'il lui permet de ne pas acheter/vendre s'il le prix est plus haut/bas
que sont prix fixé.

	* :math:`T` : date de maturité
	* :math:`K` : prix fixé appelé strike
	* :math:`f(S_{T}) = payoff` : gain/perte à l'instant T

Option d'achat (Call)
	:math:`f(S_T) = max(0, S_T - K)`, ce qui corresponds au fait que si à l'instant
	T, je prix de l'action est plus grand que le prix fixé, alors j'ai un gain
	donc j'achète, sinon j'ai 0 car j'achète pas.

Option de vente (put)
	:math:`f(S_T) = max(0, K-S_T)`, ce qui corresponds au fait que le prix de l'action à diminué
	donc est inférieur au prix que j'ai fixé, donc je vends et j'ai un gain (sinon je vends pas).

3. Objectifs
===============

Notre objectif est de déterminer le montant de la prime de l'assurance, appelé :math:`Price`,
c'est-à-dire combien on doit faire payer au vendeur/acheter pour éviter de perdre
de l'argent en proposant notre assurance sur leurs options.

	* déterminer Price
	* déterminer la couverture (Hedging, investissement pour pouvoir garantir le paiement)

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.fimarkets.com/pages/options.php
	* http://financedemarche.fr/definition/prix-dexercice-dune-option
	* https://financedemarche.fr/finance/comment-calculer-le-prix-dune-option-a-partir-dun-arbre-binomial-simple-exemple-numerique
	* https://askfrance.me/q/quelle-est-la-probabilite-de-risque-neutre-61790284845
	* https://www.ceremade.dauphine.fr/~idris/Intro-fin-math.pdf
	* http://www.excel-modeling.com/examples/example_007.htm
	* https://www.macroption.com/binomial-option-pricing-calculator-cox-ross-rubinstein-model/