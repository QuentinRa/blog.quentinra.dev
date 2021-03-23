===============
Mooc (notes)
===============

Variables de décisions

 	* x,y, ...
	* on cherche les éléments variables de notre modèle

Fonction, dite objective

		* f(x)
		* on cherche les équations dans le modèle associées à chaque variable
		* :math:`f(x) : n x_1 + t^2 x_2 + ...`
		* c'est mieux d'appeler les variables x,y,... plutôt que :math:`x_1, x_2, ...` mais vous verrez souvent cette dernière

Contraintes

 	* :math:`x \in X`
 	* :math:`x + y + z < 1`
 	* ...

Parfois il faut transformer les contraintes ?

	* :math:`x + a \ge 0 <=> \tilde{x} = x + a \ and \ \tilde{x} \ge 0`
	* pratique : si on a une équation égale, on peut la réécrire avec deux équations > et <
	* on peut multiplier par -1 pour changer le signe
	* :math:`x = 0 <=> x >= 0 and x <=0`
	* :math:`x = 0 <=> -x <= 0 and x <=0`
	* :math:`f(x) <= 0 <=> f(x) + y = 0 and y >= 0` (linéaire)
	* :math:`f(x) <= 0 <=> f(x) + y^0` (non linéaire)
	* :code:`x > a <=> x = x^+ - x^-` avec :math:`x^+` et :math:`x^-` contraints à être positifs

Cela permet d'avoir par exemple toutes les variables positives et tous les contraintes négatives.