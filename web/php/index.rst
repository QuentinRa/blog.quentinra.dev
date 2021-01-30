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
A l'inverse, la fonction :code:`unset($variable)` vous permet de détruire
une variable.

Vous pouvez utiliser :code:`''` ou :code:`""` pour du texte, mais dans le premier cas
alors les variables seront considérés comme du texte alors que dans le second
cas les variables seront remplacées par leur valeur. Vous pouvez protéger
un caractère avec :code:`\caractère`.

Généralement, on divise le code PHP en modules/fichiers. Le code (variables, ...) est indépendant
mais les fonctions, les classes publiques, les constantes peuvent être réutilisés dans d'autre fichiers.
Il existe

	* :code:`include "path"` : inclure un fichier mais si ça rate on continue
	* :code:`require "path"` : inclure un fichier mais si ça rate php quitte et affiche une erreur
	* :code:`include_once "path"` : ne fait pas le include si déjà inclus (si déjà inclus et pas ça alors erreur)
	* :code:`require_once "path"` : ne fait pas le require si déjà inclus (si déjà inclus et pas ça alors erreur)

Si vous voulez mettre fin au script PHP (donc quitter, par exemple si le code est fini et vous ne voulez
pas afficher la page), alors vous devez appeler :code:`exit()`.

Pour faire une redirection PHP, en supposant que vous n'avez fait aucun echo/... et affiché
aucun truc à l'écran alors vous faites :code:`header("Location: path");exit();`.

Si votre script ne contient que du PHP, alors vous n'avez pas à mettre le :code:`?>` à la fin.

3. Particularités du PHP
=============================

Le PHP est un langage faiblement typé. Les types
sont int, float, String, array et booléens. Une variable
est de la forme :code:`$nom`.

.. code:: php

		<?php
		$nombre = 5;
		echo $nombre; // affiche 5
		echo {$nombre}; // affiche 5
		// echo ${nombre}; // affiche 5 aussi (comme en Shell)
		// echo ${"nombre"}; // affiche 5 aussi mais le nom peut être une string

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

Il existe deux types de tableaux en PHP, les tableaux "normaux" donc comme en C et les tableau
associatifs avec des clefs (string) associées à une valeur. Les valeurs d'un tableau peuvent
être de types différentes.

On crée un tableau avec :code:`array(valeur, ...)` ou :code:`[valeur, ...]`. Dans le cas
d'un tableau associatif, on aura :code:`array("key" => valeur, ...)`. Vous pouvez avoir
key qui vaut un entier si vous souhaitez placer les valeurs à un certain index. Attention,
PHP ne remplit pas les trous que vous causeriez.

On accède à une valeur avec :code:`tableau[index]` ou :code:`tableau["key"]`. Dans le cas
ou vous êtes dans une String (donc \"\" va bloquer), alors vous pouvez faire :code:`tableau[key]`.

.. code:: php

		<?php
		$user = array("user" => "calistro", "password" => "", "id" => 42, 13, 2 => "premier");
		echo $user["user"]; // calistro
		echo $user["id"]; // 42
		echo $user[0]; // affiche 13
		echo $user[1]; // erreur : non défini
		echo $user[2]; // affiche premier
		echo "Mon nom est $user[user] !";
		var_dump($user42);
		?>

Les fonctions utiles sont

	* :code:`count(tab)` : retourne le nombre d'éléments
	* :code:`is_array(tab)` : retourne true si c'est un tableau

foreach
	Il s'agit d'une boucle permettant de parcourir automatiquement un tableau. L'élément actuel
	est mis dans une variable (i par exemple).

	.. code:: php

		<?php
		// version sans clef
		foreach ($tab as $value) {
		 // mets la valeur dans $value
		}

		// version avec clef
		foreach ($tab as $key => $value) {
		 // mets la clef actuelle dans $key et la valeur dans $value
		}

5. Fonctions
===============

On déclare une fonction avec le mot clef :code:`function`. Le code
de la fonction est comme en C. Les arguments sont passés par valeur
mais vous pouvez passer une référence avec :code:`&$variable`. Vous
pouvez également donner une valeur par défaut avec :code:`$variable = valeur`.

.. code:: php

	<?php
	function ma_fonction($param1, &$param2, $param3=5) {
	 // ... code ...
	}

Les arguments par défaut n'ont pas besoin d'être donnés lors de l'appel. Si une
fonction retourne une valeur, alors on la retourne avec :code:`return valeur;`.

.. code:: php

	<?php
	function my_pow($nombre, $puissance=2){
	 return $nombre ** $puissance;
	}

	my_pow(5); // 5^2 = 25
	my_pow(5, 2); // 5^2 = 25
	my_pow(5, 3); // 5^3 = 125

6. Classes et objets
======================

...

7. Requêtes GET/POST
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

.. warning::

	Attention aux problèmes d'injections de code (HTMl: quelqu'un qui utilise une balise <script> comme nom
	par exemple ou aux injections SQL). Vous aurez beaucoup plus d'explications dans la partie
	CyberSécurité > Les failles du web (injections).

8. Sessions et Cookies
========================

...

9. Migration de PHP
===========================

PHP 5.6 vers PHP 7

	*

		la syntaxe de bloc est différente, on appelle du code PHP dans des balises <?php ?>
		alors qu’avant il était possible d’écrire du code PHP dans des balises <? ?>

	* des fonctions telles que "ereg" et "mbstring" ont étés supprimées, mktime a changé
	* list a été remplacée par str_split, changement dans les foreach
	* changement dans la gestion des sessions
	*

		toutes les fonctions mysql sont deprecated (ne devraient plus être utilisés)
		et ont été remplacées par leur équivalent mysqli.

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
	* https://www.w3schools.com/php/default.asp