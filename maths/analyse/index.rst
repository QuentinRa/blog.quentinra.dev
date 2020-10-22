.. _analyse:

================================
Analyse numérique
================================

.. warning::

	Ce cours suppose des bases en analyse et en algèbre matriciel

1. Introduction
=================================

1.1 Objectif
**********************

L'objectif est de résoudre numériquement un système linéaire (sl)
et réussir à calculer les valeurs propres d'une matrice.

1.2 Comment résoudre ax=b
***************************

- méthode directe : faire un nombre fini d'opérations
- méthode itérative : approcher x par récurrence

1.3 Problèmes
**********************

Les calculs étant fait sur ordinateurs, il y aura des erreurs. Il faut pouvoir
estimer cette erreur.

	* erreurs arrondi
	* erreur de troncature (calcul de série/suite pour un n fixe)
	* méthode

Les calculs peuvent êtres très longs si le système est très grand. Il faut
connaitre le cout/un ordre d'idée de chaque méthode.

2. Erreurs absolues ou relatives
=================================

Une erreur est une quantité qui mesure si un résultat calculé est numériquement
proche du résultat théorique.

.. note::

	Cette partie nécessite des connaissances sur les normes (:ref:`norme`).


2.1 Erreur absolue
**********************

L'erreur absolue de a (théorie) et b (résultat) se calcule \|a-b\|.

Cependant l'erreur absolu n'est pas suffisante.

	| x=10^{-6}
	| y=2*10^{-6}
	| \|x-y|=10^{-6}=petite erreur sauf que y=2*x.

2.2 Erreur relative
**********************

Formule de l'erreur relative pour A et B : :math:`\frac{|||AB|||}{|||A|||}`.

	| x=10^{-6}
	| y=2*10^{-6}
	| :math:`\frac{|x-y|}{|x|}=1` = pas petit

3. Conditionnement
=================================

...









|
|

-----

**Crédits**
	* Vicent Torri (enseignant à l'ENSIIE)

**Sources**
	* https://fr.wikipedia.org/wiki/Cat%C3%A9gorie:Analyse_num%C3%A9rique
	* latex
		* https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques
		* https://www.commentcamarche.net/contents/620-latex-table-de-caracteres*
		* https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols