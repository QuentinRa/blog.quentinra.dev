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

Liste et filtrage
---------------------

...