==========================
Matching/Filtrage
==========================

Lorsque vous avez des types structurés (dont la création
a été abordée dans la partie précédente) mais il en existe
déjà comme les listes, vous pouvez utilisez match
qui est un peu comme un switch en C.

Le match prends des "case" qui sont forcément des constructeurs
donc par exemple avec le type couleur, on pourrait faire.

.. code:: ocaml

		(* retourne le taux de rouge d'une couleur *)
		let rec extract_r_value color = match color with
		 | Rouge(r) -> r
		 | RGB(r,_,_) -> extract_r_value r
		 | Vert(_) -> 0
		 | Bleu(_) -> 0
		 | None -> 0
		;;