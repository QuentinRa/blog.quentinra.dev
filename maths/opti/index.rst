=====================
Optimisation
=====================

| :math:`\color{grey}{Version \ 0.0.012}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/03/2021}`

.. note::

	Ceci n'est pas un cours de maths, en fait ce n'est même pas un cours. Il s'agit d'un brouillon
	qui est encore moins mature que celui de stats (vraiment très peu de sources).

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

Vos étapes, sont depuis le modèle (votre texte avec votre problème)

	* trouver vos variables de décisions : x,y, ... (pas x1 x2 c'est pas lisible)
	* trouver la fonction objective : :math:`f(x)`, votre fonction à optimiser, souvent de la forme :math:`f(x) = a x + b y + ...`
	* trouver d'éventuelles contraintes (:math:`x+y \le 1`, :math:`x \in X`, ...)

Une fois ceci fait, vous aurez probablement à adapter votre système, pour que votre logiciel puisse le lire
(par exemple certains ne supporte que des contraintes :math:`\le` donc pas de :math:`=` ou :math:`\ge`...).
Puis ce que ce n'est pas le sujet principal, l'implémentation venant en dernier, regardez
la partie 5 si c'est votre objectif.

3. Extrema d'une fonction sans contraintes
===============================================

On va ici introduire pleins de notions, du style

	* il existe plein de minimums différents (local, global, point de selle)
	* trouver des points critiques
	* la forme quadratique, utilisée pour trouver un minimum

Toutes ces notions reposent la notion de :math:`x*` et sur la notion
de gradient :math:`\nabla f(x*)` soit le vecteur des dérivées partielles
et :math:`Hf` la matrice hessienne des dérivées partielles.

.. toctree::
   :maxdepth: 1

		Hessien et gradient          <files/sc/grad>
		Point particuliers           <files/sc/opt>
		Forme quadratique            <files/sc/quadra>

Selon le théorème Calistro

	* vous avez votre fonction et vos variables à optimiser
	* vous allez calculer le gradient, en dérivant nos fonction selon chaque variable
	* vous allez cherche des points critiques, soit des valeurs pour lesquels f(x) s'annule
	* ???
	* Pour chaque point trouvé

		* on calcule le hessien ?
		* si le hessien est

			* définit positif : minimum local (strict?)
			* semi-définit positif : ne pas pas conclure
			* indéfini : pas un extremum

	* s'il n'existe qu'un seul minimum (et convexe), alors c'est le minimum global

Prouver la convexité ?

	* (cours) si hessien défini positif alors convexe (pas réciproque)

4. Extrema d'une fonction sous contraintes
===============================================

...

5. Réécrire un système
========================

Je n'ai encore jamais fait d'optimisation en pratique, mais j'ai retenu les règles
de transformation suivantes

Transformation en :math:`\ge`.
	Ceci est utilisé si vous voulez avoir uniquement des contraintes :math:`\ge 0`

		* :math:`x + a \ge 0  \Leftrightarrow  \begin{cases}\tilde{x} = x + a \\\tilde{x} \ge 0\end{cases}`
		* :math:`x \ge a  \Leftrightarrow  \begin{cases}x = x^+ - x^- \\ x^+ \ge 0\\ x^- \ge 0\end{cases}`

Transformation du :math:`=`
	Ceci est utilisé si vous voulez avoir uniquement des contraintes :math:`\ge 0` et math:`\le 0`

	* :math:`x = 0  \Leftrightarrow  \begin{cases}x \le 0 \\ x \ge 0\end{cases}`
	* :math:`x = 0  \Leftrightarrow  \begin{cases}x \le 0 \\ -x \le 0\end{cases}`
	* :math:`f(x) = 0  \Leftrightarrow  \begin{cases}f(x) + y = 0 \\ y \ge 0\end{cases}` (linéaire)
	* :math:`f(x) = 0  \Leftrightarrow  f(x) + y^2 = 0` (non linéaire)

Autres

	* multiplier par :math:`-1` pour changer le signe

------

**Crédits**
	* ??? (étudiant à l'ENSIIE)
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