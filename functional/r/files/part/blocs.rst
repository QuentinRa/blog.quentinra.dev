===============================
Note sur les blocs
===============================

Tout d'abord, il faut savoir qu'un bloc donc :code:`{ du code }`
est évalué par R comme la valeur de la dernière expression.

.. code:: R

	> y <- 6
	> f <- { x <- 5 * y }
	> x
	30
	> f
	30

On voit également que les variables du bloc sont accessibles dehors (et inversement).

On rappelle que que vous pouvez mettre plusieurs instructions sur une même ligne avec un :code:`;`,
si besoin.