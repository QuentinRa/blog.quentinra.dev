=====================
Optimisation
=====================

| :math:`\color{grey}{Version \ 0.0.005}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/03/2021}`

1. Introduction
=================

L'optimisation consiste à calculer la valeurs min/max d'une fonction,
c'est-à-dire les extremums.

Un problème de maximisation de de g, on peut le voir sous la forme de la minimisation
d'une fonction f tel que :code:`f = -g`.

On distingue généralement deux cas : l'optimisation avec contraintes (x appartient à un ensemble, ...)
de l'optimisation sans contraintes.

On cherche à minimiser une fonction :math:`f` (à :math:`n` variables réelles sous diverses contraintes).
Nous noterons :math:`x*` la solution du problème,
ie :math:`x* \in X` vérifie :math:`f(x*)=min_{x \in X}{f(x)}`.

.. toctree::
   :maxdepth: 1

		Vocabulaire       <files/voc>

2. Conditions d'existence
============================

Avant de chercher un minimum, il faut avant tout prouver que la fonction :math:`f` admet un minimum.
Voici quelques cas particuliers pour en démontrer l'existence.

	*

		Si :math:`f` est continue et si :math:`X` est compact (fermé et borné dans :math:`\mathbb{R}^n`)
		alors :math:`min {f(x), x\in X}` existe.

	* Si f est coercive alors :math:`min {f(x), x\in X}` existe.

3. Extrema d'une fonction sans contraintes
===============================================

Les fonctions que nous considérons dépendent, en général de plusieurs variables,
d'où la nécessité de définir le gradient (:math:`\nabla` nabla)
et le hessien (:math:`Hf(x)`) d'une fonction :math:`f`.

.. math::

	\nabla f(x)= \begin{pmatrix}
  \frac{\partial f}{\partial x_{1}} \\
  \frac{\partial f}{\partial x_{2}} \\
  \vdots  \\
  \frac{\partial f}{\partial x_{n}}
	\end{pmatrix}

.. math::

	Hf(x)= \begin{pmatrix}
	\frac{\partial f}{\partial x_{1}\partial x_{1}} & \cdots & \frac{\partial f}{\partial x_{1}\partial x_{n}} \\
	\frac{\partial f}{\partial x_{2}\partial x_{1}} & \cdots & \frac{\partial f}{\partial x_{2}\partial x_{n}} \\
	\vdots & \ddots & \vdots \\
	\frac{\partial f}{\partial x_{n}\partial x_{1}} & \cdots & \frac{\partial f}{\partial x_{n}\partial x_{n}}
	\end{pmatrix}

.. hint::

	Exemple: Soit :math:`f(x)=x_{1}^2 + 4x_{2}^2 - x_{1}x_{2} + 2x_{1} - 3x_{2}`

	Pour la première ligne du hessien, on dérive :math:`f` par rapport à :math:`x_{1}`.
	Et pour la seconde, par rapport à :math:`x_{2}`.

	On obtient alors :math:`\nabla f(x)= \begin{pmatrix} 2x_{1}- x_{2} + 2 \\ 8x_{2} - x_{1} - 3\end{pmatrix}`

	Pour le hessien, on obtient  :math:`Hf(x)= \begin{pmatrix} 2 & -1 \\ -1 & 8 \end{pmatrix}`

	Remarquez que la matrice est symétrique (Théorème de Schwarz:
	:math:`\frac{\partial f}{\partial x\partial y}=\frac{\partial f}{\partial y\partial x}`).


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