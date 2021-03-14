=========
Calcul
=========

Les étapes sont :

	* calculer  :math:`\lambda{I_n}-A_n`
	* résoudre :math:`det(\lambda{I_n}-A_n) = 0` et trouver les lambda (valeurs propres)
	* les valeurs propres forment la matrice diagonale D
	* On pose :math:`A = \lambda x`
	*
		On résout l'équation précédent pour chacune des valeurs propres (remplace \lambda).
		On obtient des vecteurs x :math:`(x_1, ..., x_1)`
	* en mettant tous les vecteurs à côté on obtient la matrice P
	* calculer :math:`P^{-1}`
	* (optionnel) on vérifie que :math:`P*D^1*P^{-1}=A`

.. note::

	L'ordre des :math:`\lambda` n'a pas d'importance, mais une fois choisi numérotez vos lambda.

	Le :math:`\lambda` en 1,1 (:math:`\lambda_1`) dans D donne le vecteur i,1 dans P etc.