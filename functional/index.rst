.. _functional_cours:

================================
Programmation Fonctionnelle
================================

| :math:`\color{grey}{Version \ 0.1.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/01/2021}`

1. Introduction
===================================

La programmation fonctionnelle suit la logique de programmation
déclarative c'est-à-dire que le code est orienté sur le comment?
plutôt que le quoi? comme dans les langages impératifs (C, JAVA, Python, ...).

Les concepts principaux sont

	* la notion de valeur
	* la notion de fonction (à prendre au sens mathématique)
	* la notion d'expression

Quelques langages fonctionnels : Lisp, les méta langages (SML, CAML, OCAML) et Haskell.

2. Particularités
=====================================

Transparence référentielle
	Au niveau d'une fonction, on attends le respect de la transparence référentielle
	c'est à dire que puisque f(x)=y alors qu'écrire f(x) ou y revient au même. On
	doit donc pouvoir faire f(x)-f(x) donne 0 (ceci n'est pas forcément le cas en dans d'autres
	langages puisque ceci dépends du code de f mais en fonctionnel ceci sera forcément vrai).

Tout est valeur
	On en arrive au point clef : tout est une valeur en programmation fonctionnelle, tout
	le code est un ensemble d'expressions et le programme est le résultat
	de l'évaluation des expressions.

Pureté
	Un appel à la même fonction, avec les mêmes entrées doit retourner la même valeur. Elle dépends
	uniquement de ses arguments. Il n'y a pas d'effet de bord. Le comportement est prévisible. Une fonction
	retourne toujours quelque chose.

Typage implicite
	Un typage est implicite si le type des valeurs n'est pas explicitement écrit dans le code.

Valeur immuables (donc plus de "variables")
	Lorsque vous déclarez une variable et lui donnez une valeur, alors ça valeur ne peut plus
	être modifiée : elle est dite immuable.

3. Avantages
=============================

L'objectif est d'avoir un maximum de code écrit en fonctionnel pur donc qui respect
le critère de pureté.

Ces fonctions pouvant être utilisées peut importe les données en entrées sont
donc réutilisable et donnent du code modulable. Le code est censé être simple
donc facile à debugger (pas toujours le cas).

Facile à utiliser : les concepts sont très basiques donc présents dans tous les langages.

Le fait d'utiliser des valeur immuables vous font généralement écrire moins de code.

-----

**Crédits**
	* Stefania DUMBRAVA (enseignante à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.fil.univ-lille1.fr/~wegrzyno/portail/Elfe/Doc/Cours-PF/cours-1.pdf
	* https://docs.microsoft.com/fr-fr/dotnet/fsharp/introduction-to-functional-programming/
	* https://leblogducodeur.fr/introduction-a-la-programmation-fonctionnelle/