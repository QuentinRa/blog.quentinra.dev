========================
Fonction (explicites)
========================

Généralement, en OCaml on ne donne jamais explicitement
les types des arguments mais bon vous pouvez le faire.

.. code:: ocaml

		(* exemple avec le calcul d'un prod de r1 et r2 *)
		let prod (r1:float) (r2:float) : float =
			r1 *. r2
		;;

		prod 2.0 4.0;; (* appel, retourne 8.0 *)
		prod 2.0 (-4.0);; (* retourne -8.0 *)

Vous remarquerez qu'ici c'est inutile car :code:`*.` ne marche
qu'avec des floats donc le compilateur aurait déjà bronché.

On peut faire des trucs plus compliqués, bien que l'exemple suivant
ne soit pas du tout pertinent

.. code:: ocaml

	(* prends une valeur et une fonction et appelle la fonction avec valeur *)
	let process (v:'a) (f:'a -> 'b) : 'b = f v ;;

	(* appelle process avec 5 et fonction carré : retourne 25 *)
	process 5 (fun x -> x*x)