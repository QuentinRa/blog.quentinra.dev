===========================
Polygone de contraintes
===========================

Vous avez des contraintes, toutes fonctionnelles donc avec

	* :math:`x \le ...` (ou autre signe)
	* :math:`y \le ...` (ou autre signe)

Vous allez donc pouvoir, pour chaque équation tracer une droite, par exemple

.. math::

	y \le 3/5 * x + 7

Ce qui donne

		* L'ordonnée à l'origine vaut 7 donc on a un premier point x=0 et y=7.
		* le ratio est : depuis l'origine, avant de 5 x augmente y de 3
		*

			enfin mettez une petite flèche vers le bas depuis la droite pour vous rappelez que vous
			vous intéressez à la partie en dessous

Une fois toutes les droites tracés, utilisez les flèches pour délimiter l'espace des contraintes
appelé :code:`Polygone de contraintes`.

L'un des sommets du polygone est possiblement l'une des solutions donc le maximum/minimum.
Il suffit de tester tous les points critiques dans la fonction.

C'est une propriété du cours ou qui vient du ciel mais qui dit qu'un extremum est soit aux extrémités soit
dans l'interval. Cette technique reste sympa et très rapide.

.. note::

	Si vous avez un point dont vous ne savez pas la coordonnée (ne tombe pas pile) alors vu qu'il est à l'intersection
	de deux droites, il suffit de résoudre un système avec l'équation de chaque droite.

	Attention toutefois aux fait que certaines valeurs doivent être entière, en partiel un nombre à virgule pour parler
	de la quantité d'ordinateurs par exemple n'a pas de sens.