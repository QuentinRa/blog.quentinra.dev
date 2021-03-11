=====================
Optimisation
=====================

| :math:`\color{grey}{Version \ 0.0.005}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/03/2021}`

.. note::

	Ceci n'est pas un cours de maths, en fait ce n'est même pas un cours. Il s'agit de
	notes que j'ai essayé de faire pour comprendre l'optimisation.

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
	Soit :math:`x^*` un minimum local, alors on le gradient de f :math:`\nabla f(x^*) = 0`.
	Cette condition n'est pas suffisante.

	Nabla : dérivée partielle donc selon une variable, et le gradient (nabla f(x))
	est un vecteur de toutes les dérivées partielles donc selon chaque variable.

	On peut parler de dérivée directionnelle si on multiplie chaque terme par une direction.

Point de selle
	Valeur telle :math:`\nabla f(x^*) = 0` et la courbe est de signe différents gauche/droite.

Fonction quadratique

Optimisation sous contraintes
=================================

Variable d’écart
	Une variable d’écart est utilisée pour transformer une contrainte d’inégalité en une contrainte
	d’égalité. En gros on ajoute une variable qui ne change pas l'égalité mais qui nous permet
	d'écrire une équation égale à 0 par exemple.