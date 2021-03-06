===========================
Manipulation des Arbres
===========================

Je pense que connaitre le patron Iterator (design patterns) peut
aider mais sinon un arbre c'est juste des branches contenant des feuilles
et des feuilles.

.. code:: ocaml

		type 'a arbre =
		| Lf
		| Br of 'a * ('a arbre list)

Les **Arbres Quaternaires** sont un type d'arbre sous la forme de carrés
de taille 2^n * 2^n.

Par exemple un Arbres Quaternaires avec uniquement des carrés noir et blanc, on aurait un type

.. code:: ocaml

		(* Arbres Quaternaires *)
		type quad =
		| White (* carré blanc *)
		| Black (* carré noir *)
		(* on décide de découper notre image en carrés de 4x4
		Attention c'est des quads donc c'est peut être un carré de 4 cases
		contenant encore des carrés de quatre case.
		*)
		| Node of quad * quad * quad * quad