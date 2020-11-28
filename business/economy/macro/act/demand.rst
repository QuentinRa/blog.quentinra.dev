=====================================================
4. Analyse économique à court terme - La demande
=====================================================

Variables

	* :code:`C` = Consommation
	* :code:`I` = Investissement
	* :code:`G` = Dépenses de l'état/publiques
	* :code:`NX` = N : importations et X : exportations, aucun ici (économie fermée)

La demande en économie fermée est :code:`D = C + I + G`.

Consommation (C)
	La consommation consiste aux achats de bien et services. L'argent dépensé corresponds
	aux revenus (travail, investissement de capitaux, aides de l'état) moins les impôts.

		* :code:`T` = impôts net : impôts - transferts
		* :code:`Y` = revenu
		* :code:`Yd` = revenu disponible, :code:`Yd = Y - T`

	Les acteurs peuvent consommer ou épargner leur revenu disponible.

		* :code:`S` = épargne
		* :code:`c0` = consommation incompressibles (minimum pour la survie)
		* :code:`c` = valeur entre 0 et 1 qui indique le pourcentage du revenu disponible utilisé pour les autres consommations (propension marginale à consommer)
		* On a donc :code:`C = c0 + c(Y-T) = c0 + cYd`
		* On a donc :code:`S = Y - T - C = Yd - C`

L'investissement (I)
	Il s'agit de l'achat d'immobilisations (nouvelles machines, voiture, ....), soit des biens durables.
	Un investissement est réalisé avec un emprunt donc est influencé par le taux d'intérêt.

	Taux d'intérêt réel : taux d'intérêt nominal (courant) corrigé par l'inflation.

Dépenses de l'état/publiques (G)
	L'état fait des dépenses (G) et prélève des impôts (T).

		* Budget équilibré : :code:`G = T donc T-G=0`
		* Budget excédentaire : :code:`G < T donc T-G>0`
		* Budget déficitaire : :code:`G > T donc T-G<0`