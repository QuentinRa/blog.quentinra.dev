=======================
Point particuliers
=======================

Récapitulatif

	* :math:`x*` minimum global si et seulement si pour tout :math:`x \in X f(x*) \geq f(x)`
	* :math:`x*` minimum local si et seulement il existe :math:`\epsilon > 0` tel que pour tout :math:`x \in X \cap B(x*,\epsilon) f(x*) \geq f(x)`
	* :math:`x*` est dit un point critique si :math:`\nabla f(x*)=0`

Les minimums sont stricts si les inégalités sont strictes (<) dès que :math:`x \neq x*`.

Minimum global
*****************

C'est la plus petite valeur, c'est aussi un minimum local. Généralement ne pas préciser le
type de minimum implique que c'est un minimum global.

Interval de minima
	Si vous avez votre fonction qui sur un interval reste à la valeur de votre minimum global
	alors cet interval est appelé interval de minima.

Et on parle de minimum (optimum) global strict s'il n'y a qu'un seul minimum global
donc :code:`x \in X f(x*) \gt f(x)`.

Minimum local
***************

Si on restreint f sur un interval epsilon autour d'un point x, alors le minimum
est appelé minimum local.

De ce que j'ai compris, généralement si la courbe fait des vagues (monte-descend-monte),
alors on a un minimum local par vague qui corresponds donc à la valeur la plus basse
de la vague.

On parle de minimum (optimum) local strict s'il n'y a qu'un seul minimum local dans le voisinage epsilon
de :math:`x*` avec
:math:`\epsilon > 0` tel que pour tout :math:`x \in X \cap B(x*,\epsilon) f(x*) \gt f(x)`

Point selle et point critique
*********************************

Point critique/stationnaire
	:math:`x*` est un point critique si :math:`\nabla f(x*) = 0`.

		:code:`IMPORTANT`

		Soit :math:`x* \in X`

			*

				Si :math:`x*` est un point critique et :math:`Hf(x*)` est définie positive,
				alors :math:`x*` est un minimum local strict.

			*

				Si :math:`x*` est un point critique et :math:`Hf(z)` est semi-définie positive
				pour tout :math:`z \in X`, alors :math:`x*` est un minimum global.

Point de selle
	:math:`x*` est un point selle de :math:`f` ssi :math:`x*` est un point critique et
	:math:`Hf(x*)` est indéfini.

		Sous ces conditions

			* Il existe une direction :math:`d_{1}` de descente pour :math:`f` en partant de :math:`x*`
			* Il existe une direction :math:`d_{2}` de montée pour :math:`f` en partant de :math:`x*`

		D’où l’appellation de point selle

	Je crois qu'une façon visuelle de la voir est de trouver un point tel que
	:math:`\nabla f(x*) = 0` et la courbe est de signes différents gauche/droite.

