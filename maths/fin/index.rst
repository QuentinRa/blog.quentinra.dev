.. _math_fin:

================================
Mathématiques financières
================================

| :math:`\color{grey}{Version \ 0.0.007}`
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

Actif risqué
	* vous faite des choix qui peuvent vous rapporter de l'argent ou non après un certain temps
	* on considère des actions et des indices financiers

2. Options
============

On introduit une notion de produit dérivé, qui corresponds en autres à la notion d'options.
Il existe deux types d'options (européennes) étudiées ici : achat et vente.

En gros, une personne va vouloir acheter/vendre quelque chose, à un certain
jour T, appelé date de maturité, mais à un certain prix fixé aujourd'hui. Cette personne
veut une assurance qu'il lui permet de ne pas acheter/vendre s'il le prix est plus haut/bas
que sont prix fixé.

	* :math:`T` : date de maturité
	* :math:`K` : prix fixé appelé strike, c'est une constante
	* :math:`S_T` : prix de l'action à l'instant T (variable aléatoire)
	* :math:`f(S_{T}) = payoff`, corresponds à votre potentiel gain si vous décidez de vendre/acheter

Option d'achat (Call)
	:math:`f(S_T) = max(0, S_T - K)`, ce qui corresponds au fait que si à l'instant
	T, je prix de l'action est plus grand que le prix fixé, alors j'ai un gain
	donc j'achète, sinon j'ai 0 car j'achète pas.

Option de vente (Put)
	:math:`f(S_T) = max(0, K-S_T)`, ce qui corresponds au fait que le prix de l'action à diminué
	donc est inférieur au prix que j'ai fixé, donc je vends et j'ai un gain (sinon je vends pas).

3. Objectifs
===============

Notre objectif est de déterminer le montant de la prime de l'assurance, appelé :math:`Price`,
c'est-à-dire combien on doit faire payer au vendeur/acheter pour éviter de perdre
de l'argent en proposant notre assurance sur leurs options.

	* déterminer Price
	* déterminer la couverture (Hedging, investissement pour pouvoir garantir le paiement)

4. Modèle de Cox-Ross-Rubinstein
====================================

On va considérer quelques variables pour la suite

	* :math:`i` : écoulement du temps (souvent en jour pour l'instant), aussi appelé pas, allant de 0 à N
	* :math:`t_i` : instant i
	* :math:`1` : valeur 1, montant initial (?)

Prix de l'actif sans risque (à l'instant i)
	Soit :math:`r_N` le taux d'intérêt (sans risque)

	.. math::

		Prix^{(N)} = (1+r_N)^N

Prix de l'actif risqué (à l'instant i)
	On rappelle :math:`S_{t_i}` pour le prix d'une action au moment i. On va considérer que le prix peut

		* augmenter : :math:`(1+h_n) * S_{t_{i-1}}` avec :math:`h_N` le coefficient d'augmentation (hausse)
		* diminuer : :math:`(1+b_n) * S_{t_{i-1}}` avec :math:`b_N` le coefficient de diminution (baisse)

	et :math:`b_N \lt r_N \lt h_N`. En gros, aujourd'hui, le prix va augmenter de plus ou
	moins quelque chose par rapport au prix d'hier.

	En fait, pour calculer le prix de l'actif risqué de demain, on a toujours deux branches
	avec nos deux cas (monte/baisse). On ces deux cas :math:`T_i` (un truc prends deux valeurs donc soit
	:math:`1+h_N`, soit :math:`1+b_N`, et c'est à l'instant i) ce qui vous donne

	.. math::

		S_{t_i} = S_{t_{i-1}} * T_i\ (pareil\ que\ S^{(N)}_{t_i} = S_{t_{i-1}} * T_i)

	Soit le prix de l'action à l'instant i corresponds au prix de l'action à i-1 multiplié
	par le coefficient d'augmentation/diminution. Ce coefficient est déterminé selon un probabilité
	:math:`q_{N}`, la probabilité d'avoir un gain, ce qui donne :math:`1-q_{N}` la probabilité
	d'avoir une perte.

	On obtient donc enfin notre formule pour calculer le prix, qui
	corresponds à

	.. math::

		Prix^{(N)} = \frac{1}{(1+r_N)^N} * \mathbb{E}_{\mathbb{Q}} [f(S_{t_N})]

	avec

		* :math:`f` : fonction de l'option
		* :math:`\mathbb{Q}` : risque neutre, probabilité marginal, blah blah blah...
		*

			on divise par :math:`(1+r_N)^N` pour une correction du taux d'intérêt, car on peut pas comparer
			le prix de demain/aujourd'hui sans prendre en compte ce taux

	Pour calculer l'espérance, on fait

		* probabilité d'avoir une valeur (regarder les branches de l'arbre, faites le produit)
		* multipliée par la valeur en question (le résultat de notre fonction)
		* multiplié par le nombre de permutations

	Ce qui donne :math:`S_T = s * (1 + h_N)^X * (1 + b_N)^{N-X}`, soit une loi binomiale
	avec X le nombre de succès, N le nombre d'épreuves et :math:`q_N` la probabilité.

	Cette méthode n'étant pas optimale, on peut essayer de faire le calcul récursivement.

-----

**Crédits**
	* Sergio PULIDO (enseignant à l'ENSIIE)
	* Cyril BENEZET (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.fimarkets.com/pages/options.php
	* http://financedemarche.fr/definition/prix-dexercice-dune-option
	* https://financedemarche.fr/finance/comment-calculer-le-prix-dune-option-a-partir-dun-arbre-binomial-simple-exemple-numerique
	* https://askfrance.me/q/quelle-est-la-probabilite-de-risque-neutre-61790284845
	* https://www.ceremade.dauphine.fr/~idris/Intro-fin-math.pdf
	* http://www.excel-modeling.com/examples/example_007.htm
	* https://www.macroption.com/binomial-option-pricing-calculator-cox-ross-rubinstein-model/
	* https://www.youtube.com/watch?v=Wg9NosasB1w&ab_channel=spulidon