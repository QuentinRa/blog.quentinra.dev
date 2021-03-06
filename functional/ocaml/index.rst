.. _ocaml:

================================
OCaml
================================

| :math:`\color{grey}{Version \ 0.7.12}`
| :math:`\color{grey}{Dernière \ édition \ le \ 06/03/2021}`

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
se fait avec :code:`(* commentaire *)`.

Attention, tout étant nombre, faites attention aux règles
de priorité (appel de fonction sera fait avant un un calcul, etc.).
Mettez des parenthèses si besoin. Par exemple, on mettra toujours généralement (-1)
et non -1 dans un appel de fonction car ocaml croira sinon que l'on
veut passer en argument - (fonction) et 1 (nombre) et non -1.

2. Types en OCaml
==========================

Les types sont

	* int (entier a, hexadécimal 0x29a), float (réel, a.b)
	* bool (booléen donc true/false)
	* char (caractère, \'A\'), string (chaine, \"Hello\")
	* unit : type qui contient uniquement ()

Vous avez aussi les types "joker" par exemple :code:`'a` pour n'importe
quel type (vous pouvez mettre b, c, ...). Ce sera beaucoup utilisé dans
les listes ou si vous regardez les types de certaines fonctions.

On ne peut faire des opérations que entre éléments du même type.
Alternativement, chaque type à ses propres symboles

	* entiers : :code:`+, -, *, /` et :code:`mod` (modulo)
	* flottants : :code:`+., -., *., /.` et :code:`**` (puissance)
	* string : :code:`^` (concaténation)
	* booléens : not, && (et logique), || (ou logique)
	* listes : :code:`@` (concaténation)
	* tous : :code:`>, >=, <, <=, = (égal), <> (différent)`
	* on utilise :code:`not` pour inverser un booléen
	* on utilise :code:`==` (et :code:`!=`) pour comparer des adresses

Vous pouvez convertir un nombre avec :code:`<type_to>_of_<type>`
donc float_of_int prends un int et retourne un float.

Taille d'une String : :code:`String.length(string)`.

3. Fonctions utiles
=====================

Fonctions maths

	* réels : ceil, floor, sqrt, expr, log, log10.
	* entiers : abs, succ, pred.
	* comparaison : min, max, compare

Affichage

	* les fonctions print_type (print_int, ...)
	* les fonctions print_endline (affiche un texte avec \n), ...
	* Printf.printf (utiliser format comme en c)
	* Ex: :code:`Printf.printf "float: %f\n" 5.0`

Lecture

	* fonction read_line : récupérer une ligne de texte
	* fonction Scanf.scanf (utiliser format comme en c)
	* Ex : :code:`Scanf.scanf "%d" (fun x -> x)`

4. Variables
=======================

On utilise let pour déclarer une variable : :code:`let <nom> = <expr>`.

Notes

	* une variable peut ne pas avoir de nom, on mets alors :code:`_` comme nom (ex: :code:`let _ = print_endline "Hello, world!";;`)
	* vous devez donner une valeur a une variable
	* si une variable n'a pas été déclarée, alors vous aurez l'erreur : Unbound value <nom>.
	* le nom commence forcément par une minuscule (sinon erreur : Unbound constructor)

Vous pouvez déclarer plusieurs variables avec and : :code:`let ...=... and ... = ...`
par exemple :code:`let x = 5 and y = 7;;`

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
	* else obligatoire (par défaut le type est unit donc ça bloque car types différents)
	* utilisation (ex) : :code:`let rep = (if valeur=2 then "oui" else "non")`.

5. Types complexes et match
==============================

.. toctree::
	 :maxdepth: 1

		Couplets/Types composites <files/types/cpl>
		Créer des types           <files/types/type>
		Matching/Filtrage         <files/types/match>
		Listes                    <files/types/list>

6. Coder ses fonctions
========================

En OCaml, on déclare des fonctions avec fun. Certaines peuvent êtres récursives
et s'appeler elles-même (utiliser le mot clef rec).

.. toctree::
	 :maxdepth: 1

			Fonctions                <files/fun/index>
			Fonctions (explicites)   <files/fun/exp>
			Fonctions récursives     <files/fun/rec>
			Fonctions accumulatrices <files/fun/acc>

Généralement, une fonction pouvant être stockée dans une variable, on peut
faire des fonctions dites partielles (voilà un exemple complet, regroupant
les accumulateurs, la récursion, et les fonctions partielles car c'est important)

.. code:: ocaml

		(* recursive using accumulator, x = number and k = power and return x^k
		exemple: puissance 5 3
		- p_acc 1 5 3
		- p_acc 1*5 5 2
		- p_acc 5*5 5 1
		- p_acc 25*5 5 0
		- k=0, returns 125
		*)
		let puissance x k =
		 (* cumul function, r = result, x = number, k = power. evaluated as r. *)
		 let rec p_acc r x k =
		  if( k = 0 )
		  then r (* end, return accumulator *)
		  (* store in r new result and decrease k *)
		  else p_acc (r*x) x (k-1)
		 in p_acc 1 x k (* first call, r = 1 and x=x and k=k *)
		;;

		(* partial function of puissance x k, when k = 2 *)
		let carre x = puissance x 2;;

		carre 5 ;; (* same as puissance 5 2 *)
		puissance 5 2;;
		puissance 5 3;;

7. Exceptions
==================

Les exceptions sont le résultat de comportements exceptionnels donc par exemple
des erreurs comme une division par zéro. Elles sont généralement utilisées

	* pour indiquer une erreur (argument invalide, ...)
	* mettre fin à un calcul (terminé mais impossible de quitter facilement, ou si erreur)
	* pour possiblement changer de branche d'exécution du code (voir après le try with)

Pour créer une exception, vous devez utiliser :code:`exception NomException;;`.
Pour lever une exception, vous devez utiliser :code:`raise NomException;;`.

Vous pouvez également ajouter un message d'erreur (un code, ...) :
:code:`exception NomException of string`.

.. code:: ocaml

	exception NomException of string;;
	raise (NomException "erreur inconnue");;

Vous pouvez capturer une exception avec un bloc try with, notez que le with
marche comme un match !

.. code:: ocaml

		exception NomException of string;;
		try
		 raise (NomException "erreur inconnue")
		with
		| NomException(e) -> "Erreur : "^e
		| _ -> failwith "Unknown"

On note le failwith pour quitter avec erreur. Il existe aussi une exception
invalid_arg si un argument est invalide.

8. Exercices
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
	* https://try.ocamlpro.com/
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-2.pdf
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-3.pdf
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-4.pdf
	* http://web4.ensiie.fr/~stefania.dumbrava/IPF2021/cours.html
	* http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPRF/
	* https://ocaml.org/learn/tutorials/functional_programming.fr.html#Qu-39-est-ce-que-la-programmation-fonctionnelle
	* http://deptinfo.unice.fr/~elozes/PF/
	* https://thealmarty.com/2018/09/25/lambda-calculus-in-ocaml-fun-and-function/
	* https://dune.build/
	* http://adv-r.had.co.nz/Functional-programming.html
	* https://caml.inria.fr/pub/docs/manual-ocaml/index.html#sec6
	* https://ocaml.org/docs/install.html#From-Source
	* https://ocaml.org/docs/install.html#Windows
	* https://fdopen.github.io/opam-repository-mingw/
	* https://github.com/ocaml/opam-repository/issues/12050
	* https://github.com/ocaml/ocaml
	* https://reasonml-editor.github.io/reasonml-idea-plugin/docs/get-started/project-configuration
	* https://ocamlverse.github.io/content/quickstart_ocaml_project_dune.html
	* https://dune.readthedocs.io/en/stable/
	* https://discuss.ocaml.org/t/ideal-ocaml-setups-with-vim-emacs-intellij-idea/4037