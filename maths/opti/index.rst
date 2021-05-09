.. _opti:

==============
Optimisation
==============

| :math:`\color{grey}{Version \ 0.5.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 09/05/2021}`

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

4. optimisation sous contraintes
====================================

Vos étapes, sont depuis le modèle (votre texte avec votre problème)

	#. trouver vos variables de décisions : x,y, ... (pas x1 x2 c'est pas lisible)
	#. trouver la fonction objective : :math:`f(x)`, votre fonction à optimiser, souvent de la forme :math:`f(x) = a x + b y + ...`
	#. trouver d'éventuelles contraintes (:math:`x+y \le 1`, :math:`x \in X`, ...), repérez les

		* au minimum (:math:`... \gt valeur`)
		* au moins (:math:`... \ge valeur`)
		* au plus (:math:`... \le valeur`)
		* au maximum (:math:`... \lt valeur`)

		et vous remplacez "..." par une équation qui génère la contrainte avec vos variables et les données.
		Faites attentions aux contraintes évidentes qui ne sont pas dans le sujet comme le fait que certaines
		ou toutes les variables sont positives... Vous devrez également parfois réécrire les contraintes pour avoir
		uniquement une variable d'un côté et le reste de l'autre.

Vous pouvez généralement réécrire des contraintes de l'énoncé selon
vos préférence ou ce que votre logiciel sait faire. Par exemple

	* :math:`x = 0  \Leftrightarrow  \begin{cases}x \le 0 \\ x \ge 0\end{cases}`
	* :math:`x = 0  \Leftrightarrow  \begin{cases}x \le 0 \\ -x \le 0\end{cases}`
	* :math:`x = 0  \Leftrightarrow  \begin{cases}x + y = 0 \\ y \ge 0\end{cases}` (linéaire)
	* :math:`x = 0  \Leftrightarrow  x + y^2 = 0` (non linéaire)
	* multiplier par :math:`-1` pour changer le signe

Voici les outils à disposition

.. toctree::
   :maxdepth: 1

		Polygone de contraintes      <files/sc/poly>
		Algo du Simplexe             <files/sc/simplex>
		Algo du Simplexe (2 phases)  <files/sc/simplex2>
		Lagrange                     <files/sc/lagrange>

-----

**Crédits**
	* Alain FAYE (enseignant à l'ENSIIE)
	* Dariush GHORBANZADEH (enseignant à l'ENSIIE)
	* Gen'arukami (étudiant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

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
	* https://www.geeksforgeeks.org/uni-variate-optimization-data-science/
	* https://www.geeksforgeeks.org/uni-variate-optimization-vs-multivariate-optimization/
	* https://andrew.gibiansky.com/blog/machine-learning/hessian-free-optimization/
	* https://courses.cs.washington.edu/courses/csep576/18sp/lectures/4_2_optimization.pdf
	* https://medium.com/swlh/gradient-based-optimizations-jacobians-jababians-hessians-b7cbe62d662d
	* https://www.geeksforgeeks.org/multivariate-optimization-gradient-and-hessian/
	* http://adl.stanford.edu/hyperdual/Fike_AIAA-2011-3807.pdf
	* https://www.coursera.org/learn/mathematics-for-economists#syllabus
	* https://www.coursera.org/lecture/mathematics-for-economists/2-13-hessian-matrix-77pUp
	* http://www.cs.toronto.edu/~hinton/csc2515/notes/lec6tutorial.pdf
	* https://www.coursera.org/learn/mathematics-for-economists