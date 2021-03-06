========================
Fonction accumulatrices
========================

On rappelle que une fonction retourne le résultat de son évaluation,
par exemple f(2) si f(x) = x+1 retourne 3. Donc il n'y a pas de return
mais la dernière expression est le résultat.

Les fonctions accumulatrices sont des fonctions dans une fonction
qui vont contenir une variable stockant le résultat du calcul et
qui sera "retournée" à la fin.

.. code:: ocaml

		(* fibonacci function, recursive using accumulator *)
		let fibonacci n =
		 (* process Fibonacci function, a = result *)
		 let rec process i a b =
		 if i = n
		 then a
		 (* next call, increase i and update a (and b) *)
		 else process (i+1) b (a+b)
		in process 0 0 1;; (* first call, process i=0 a=0 and b=1 *)

		fibonacci 25;; // 75025 : ok

On peut modéliser une boucle avec une fonction récursive (c'est juste pour l'idée).

.. code:: ocaml

		let boucle n =
		 let rec bfor i =
			if i = n
			then () (* needed since we only print something in this example *)
			else
			 begin
				(* du code de la boucle *)
				(* ... *)
				(* print i *)
				print_string(string_of_int (i)^"\n");
				(* next *)
				bfor(i+1);
			 end
		 in bfor 0 (* start with i=0 *)
		;;

		boucle 5;;

		(* alternative, i = start, c = function to tells us if we needed to stop *)
		let myfor i c =
		 let rec process i =
			if c i
			then (* next *)
			 begin
						(* du code de la boucle *)
				(* ... *)
				(* print i *)
				print_string(string_of_int (i)^"\n");
				(* next *)
				process (i+1);
			 end
			else ()
		 in process i
		;;

		myfor 0 (fun i -> i < 5);;