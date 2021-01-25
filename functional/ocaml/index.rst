.. _ocaml:

================================
OCaml
================================

| :math:`\color{grey}{Version \ 0.1.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/01/2021}`

1. Introduction
===================================

Le OCaml (Objective-Caml) est un langage fonctionnel
de la famille des Méta langages. Il n'est pas complètement
pur et possède des variables mutables.

Vous pouvez

	* compiler un fichier .ml
	* lancer ocaml et taper des expressions
	* Exécuter des instructions en ligne : https://try.ocamlpro.com/

Vous aurez besoin de la commande :code:`ocaml` qui s'installe facilement sous linux.

	* :code:`sudo apt-get update;`
	* :code:`sudo apt-get install ocaml;`

Sous Windows, j'ai installé une WSL (windows store -> debian) puis

	* faire les commandes sous linux
	* faire :code:`sudo apt-get update;sudo apt-get install sublime-text;`
	* installer Xming (+Xming Fonts : http://www.straightrunning.com/XmingNotes/ voir tableau)
	* enfin tester Ocaml
	* :code:`ocaml` (CTRL-D) pour quitter, si c'est bon alors ok
	* lancez Xming (à refaire à chaque démarrage)
	* :code:`subl -c` pour lancer la version graphique de sublime text.
	* :code:`emacs -c` pour lancer la version graphique d'emacs (si installé).

Vous avez un compilateur bytecode : :code:`ocamlc`. Pour compiler, faire
comme en c (-o pour renommer, ...).

2. Particularités du OCaml
=================================

Chaque ligne finit par :code:`;;`.

3. Exploration
==========================

On utilise l'interpréteur OCAML. On tape nos expressions après le :code:`#`.

Chaque expression retourne quelque chose de la forme :code:`nom : type = valeur`.

	* nom : nom de la variable ou - si anonyme
	* type : int, float, bool ...

-----

**Crédits**
	* Stefania DUMBRAVA (enseignante à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf
	* https://ocaml.org/learn/tutorials/functional_programming.fr.html#Qu-39-est-ce-que-la-programmation-fonctionnelle
	* http://deptinfo.unice.fr/~elozes/PF/