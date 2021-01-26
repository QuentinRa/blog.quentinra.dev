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

2. Particularités du OCaml
=================================

Chaque ligne finit par :code:`;;`. Un commentaire
se fait avec :code:`(* commentaire *)`.

3. Types en OCaml
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

4. Fonctions
=============

Vous pouvez convertir un nombre avec type_to_of_type
donc float_of_int prends un int et retourne un float.

Vous pouvez trouver les valeur min/max avec max_type (ou min_type).

Taille d'une String : String.length(string);

Fonctions maths : ceil, floor, sqrt, expr, log, log10.

5. Variables
=======================

...

-----

**Crédits**
	* Stefania DUMBRAVA (enseignante à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf
	* https://ocaml.org/learn/tutorials/functional_programming.fr.html#Qu-39-est-ce-que-la-programmation-fonctionnelle
	* http://deptinfo.unice.fr/~elozes/PF/