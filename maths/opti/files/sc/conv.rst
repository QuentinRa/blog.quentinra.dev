==========
Convexité
==========

Motivation
	Tout minimum local de f, si f est convexe, est un minimum global de f. Ceci
	est pratique car il est facile de trouver un minimum local.

On peut retenir quelques propriétés

	* :math:`f convexe \Leftrightarrow f' > 0`
	* :math:`f convexe \Leftrightarrow f'' > 0`
	* :math:`f convexe \Leftrightarrow hessien\ semi-défini\ positif`
	* :math:`f strictement\ convexe \Leftrightarrow hessien\ défini\ positif`

Ensemble convexe
******************

On dit qu'un ensemble C est convexe si pour n'importe quel point
a et b dans l'ensemble C, alors le segment :math:`[a,b]` est
dans l'ensemble.

.. image:: /assets/math/opti/u5.png

Ici on voit que pour un ensemble C (en rouge), la figure 1 est
la représentation d'un ensemble convexe mais pas la figure 2 (à cause
du segment en bleu).

Mathématiquement, on écrit ce truc bizarre

	* pour tout segment, :math:`(x,y) \in \mathbb{R}^2`
	* et tout lambda entre 0 et 1, :math:`\lambda \in [0,1]`
	* on a :math:`(1-\lambda)x+\lambda y \in C`

Pour strictement convexe, on exclut les valeurs 0 et 1 (extrémités).

Fonction convexe
********************

Par définition, une fonction est donc convexe si

.. math::

	f((1-\lambda)*x+\lambda*y) = (1-\lambda)*x+\lambda*y

Une autre manière de voir une fonction convexe est de dire que ce
sont les fonctions dont leurs tangentes à la courbe sont en dessous de la courbe.

Une fonction est également convexe si l'ensemble des points au dessus de la courbe
forment un ensemble convexe.

Une fonction convexe

	* est stable par l'addition (deux fonctions convexes donnent par la somme une fonction convexe)
	* est stable par la multiplication par un réel positif
	* :math:`f` est dite concave si :math:`-f` est convexe

Dans les figures, nous avons en vert la courbe représentative de :math:`x^2` et en bleu des tangentes
à la courbe. On voit bien que quelque soit :math:`x`, les tangentes en :math:`x` sont en dessous de la
courbe! Donc l'application :math:`f:\mathbb{R} \rightarrow \mathbb{R}= x^2` est convexe !

	* :download:`figure1 <../../../../assets/math/opti/u7.png>`
	* :download:`figure2 <../../../../assets/math/opti/u8.png>`
	* :download:`figure3 <../../../../assets/math/opti/u9.png>`
	* :download:`figure4 <../../../../assets/math/opti/u10.png>`
	* :download:`figure5 <../../../../assets/math/opti/u11.png>`

