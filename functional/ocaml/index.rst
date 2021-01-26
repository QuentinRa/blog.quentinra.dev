.. _ocaml:

================================
OCaml
================================

| :math:`\color{grey}{Version \ 0.3.5}`
| :math:`\color{grey}{Dernière \ édition \ le \ 26/01/2021}`

1. Introduction
===================================

Le OCaml (Objective-Caml) est un langage fonctionnel
de la famille des Méta langages. Il n'est pas complètement
pur et possède des variables mutables.

Vous pouvez

	* compiler un fichier .ml
	* lancer ocaml et taper des expressions
	* Exécuter des instructions en ligne : https://try.ocamlpro.com/

.. toctree::
	 :maxdepth: 1

		Installation OCaml (Linux)     <files/i_linux>
		Installation OCaml (Windows)   <files/i_win>
		Interpréteur                   <files/inter>

Chaque ligne finit par :code:`;;` (optionnel dans certains cas). Un commentaire
se fait avec :code:`(* commentaire *)`. Si un truc
marche pas, peut être essayer de mettre des parenthèses
(donc pour explicitement déclarer les arguments/les différentes valeur
donc comme en maths).

Attention, tout étant nombre, faites attention aux règles
de priorité (appel de fonction sera fait avant un un calcul, etc.).
Mettez des parenthèses si besoin. Pareil -1 est considéré comme
la soustraction pas le nombre négatif donc il faut mettre des parenthèses.

2. Types en OCaml
==========================

On ne peut faire des opérations que entre éléments du même type.
Alternativement, chaque type à ses propres symboles

	* entiers :code:`+, -, *, /` et :code:`mod` (modulo)
	* flottants :code:`+., -., *., /.`
	* string :code:`^` (concaténation)
	* booléens : not, && (et logique), || (ou logique)
	* tous : :code:`>, >=, <, <=, = (égal), != (différent), <> (différent)`

Les types sont

	* int (entier a), float (réel, a.b)
	* bool (booléen donc true/false)
	* char (caractère, \'A\'), string (chaine, \"Hello\")
	* unit : type qui contient uniquement ()

3. Fonctions utiles
=====================

Vous pouvez convertir un nombre avec :code:`<type_to>_of_<type>`
donc float_of_int prends un int et retourne un float.

Vous pouvez trouver les valeur min/max avec :code:`max_type` (ou :code:`min_type`).

Taille d'une String : :code:`String.length(string)`;

Fonctions maths : ceil, floor, sqrt, expr, log, log10.

Affichage

	* les fonctions print_type (print_int, ...)
	* les fonctions print_endline (affiche un texte avec \n), ...
	* Printf.printf (utiliser format comme en c)
	* Ex: :code:`Printf.printf "float: %f\n" (5.0)`

4. Variables
=======================

On utilise let pour déclarer une variable : :code:`let <nom> = <expr>`.

Notes

	* une variable peut ne pas avoir de nom, on mets alors :code:`_` comme nom
	* vous devez donner une valeur
	* si une variable n'a pas été déclarée, alors vous aurez l'erreur : Unbound value <nom>.
	* le nom commence forcément par une minuscule (sinon erreur : Unbound constructor)

Vous pouvez déclarer plusieurs variables avec and : :code:`let ...=... and ... = ...`.

Jusqu'à présent, les variables étaient dites globales donc utilisables partout.
Il est possible de déclarer une variable locale, qui n'existera
que dans la déclaration d'une autre variable : :code:`let nom=valeur in expr`.

Cette déclaration n'a d'utilité que si valeur est complexe donc
on peut directement utiliser nom dans expression pour faire un calcul.

.. code:: ocaml

		let x=5.0/.15.0 in x*x*5; (* calcul complexe *)
		(* on peut sauvegarder le résultat *)
		let res = (let x=5.0/.15.0 in x*x*5)

Il est possible d'utiliser l'opérande ternaire/expression conditionnelle
pour donner une valeur (donc le condition?valeur1:valeur2 en c). Ici on a
:code:`if bool the valeur1 else valeur2`.

	* valeur1 et valeur 2 sont du même type
	* else obligatoire (par défaut le type est unit donc ça bloque selon 1)
	* utilisation (ex) : :code:`let rep = (if valeur=2 then "oui" else "non")`.

5. Coder ses fonctions
========================

On utilise la forme :code:`function entrée -> code`. La fonction
devra ensuite être stockée dans une variable qui servira à l'appeler.
On peut utiliser :code:`fun` plutôt que :code:`function`

.. code:: ocaml

	(* exemple avec le calcul de diam depuis un r *)
	let diam = function r -> r *. r ;; (* déclaration *)
	diam 2.0 (* appel, retourne 4.0 *)
	diam (2.0) (* pareil *)
	(* print_float (diam 2.0) pour afficher *)

On peut directement écrire :code:`let var entrée = entrée * entrée`
mais c'est du sucre syntaxique (donc une syntaxe réduite qui fait pareil).

Il est possible d'avoir plusieurs paramètres à une fonction, séparés
par une virgule (:code:`function (x,y,...) -> code` et :code:`nom (arg1, ...)`.

On peut aussi réécrire la fonction en une fonction
de fonction de ...

.. code:: ocaml

	let somme_x_y = function x -> (function y -> x + y) ;;
	somme_x_y (5) (8) ;; (* la fonction prends 2 arguments *)
	let somme_5_y = somme_x_y (5) ;;
	somme_5_y 8 ;; (* pareil que somme_x_y (5) (8) *)

6. Autres points
=================

Fonction récursive
	Il suffit de déclarer la fonction (variable) avec le mot clef :code:`rec`.
	Ensuite dans le code de la fonction, vous utilisez un if (branchement) avec un branche
	récursive et une branche non récursive.

	.. code:: ocaml

		let rec fact = function n -> if n = 0 then 1 else n * fact (n - 1) ;;
		fact 5 ;;

Boucle
	On peut modéliser une boucle avec une fonction récursive.

	.. code:: ocaml

		let boucle n =
		 (
			let rec boucle_i =
			 function (i) ->
				if i = n
				 then ()
				else
				begin
				 (* du code de la boucle *)
				 print_string(string_of_int (i)^"\n");
				 boucle_i(i+1);
				end
			 in boucle_i (0)
		 );;

		boucle 5

Couplets/Types composites
	En fait lorsque vous faites (valeur1, valeur2) par exemple lors d'un appel de fonction,
	vous créez un type de type (type valeur 1, type valeur 2). Vous pouvez ainsi créer
	autant de types de voulu. Les valeurs n'ont pas besoin d'avoir le même type.

	.. code:: ocaml

		# let (a,b,c) = (5, "test", 3.0) ;;
		int * string * float = (5, "test", 3.)

7. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Introduction          <exercices/intro>

-----

**Crédits**
	* Stefania DUMBRAVA (enseignante à l'ENSIIE)
	* Julien FOREST (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-2.pdf
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-3.pdf
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-4.pdf
	* https://ocaml.org/learn/tutorials/functional_programming.fr.html#Qu-39-est-ce-que-la-programmation-fonctionnelle
	* http://deptinfo.unice.fr/~elozes/PF/