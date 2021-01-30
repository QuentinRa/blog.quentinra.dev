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

3. Requêtes GET/POST
===================================

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