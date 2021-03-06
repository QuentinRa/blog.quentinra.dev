============
Listes
============

Le type d'une liste est :code:`'a list` donc une liste
d'élément dont le type est :code:`'a` (donc n'importe quel type).

Une liste est de la forme : :code:`a::b::[]`

	* a,b, ... sont des éléments de la liste
	* [] est une liste vide

La logique est que l'élément tout à droite (ici []) est forcément une liste,
et que les éléments a,b, ... sont les éléments que vous voulez mettre dans la liste.
L'évaluation de cette expression est une liste contenant a et b.

Création
---------------------

.. code:: ocaml

	(* création d'une liste *)
	let l = 1::3::[] ;;
	(* résultat : un liste d'entiers avec 1 et 3 *)
	(* val l : int list = [1; 3] ;; *)

	(* ajout à une liste existante *)
	let l2 = 5::l;;
	(* résultat : un liste d'entiers avec 5, 1 et 3 *)
	(* val l2 : int list = [5; 1; 3] ;; *)

Une liste est une structure FIFO donc vous ne pouvez ajouter des éléments qu'au début,
mais on pourra bidouiller pour obtenir ce qu'on veut plus tard.

On rappelle maintenant que vous pouvez concaténer des chaines
donc par exemple :code:`let l3 = l@[5]` pour mettre 5 à la fin.

Itérateurs et parcours
------------------------

List.map : appliquer une fonction sur tous les éléments de la liste
	| Forme : :code:`List.map ('a -> 'b) -> 'a list -> 'b list` (fonction f(a)=b et liste a et retourne liste b)
	| Exemple : :code:`let l3_square = List.map (fun x -> x * x) l3;`

List.mem : true si élément dans liste sinon false
	| Forme : :code:`List.mem 'a -> 'a list -> bool` (nombre et liste et retourne booléen)
	| Exemple : :code:`let is_5_in_l3 = List.mem 5 l3;;`

List.hd : premier élément d'une liste
	| Forme : :code:`List.hd 'a -> 'a list -> bool` (liste et retourne nombre)
	| Exemple : :code:`let x = List.hd l3;; (* 1 *)`

List.tl : tout sauf le premier élément d'une liste
	| Forme : :code:`List.tl 'a list -> 'a list` (liste et retourne liste)
	| Exemple : :code:`let y = List.tl l3;; (* [3;5] *)`

List.rev : inverser une liste
	| Forme : :code:`List.rev 'a list -> 'a list` (liste et retourne liste)
	| Exemple (dernier élément) : :code:`let z = List.hd (List.rev l3);;`
	| Exemple inversion : :code:`let l3_rev = List.rev l3;;`
	| Exemple ajout_fin : :code:`let l4 = let l4 = List.rev ( 9 ::(List.rev l3) );;`

List.concat : pareil que @, concaténation de deux listes
	| Forme : :code:`List.concat 'a list list -> 'a list` (liste de listes et retourne liste)
	| Exemple : :code:`let l5 = List.concat [l2;l3];;`

List.length : taille d'une liste
	| Forme : :code:`List.length l3`

Plus de fonctions ici : https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html.

Liste et filtrage
---------------------

On a des constructeurs comme [] : liste vide, a::l pour un élément a suivit d'une liste l
ou encore a::[] pour un élément a suivit d'une liste vide, ... La structure
généralement utilisée est la suivante

.. code:: ocaml

		let rec in_liste (e:'a) (l:'a list) = match l with
		 | [] -> false
		 (* we split l in a list looking like a::l' so an element and then a list

		 this is used to put the first element in a, and the rest of the list in l'

		 names are meaningless, you could have done b::z or _::l' like we care, if you wanted
		 the two first, you could do a::b::l' etc.
		 *)
		 | a::l' -> if a = e then true else in_liste e l'
		;;