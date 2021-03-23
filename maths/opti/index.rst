=====================
Optimisation
=====================

| :math:`\color{grey}{Version \ 0.0.012}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/03/2021}`

.. note::

	Ceci n'est pas un cours de maths, en fait ce n'est même pas un cours. Il s'agit d'un brouillon
	qui est encore moins mature que celui de stats (vraiment très peu ed sources).

1. Introduction
=================

L'optimisation consiste à calculer la valeurs min/max d'une fonction,
c'est-à-dire les extremums.

Un problème de maximisation de de g, on peut le voir sous la forme de la minimisation
d'une fonction f tel que :code:`f = -g`.

On distingue généralement deux cas : l'optimisation avec contraintes (x appartient à un ensemble, ...)
de l'optimisation sans contraintes.

On cherche à minimiser une fonction :math:`f` (à :math:`n` variables réelles sous diverses contraintes).

Nous noterons :math:`x*` la solution du problème (le point (x,y) minimum atteint),
ie :math:`x* \in X` vérifie :math:`f(x*)=min_{x \in X}{f(x)}`.

.. toctree::
   :maxdepth: 1

		Vocabulaire                   <files/voc>
		Développement de taylor       <files/taylor>

2. Conditions d'existence
============================

Avant de chercher un minimum, il faut avant tout prouver que la fonction :math:`f` admet un minimum.
Voici quelques cas particuliers pour en démontrer l'existence.

	*

		Si :math:`f` est continue et si :math:`X` est compact (fermé et borné dans :math:`\mathbb{R}^n`)
		alors :math:`\min_{x \in X}f(x)` existe.

	* Si :math:`f` est coercive alors :math:`\min_{x \in X}f(x)` existe
	* Si :math:`f` est bornée inférieurement

3. Extrema d'une fonction sans contraintes
===============================================

On va ici introduire pleins de notions, du style

	* il existe plein de minimums différents (local, global, point de selle)
	* trouver des points critiques
	* la forme quadratique, utilisée pour trouver un minimum

Toutes ces notions reposent la notion de :math:`x*` et sur la notion
de gradient :code:`\nable` soit le vecteur des dérivées partielles
et :code:`Hf` la matrice hessienne des dérivées partielles.

.. toctree::
   :maxdepth: 1

		Hessien et gradient          <files/grad>
		Condition d'optimalité       <files/opt>
		Forme quadratique            <files/quadra>

------

**Crédits**
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://www.fun-mooc.fr/c4x/MinesTelecom/04006/asset/T%C3%A9l%C3%A9com_FBD_S3_AnalysePartie1_V3.pdf
	* http://jybaudot.fr/Optimisations/ptscritiques.html
	* https://transp-or.epfl.ch/courses/OptSim2017/Slides/02-draws.pdf
	* https://transp-or.epfl.ch/courses/optimization2012/slides/01-introduction.pdf
	* https://transp-or.epfl.ch/courses/OptSim2012/slides/02-unconstrained.pdf
	* https://transp-or.epfl.ch/optimization/slides/03-optimalite.pdf
	* https://transp-or.epfl.ch/optimization/slides/07-optimisation-lineaire.pdf
	* https://transp-or.epfl.ch/courses/OptSim2013/slides/08-unconstrained.pdf
	* https://transp-or.epfl.ch/courses/OptSim2016/Slides/09-markov.pdf
	* https://transp-or.epfl.ch/courses/optimization2012/slides/12-resume-sanscontrainte.pdf
	* https://transp-or.epfl.ch/courses/optimization2011/slides.php
	* https://www.ceremade.dauphine.fr/~gontier/Publications/methodesNumeriques.pdf
	* https://perso.math.univ-toulouse.fr/lagnoux/files/2013/12/CoursOpt.pdf
	* https://www.alloprof.qc.ca/fr/eleves/bv/mathematiques/resoudre-un-probleme-d-optimisation-m1092