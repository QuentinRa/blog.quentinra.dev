.. _php:

================================
PHP
================================

| :math:`\color{grey}{Version \ 0.2.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 30/01/2021}`

1. Introduction
===================================

Pour rappel, le PHP est un langage qui tourne sur le serveur et vous permet d'exécuter
du code (boucle for, remplir des données programmatiquement, etc.) avant
d'envoyer le html.

Il s'agit d'un fichier :code:`.php` dans lequel vous pouvez mettre
une nouvelle balise php dans laquelle vous pouvez mettre du PHP. Il existe
deux versions de cette balise :

.. code:: php

	<p>
	<?php
	// ici je mets du code PHP
	// on obtient une balis <p>Hello World, we are the <date_ici> !</p>
	echo "Hello World, we are the ".date("Y-m-d")." !";
	?>
	</p>

Si une balise ne contient que un echo, alors on peut utiliser la forme
raccourcie qui fait un echo

.. code:: html

	<!-- fait exactement pareil que celle plus haut donc echo ... -->
	<p><?="Hello World, we are the ".date("Y-m-d")." !"?></p>

2. Ce qu'il faut savoir
===========================

Une ligne finit toujours par un :code:`;`.

Les commentaires se font avec :code:`//` ou :code:`/* */`.

On utilise :code:`echo` pour écrire du texte PHP dans de l'HTML.

Vous pouvez savoir si une variable existe avec :code:`isset($variable)`.

Vous pouvez utiliser :code:`''` ou :code:`""` pour du texte, mais dans le premier cas
alors les variables seront considérés comme du texte alors que dans le second
cas les variables seront remplacées par leur valeur. Vous pouvez protéger
un caractère avec :code:`\caractère`.

3. Particularités du PHP
=============================

Le PHP est un langage faiblement typé. Les types
sont int, float, String, array et booléens. Une variable
est de la forme :code:`$nom`.

.. code:: php

	$nombre = 5;
	echo $nombre; // affiche 5
	echo ${nombre}; // affiche 5
	echo ${"nombre"}; // affiche 5
	echo {$nombre}; // affiche 5

Les opérateurs basiques sont disponibles donc :code:`+,-,*,/` avec :code:`%` (modulo)
et :code:`.` (concaténation). On utilise :code:`=` pour l'assignation. La puissance
est faite avec :code:`nombre ** puissance`.

Les opérateurs de comparaison sont :code:`==` (égalité [#1]_), :code:`===` (égalité [#2]_),
:code:`!=` (différent [#1]_), :code:`<>` (différent [#1]_), :code:`!==` (différence [#2]_). Les opérateurs
traditionnels se font avec :code:`>, <, >=, <=`.

.. [#1] ces opérateurs comparent les valeurs, si les éléments sont de types différents : FAUX

.. [#2] ces opérateurs comparent les valeurs, si les éléments sont de types différents alors ils sont convertis dans le même type avant

Les structures (if, for, while, ...) existent ainsi que les mots clefs :code:`continue` (passer au tour suivant)
et :code:`break` (quitter boucle). Leur déclaration est la même qu'en C, hormis le $ devant le nom
des variables. Il existe une nouvelle boucle : le foreach (=for i in) qui sera expliquée dans la partie
sur les tableaux.

Il est possible de créer des constantes avec :code:`define("NOM", valeur);` sachant que le nom
est toujours en majuscules (convention). Notez que une constante est accédée avec son
nom sans $ donc :code:`NOM` ici.

Vous pouvez tester plusieurs conditions avec :code:`||` (ou logique, donc au moins une vraie),
:code:`&&` (et logique, donc toutes vraies) et pouvez même utiliser :code:`or` ou :code:`and`
directement. Le xor est fait avec :code:`^`. On fait une négation avec :code:`!`.

4. Tableaux
=============

...

5. Requêtes GET/POST
=======================

GET
	Les données d'un formulaire sont envoyées dans l'URL.

	Exemple : :code:`https://example.com/?search=get%20request&page=5`. Ici le formulaire envoie
	au serveur deux variables : search (qui contient get request) et page (qui contient 5).

	Ces valeurs sont visibles par l'utilisateur donc pour toutes les transactions sensibles, on utilise
	POST.

POST
	Les données envoyées ne sont pas affichées à l'utilisateur (c'est pas vrai car il peut voir le code HTML,
	mais le formulaire doit être ré-remplie par l'utilisateur et ne l'est pas automatiquement comme avec
	une requête GET).

Vous avez vu en HTML qu'il fallait donner une valeur à action : un script php (chemin depuis la racine
ou une url). Vous deviez également donner des "name" aux champs input pour qu'on puisse les utiliser
en PHP.

Lorsque le formulaire est reçu par un script, il contient des tableaux :code:`$_GET` et :code:`$_POST`
dont vous pouvez voir le contenu avec un var_dump. Ces tableaux contient toutes les valeurs
de votre formulaire qui ont un name, indexés donc avec le name.

Vous devez alors vérifier les données, si elles sont correctes alors vous faites votre travail
et si elles sont fausses alors vous pouvez par exemple stocker les valeurs
dans :code:`$_SESSION` et retourner sur page (vous utiliserez $_SESSION pour ré-remplir le formulaire).

-----

**Crédits**
	* Anne-Laure LIGOZAT (enseignante à l'ENSIIE)
	* Vitera Y (enseignant à l'ENSIIE)
	* Thomas LAURENT (enseignant à l'ENSIIE)
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.javatpoint.com/get-vs-post
	* https://www.php.net/manual/fr/language.operators.php
	* https://www.php.net/manual/fr/language.basic-syntax.php