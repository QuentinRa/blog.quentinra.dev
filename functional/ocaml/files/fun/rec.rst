======================
Fonction récursive
======================

Il suffit de déclarer la fonction (variable) avec le mot clef :code:`rec`.
Ensuite dans le code de la fonction, vous utilisez un if (branchement) avec un branche
récursive et une branche non récursive.

.. code:: ocaml

		(* fonction qui calcule la factorielle de n donc n! récursivement. non terminale *)
		let rec fact = fun n -> if n = 0 then 1 else n * fact (n - 1) ;;
		fact 5 ;;

Attention, on rappelle au programmeur qu'il doit documenter sa fonction
en particulier indiquer les branches possibles ainsi que de décrire
si sa fonction est terminale/non terminale.

	* terminale : la fonction va normalement s'arrêter un jour
	* non terminale : sur de gros valeurs, la mémoire va être pleine donc non terminale

Dans les faits, une fonction est non terminale généralement si pour
c'est chaque appel attends une suite d'appels pour s'exécuter. Pour faire
une factorielle récursive terminale, on devra utiliser un accumulateur (voir
partie suivante).