===========================================
Fonctions, citoyens de première classe
===========================================

On utilise la forme :code:`fun entrée -> code`. La fonction
devra ensuite être stockée dans une variable qui servira à l'appeler.
On peut utiliser :code:`function` plutôt que :code:`fun` mais ce n'est
pas recommandé car cela ne fait pas la même chose (voir lambda expressions).

.. code:: ocaml

		(* exemple avec le calcul d'un prod de r1 et r2 *)
		let prod = fun r1 r2 -> r1 *. r2 ;; (* déclaration *)
		prod 2.0 4.0;; (* appel, retourne 8.0 *)
		prod 2.0 (-4.0);; (* retourne -8.0 *)
		(* print_float (prod 2.0 4.0) pour afficher *)

On peut directement écrire une fonction :code:`let prod r1 r2 = r1 *. r2;;`
mais c'est du sucre syntaxique (donc une syntaxe réduite qui fait pareil).

.. note::

		Une fonction prends toujours un seul argument
		donc en fait une fonction à n-argument c'est un fonction qui prend
		un seul argument qui est l'appel de la fonction avec n-1 argument
		donc on a des fonctions de fonctions de ... On parle de termes d'ordre
		supérieur lorsqu'on passe une fonction en argument.