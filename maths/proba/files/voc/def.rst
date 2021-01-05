==========================
1.2 Définitions
==========================

Tribu
	:math:`\mathbb{F}` est une tribu sur :math:`\Omega`, soit un ensemble d'éléments de :math:`\Omega`,
	si

		* :math:`\Omega \in \mathbb{F}`
		* la tribu est stable par complémentaire
		* la tribu est stable par union dénombrable

	Dans le cas discret, donc le nombre d'événements est finit, alors la tribu corresponds à :math:`P(\Omega)`
	(l'ensemble des parties d'Omega) donc vous pouvez ignorer cette notion.

Probabilité :code:`❤`
	| Soit un espace de probabilité :math:`(\Omega, F)`.

	Il s'agit d'une application :math:`\mathbb{P}(F) \to [0,1]`, soit les probabilités des éléments de l'ensemble F
	sont toutes comprises dans l'intervalle 0-1 (dit autrement, pour chaque évènement on a une probabilité entre 0 et 1 associé).

	Quelques propriétés :
		* :math:`\mathbb{P}(\Omega) = 1` et :math:`\mathbb{P}(\emptyset) = 0`
		* :math:`\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)`
		* :math:`\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) - \mathbb{P}(A \cap B)`
		* :math:`A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)`

Support :code:`❤`
	On appelle support d'une loi, l'espace de définition d'une loi de probabilité,
	soit le X dans P(X = x).  Proba en dehors = 0

	Cela s'utilise par exemple avec la fonction indicatrice ou pour faire des sommes dans
	le support donc que les valeurs possibles.

Loi de probabilité/Densité de probabilité :code:`❤`
	Il s'agit d'une application, croissante et à valeur positives telle que
	la somme des valeurs fasse 1.

	Donc vous devez démontrer ces 3 propriétés.

	On donne une loi de probabilité : :math:`(\Omega, \mathbb{F}, \mathbb{P})`.