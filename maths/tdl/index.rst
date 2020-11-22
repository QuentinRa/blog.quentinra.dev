.. _tdl:

================================
Théorie des langages
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 22/11/2020}`

1. Vocabulaire
===================================

Alphabet
	Un alphabet X est un ensemble (fini) de symboles appelés des lettres.

Mot
	Une suite ordonnée de lettres de l’alphabet (éventuellement vide)

Notations
	* :math:`X^*` : L’ensemble des mots sur l’alphabet X.
	* :math:`\epsilon \ ou \ \land` : Le mot vide
	* :math:`|w|` la longueur d’un mot
	* :math:`|w|_s` Le nombre d’occurrences de la lettre ‘s’ dans un mot "w"
	* puissance :  m^0 = \epsilon \ m^{n+1}=m.m^n
	* identiques : Deux mots sont égaux, s’ils sont de la même longueur et s’ils ont des lettres identiques de positionnement identiques.

(X^*, .)
	* associatif :math:`\forall{x,y,z} \in X^* \ \ \ (xy)z = x(yz)`
	* élément neutre : :math:`\epsilon`
	* \|w.z\| = \|w| + \|z|

Facteurs (de :math:`\epsilon` à mot)
	* Préfixes : On part de la gauche, un nombre croissant de lettres. (1,2,..)
	* Suffixes : On part de la droite, un nombre croissante de lettres. (1,2,..)
	* Facteurs : ensemble de toutes les combinaisons possibles de lettres

	Ex : X = { a, b} w=babb

		*	préfixes : :math:`\epsilon`, b, ba, bab, babb
		*	suffixes : :math:`\epsilon`, b, bb, abb, babb
		*	facteurs : :math:`\epsilon`, b, a, ab, ba, bb, bab, abb, babb

Monoïde
	On a une unique représentation d’un mot dans X.

2. Définition d'un langage
===================================

Un langage L sur X est un ensemble de mots formés sur l’alphabet.

Ex : X = { a, b }

	* :math:`\emptyset` est un langage
	* {:math:`\epsilon`} est un langage
	*	{ a, ba, ababa } est un langage
	*	{:math:`\epsilon` , a , :math:`a^2` , :math:`a^3`, … } = { :math:`a^n` } est un langage
	*	{ :math:`\epsilon`, ab, aabb, aaabb, … } = { :math:`a^nb^m` } est un langage

Opérations

	* Union : :math:`L1 \cup L2` : tous les mots qui sont dans L1 et L2 sans doublons
	* Intersection : :math:`L1 \cap L2` : Tous les mots qui sont dans L1 et L2
	* Complémentaire : :math:`\overline{L_1}` tous les mots qui ne sont pas dans L1
	* Concaténation/Produit : L1.L2 : concaténation de chacun des éléments de L1 avec tous ceux de L2
	*
		L’étoile (fermeture de Kleene) du langage L (i.e le monoïde engendré par L) : Si L est un langage alors
		L* est le plus petit langage qui le contienne ainsi que :math:`\epsilon` et qui soit stable
		(concaténation ne quitte pas l’ensemble L). On note :math:`L^* = U_{n \ge 0}Ln`

	* Fermeture positive du langage : :math:`L^+ = U_{n≥1}Ln`

3. Automates
======================

Pour représenter toutes les mots que peuvent prendre un langage ainsi que
pour faire des calculs, on passe généralement par un diagramme appelé automate,
c'est-à-dire ayant des états et des transitions qui permettent de passer
d'un état à un autre.

.. toctree::
		:maxdepth: 1

		Automate fini déterministe (AFD)      <automates/afd>
		Automate fini non-déterministe (AFND) <automates/afnd>

4. Expression régulières
==============================

X un alphabet disjoint (pas joint : rien en commun) de :math:`Y = { (,),…,+,*, \emptyset , \epsilon }`
alors les expressions régulières sur X sont

	* les lettres de :math:`X, \emptyset , \epsilon`
	* Si x et y sont des expressions régulières alors (x+y), x.y, :math:`x^*`

Le théorème de Kleene affirme que les expressions régulières représentent exactement les langages rationnels.

+ est idempotent (x+x = x) , commutatif, associatif, d’élément neutre :math:`\emptyset`

. est associatif, d’élément neutre :math:`\epsilon`  et :math:`\emptyset` est absorbant.

Propriétés

	* :math:`r^* = \epsilon + r.r^*`
	* :math:`(r1^*r2)^*.r1^* = (r1+r2)^* = r1^*(r2r1^*)^*`
	* :math:`r1 = r1^*\ ssi\ r1 = r2 et \epsilon \in r1`

Théorème d’Arden
	Soit r1 et r2 des expressions régulières alors l’équation :

	.. math::

		{\color{red}x} = r1.{\color{red}x} + r2

	admet l’unique solution :math:`r1^*.r2` ssi :math:`\epsilon` n’appartient pas à r1.

5. Dérivation (=résidus)
=============================

En dérivant, le reste constitue les mots qui commencent par cette/ces lettre(s).

:math:`D_{lettres}(mot)`
	tous les mots qui commencent par lettres après leur avoir retiré lettres.

Propriétés

	* :math:`D_{lettres}(lettres) = \epsilon`
	* :math:`D_{xy}(mot) = D_{y}(D_{x}(mot))`
	* :math:`D_{\epsilon}(mot) = mot`
	* :math:`D_a(r1+r2) = D_a(r1) + D_a(r2)`
	* :math:`D_a(r1.r2) = D_a(r1).r2 + {\delta}(r1).D_a(r2)`
	* :math:`D_a(r1.r2) = D_a(r1).r2 + {\delta}(r1).D_a(r2)` avec :math:`\delta(r1) = \epsilon \ si \ \epsilon \in r\ sinon \ \emptyset` (absorbant dans le produit)
	* :math:`D_a(r1^*) = D_a(r1).r1^*`

Ex :

	* :math:`D_a(ab + b) = ( b + \emptyset ) = b`
	* :math:`D_a(b) = \emptyset`

-----

**Crédits**
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Jérémy POSSAMAÏ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune