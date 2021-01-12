=========================================
Expression régulières
=========================================

Alternativement aux motifs, il est possible d'utiliser des expressions régulières.

La plupart des motifs existent en regex, sauf

	* :code:`?` (exactement un caractère) a été remplacé par :code:`.`

De nouveaux symbols ont été introduits :

	* :code:`x?` signifie que x est optionnel
	* :code:`x+` signifie au moins une fois x
	* :code:`^x` signifie une ligne qui commence par x
	* :code:`x$` signifie une ligne qui finit par x
	* :code:`x{n, m}` signifie au moins n fois x et au maximum m fois. Notez que n et m sont facultatifs.

.. warning::

	Souvent (pour ne pas dire tout le temps), seulement la partie qui matche (=correspond)
	à votre expression régulière est ~retournée/affichée.

	Pär exemple si vous avez un fichier que que vous exécutez la regex suivant dessus, en affichant
	les matches :code:`x$` : pour chaque ligne qui finit par x, alors  :code:`x` sera affiché (et non
	la vraie ligne qui finie par x).

Vous pouvez grouper des caractères pour leur appliquer une expression régulière en les mettant
entre parenthèses: :code:`(ab)+` signifie au moins une fois :code:`ab`.

Vous pouvez stocker un match dans une variable :code:`^\(.\)`
va stocker dans une variable \1 (ou quelque chose du genre, ça dépends de l'implémentation)
le premier caractère.

