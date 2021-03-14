==========================
Bases de cycles/cocycles
==========================

Base de cycles
	On considère l'ensemble des arrêtes V ordonné. On note chaque cycle
	est comme un ensemble qui associe à chaque arrête une valeur : 0,1,-1.

		* 0 : si le cycle ne parcours par l'arrête
		* 1 : si le cycle parcours l'arrête dans le bon sens
		* -1 : si le cycle parcours l'arrête dans le sens inverse

	On note un cycle :math:`C_n = (0, ...,1,-1)`

	Une base de cycles B est un ensemble de cycles, tels
	que la base de cycles est libre et génératrice.

	On note :math:`\mu(G)` (mu) le nombre d'éléments d'une base de cycle,
	appelé nombre cyclomatique. :math:`\mu(μ(G) = m − n + p` avec n sommets m arcs et p composantes
	connexes.

Base de cocycles
	On appelle cocycle de A, l'ensemble des arcs incidents à A,
	noté :math:`\omega{(A)}`. On associe à chaque arc une valeur

  	* 0 : si le cocycle ne parcours par l'arrête
  	* 1 : si le cocycle parcours l'arrête dans le bon sens
  	* -1 : si le cocycle parcours l'arrête dans le sens inverse

  .. hint::

   	En gros il faut que les sommets du cocycles soit incidents à tous les autres

  Une base de cycle est un ensemble de cocycles, tel que la base
  soit libre et génératrice.

	On note :math:`\gamma(G)` (gamma) le nombre d'éléments d'une base de cocycle,
	appelé nombre cocyclomatique. :math:`\gamma(μ(G) = n - p` avec n sommets et p composantes
	connexes.