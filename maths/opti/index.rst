.. _opti:

=====================
Optimisation (fast)
=====================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 08/05/2021}`

1. Introduction
=================

L'optimisation c'est depuis une fonction :math:`f`, trouver les extrema soit les valeurs extrêmes
donc le min et le max s'ils existent.

Un problème de recherche d'un maximum d'une fonction :math:`g` c'est pareil qu'un problème de
minimum mais avec la courbe inversée (max devient le min) donc on minimise :math:`f` telle que
:math:`f = -g`.

On a deux situations

	* optimisation sous contraintes (ensemble restreint de valeur)

		* qualification
		* Lagrange
		* Algo du Simplexe

	* optimisation sans contraintes

		* calcul du Hessien
		* méthode des moindre carrés
		* programmation géométrique
		* méthodes itératives (newton, descente de gradient, PFP/Cauchy...)

En particulier, de l'optimisation sous contraintes, plus compliquée, peut parfois être approchée
par de l'optimisation sans contrainte mais seulement si le résultat de l'optimisation respecte
bien vos contraintes.

2. Conditions d'existence
============================

Avant de chercher un minimum, il faut avant tout prouver que la fonction :math:`f` admet un minimum.
Voici quelques cas particuliers pour en démontrer l'existence.

	*

		Si :math:`f` est continue et si :math:`X` est compact (fermé et borné dans :math:`\mathbb{R}^n`)
		alors :math:`\min_{x \in X}f(x)` existe.

	* Si :math:`f` est coercive alors :math:`\min_{x \in X}f(x)` existe
	* Si :math:`f` est bornée inférieurement

On note :math:`x*` nos points critiques, c'est-à-dire les points qui pourraient être notre minimum. On distungue
4 types de points

	* minimum local (point qui est le minimum sur un interval, resp. maximum)
	* minimum global (point qui est le minimum, resp. maximum)
	* point selle (un point bizarre qui corresponds à un changement de la courbe)

Plus d'informations

.. toctree::
   :maxdepth: 1

		Point particuliers            <files/points>

3. optimisation sans contraintes
====================================

.. toctree::
   :maxdepth: 1

		Calcul du Hessien            <files/ssc/hessian>
		Méthode des moindre carrés   <files/ssc/mc>
		Programmation géométrique    <files/ssc/geo>
		Méthodes itératives          <files/ssc/iter>

-----

**Crédits**
	* Alain FAYE (enseignant à l'ENSIIE)
	* Dariush GHORBANZADEH (enseignant à l'ENSIIE)
	* Gen'arukami (étudiant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune