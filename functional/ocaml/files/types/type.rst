=======================
Créer des types
=======================

Il est possible de créer des types, en utilisant :code:`type`
(qui peut également servir à un renommage).

Renommage
***********************

La forme est :code:`type nom_type = ...;;`. Les ... correspondent
à la définition de votre type par exemple :code:`int * int`
pour un couple de deux entiers.

Voici un exemple bidon de renommage de type.

.. code:: ocaml

	(*
		On créé une action qui est une application
		de nombre vers une chaine de caractères.

		On va associer un nombre "code" à une string "action".
	*)
	type action = int * string;;

	(* force le type *)
	let (a:action) = (42, "auto_destruction")

	(* une fonction qui retourne l'action (string) *)
	let get_action (m:action) =
		let (code,action) = m
		in action;;

	get_action a;; (* auto_destruction *)

Création
********************

On peut créer des types depuis rien avec ce qu'on appelle des constructeurs,
le type créé est dit structuré.

On va en fait énumérer les valeurs pouvant être prises par notre type (constructeurs)
et indiquer comment créer des valeurs.

.. code:: ocaml

		type couleurs =
		 | None
		 | Rouge of int
		 | Vert of int
		 | Bleu of int
		 | RGB of (couleurs * couleurs * couleurs)
		;;

		(* création de None *)
		let n = None ;;

		(* création Rouge/Vert/Bleu *)
		let rouge = Rouge(125);;

		(* création RGB *)
		let rgb = RGB(Rouge(5), Vert(150), Bleu(75))

Vous remarquerez que rien n'interdit l'utilisateur de créer des couleurs avec
une valeur non comprise entre 0 et 255, et que rien ne l'oblige à bien mettre R,G,B
dans RGB.