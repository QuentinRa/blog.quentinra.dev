.. _sl:

================================
Écrire du code meilleur
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/02/2021}`

1. Introduction
======================

L'objectif est décrire du meilleur code donc qui soit lisible, efficace, fonctionnel
et enfin réutilisable. Vous avez des outils connus et vus dans d'autres cours comme

	* les tests
	* les patrons de conception (design pattern)
	* les frameworks

Mais il existe aussi des philosophies qui seront synthétisées dans ce cours.

2. Concepts en Vrac
=======================

Don't repeat yourself (DRY)
	On peut citer Don't repeat yourself (DRY) qui est lié au principe que si vous copiez
	du code dans 99% du temps vous êtes en train de faire une erreur.

Keep it simple, stupid (KISS)
	Un logiciel marche s'il est simple donc le code doit lui aussi être simple.


2. Méthode SOLID
====================

La méthode SOLID est un méthode pour écrire du meilleur code en OrientéObjet (OO) et qui consiste à

	* S (Single) : une classe/méthode fait une seule chose
	* O (Open/Closed) : si on veut modifier une classe alors on en hérite, on ne modifie pas le code existant
	* L (Liskov substitution) : méthode polymorphes (les enfants marchent aussi si les parents marchent)
	* I (Interfaces segregation) : faire plein de petites interfaces plutôt qu'une grande
	* D (Dependencies inversion) : utiliser des interfaces/classes abstraites, découper le code en niveaux

3. SuckLess
=========================

Le site https://suckless.org/ vous aide à faire des "software that sucks less".

Par exemple

	* tous les :code:`{` sur la même ligne que le if, for, ... et :code:`}` sur sa propre ligne
	* avoir un fichier de LICENSE + README.md dans chaque projet
	* tous les variables déclarées en début de bloc
	* on mets pas toute la déclaration d'une fonction sur la même ligne : :code:`void \n fonction(args) \n {`.
	* on met le :code:`*` au nom et pas au type en C
	* essayer de faire des lignes de moins de 79 caractères
	* faire un espace après le if, ...

C'est un exemple pour montrer qu'il faut impérativement établir des règles de code et s'y tenir.
Déterminer la langue des commentaires, ... la langue des noms de variables, ...
le type d'indentations etc.

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://en.wikipedia.org/wiki/SOLID
	* https://en.wikipedia.org/wiki/Code_reuse
	* https://en.wikipedia.org/wiki/GRASP_(object-oriented_design)
	* https://en.wikipedia.org/wiki/KISS_principle
	* https://www.baeldung.com/solid-principles
	* https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa
	* https://suckless.org/