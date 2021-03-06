==========================
Matching/Filtrage
==========================

Lorsque vous avez des types structurés (dont la création
a été abordée dans la partie précédente) mais il en existe
déjà comme les listes, vous pouvez utilisez match
qui est un peu comme un switch en C.

Le match c'est une dinguerie, vous allez l'utiliser très souvent dans
des fonctions !

Le match prends des "case" qui sont forcément des constructeurs
donc par exemple avec le type couleur, on pourrait faire.

.. code:: ocaml

		(* retourne le taux de rouge d'une couleur *)
		let rec extract_r_value color = match color with
		 | Rouge(r) -> r
		 (* appel récursif pour récupérer r *)
		 | RGB(r,_,_) -> extract_r_value r
		 (* plusieurs branches pareilles *)
		 | Vert(_) | Bleu(_) | None -> 0
		;;

		(* tests avec nos variables créées plus tôt *)
		extract_r_value rouge;; (* 125 : ok *)
		extract_r_value rgb;; (* 5 : ok *)
		extract_r_value n;; (* 0 : ok *)

Certains programmeurs font des match sur des entiers, c'est une mauvaise pratique
de ce que j'ai compris car ce ne sont pas des constructeurs. En tout cas
on doit toujours faire des matchs sur un constructeur et pas une valeur.

Pour synthétiser

	* :code:`match variable with` : faire le match
	* :code:`| Constructeur` : si un constructeur sans of
	* :code:`| Constructeur (valeur)` : si un constructeur avec of
	* :code:`| Constructeur1 | Constructeur2` : plusieurs cas, une seul cas
	* :code:`_` : cas par défaut