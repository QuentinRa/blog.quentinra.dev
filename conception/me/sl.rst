.. _sl:

================================
Écrire du code meilleur
================================

| :math:`\color{grey}{Version \ 0.4.2}`
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

4. Guidelines
======================

Voici un mix dans la continuité des points vus en 3 des guidelines https://man.openbsd.org/style,
http://doc.cat-v.org/bell_labs/pikestyle et https://www.kernel.org/doc/Documentation/process/coding-style.rst.

	* ne pas donner de noms aux variables dans les prototypes
	* règles sur les commentaires
	* include/import suivit d'une espace avant l'argument
	* noms de constantes (+valeurs enums) en majuscules
	* En c, utiliser sys/queue.h plutôt que des listes faites à la main
	* pas de nom de types finissant par _t (réserver POSIX)
	* utiliser getopt (unistd) pour parser les arguments à la ligne de commande (en C)
	* mets des espaces entre les || et &&, ... mais pas (,], ...
	* aucune déclaration + initialisation
	* utiliser des constantes (const : ready-only) ou #define

5. Doxygen
=========================

La documentation Doxygen est principalement utilisée en C/C++ (mais qui
est disponible en JAVA, PHP, C#, ...) et fonctionne comme la javadoc (vous
pouvez d'ailleurs rédiger au format Javadoc comme @see).

.. code:: c

	/// @brief Short description
	/// 			 ...
	///
	/// More details here.
	///
	/// @param [in] arg1 ...
	/// @param [out] arg2 ...
	/// @param [in,out] arg3 ...
	/// @return ...
	/// @sa ... (see also)

Vous pouvez utiliser in (lecture), out (écriture) ou in,out pour indiquer
ce qu'il adviendra de l'argument.

mais qui peut aussi être directement dans le code

.. code:: c

	int var; ///< description ...

Il faut aussi commenter le fichier !

.. code:: c

		/**
		* @file name.h
		* @package ...
		* @brief ...
		*
		* ...
		*
		*/

Vous avez aussi les @pre (préconditions), @post (postconditions) et @note
pour ajouter une note.

Dans CLion, vous pouvez visualiser/pré-visualiser la documentation avec CTRL-Q.

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
	* https://www.jetbrains.com/help/clion/creating-and-viewing-doxygen-documentation.html#assistance
	* https://www.doxygen.nl/manual/index.html
	* https://www.doxygen.nl/manual/commands.html
	* https://stackoverflow.com/questions/62038742/modify-doxygen-template-in-clion