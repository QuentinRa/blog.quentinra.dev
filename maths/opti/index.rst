=====================
Optimisation
=====================

| :math:`\color{grey}{Version \ 0.0.005}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/03/2021}`

.. note::

	Ceci n'est pas un cours de maths, en fait ce n'est même pas un cours. Il s'agit de
	notes que j'ai essayé de faire pour comprendre l'optimisation, prenez en compte mon
	niveau désastreux en maths SVP.

L'optimisation consiste à calculer la valeurs min/max d'une fonction,
c'est-à-dire les extremums.

On l'utilise par exemple en statistiques avec la méthode des moindres
carrés permettant de trouver un maximum de vraisemblance.

On distingue généralement deux cas : avec contraintes (x appartient à un ensemble, ...)
de l'optimisation sans contraintes.

Minimisation
====================

Un problème de maximisation de de g, on peut le voir sous la forme de la minimisation
d'une fonction f tel que :code:`f = -g`.

On note généralement :math:`x^*` le (point x,y) minimum atteint lorsqu'il est unique.

Il existe un minimum si

	* f est continue et coercive (limite +inf : +inf) : :math:`x^*`
	* f est bornée inférieurement

Minimum local
	Si on restreint f sur un interval autour d'un point x, alors le minimum
	est appelé minimum local.

	De ce que j'ai compris, généralement si la courbe fait des vagues (inversées fin haut-bas-haut),
	alors on a un minimum local par vague qui corresponds donc à la valeur la plus basse.

Minimum global
	C'est la plus petite valeur, c'est aussi un minimum local. Généralement ne pas préciser le
	type de minimum implique que c'est un minimum global.

Interval de minima
	Si vous avez votre fonction qui sur un interval reste à la valeur de votre minimum global
	alors cet interval est appelé interval de minima.

Gradient
	Soit :math:`x^*` un minimum local, alors on le gradient de f :math:`\nabla f(x^*) = 0`
	(condition de premier ordre? quezako?).
	Cette condition n'est pas suffisante.

	Nabla : dérivée partielle donc selon une variable, et le gradient (nabla f(x))
	est un vecteur de toutes les dérivées partielles donc selon chaque variable.

	On peut parler de dérivée directionnelle si on multiplie chaque terme par une direction.

Point de selle
	Valeur telle que :math:`\nabla f(x^*) = 0` et la courbe est de signes différents gauche/droite.

Point critique/stationnaire
	Valeur telle que :math:`\nabla f(x) = 0`.

Fonction quadratique
	Il s'agit d'une fonction de la forme :math:`f(x) = \frac{1}{2} x^{*} Qx + g^{*}x + c`
	avec Q une matrice symétrique, ce qui donne :math:`\nabla f(x) = Qx + g` et
	:math:`\nabla^2 f(x) = Q`.

	Si Q est définie positive, :math:`x^* = -Q^{-1} g` est l'unique solution, sinon pas
	de solutions.

Optimisation sans contraintes
=================================

De ce que j'ai compris (je crois), pour

trouver minimum local
	* on a une fonction à minimiser (ou maximiser c'est presque pareil)
	* on va chercher un minimum local
	* on va calculer le gradient (vecteur des dérivées partielles, x1, x2, ...)
	* on cherche un point pour lequel le gradient s'annule : minimum local
	* on calcule le gradient au carré (matrice, Q, cette fois)
	* on calcule Q (remplace les x1,...) avec le minimum local (vecteur de x1, ...)
	* on vérifie que Q est définie positive
	* si oui, alors notre minimum est bien un minimum local

trouver un point critique
	* on doit résoudre gradient = 0
	* donc n équations à n inconnues
	*

		`wolframalpha <https://www.wolframalpha.com/calculators/system-equation-calculator>`_
		peut vous aider si besoin, mais c'est pas mal de le faire soit-même.

Optimisation sous contraintes
=================================

Variable d’écart
	Une variable d’écart est utilisée pour transformer une contrainte d’inégalité en une contrainte
	d’égalité. En gros on ajoute une variable qui ne change pas l'égalité mais qui nous permet
	d'écrire une équation égale à 0 par exemple.

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