.. _mdb:

================================
Boostrap
================================

| :math:`\color{grey}{Version \ 0.3.6}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/01/2021}`

Ce guide est basé sur :code:`Bootstrap4` et :code:`Material Design For Bootstrap (MDB)`.

1. Introduction
===================================

Bootstrap est un framework css, donc du css assez typique pour qu'on crée
un framework pour facilement l'utiliser.

Le principe est simple, bootstrap vous propose des classes ayant un style,
il suffit de les utiliser dans votre CSS.

Honnêtement, je ne les connais pas toutes par cœur donc allez voir le doc officielle
qui est géniale : https://getbootstrap.com/docs/5.0/getting-started/introduction/.

:code:`Astuce` : moi j'utilise PHPStorm qui est smart donc il me propose les classes
qui sont utilisées dans mes CSS. Donc je télécharge les fichier bootstrap (on va dire
dans assets/lib) et maintenant PHPStorm fait l'autocompletion des classes Bootstrap
donc super utile.

L'un des avantages des framework css est qu'ils sont déjà responsive donc s'adaptent à la taille de l'écran.

Il suffit de copier ces liens dans le balise head

.. code:: html

	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<!-- bootstrap javascript (peut être dans le footer aussi) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

2. breakpoint
=====================

Bootstrap vous permet de placer 5 types de classes

	* nom : toujours présent
	* nom-sm : style uniquement si l'écran est petit (téléphone, >576px)
	* nom-md : style uniquement si l'écran est moyen (tablette/petit pc, >768px)
	* nom-lg : style uniquement si l'écran est grand (pc, >992px)
	* nom-xl : style uniquement si l'écran est très grand (pc, >1200px)

Attention, tous les classes de styles n'ont pas 5 variantes.

Les classes :code:`display` sont très utiles pour afficher/ou non un composant.

Exemples

	* :code:`d-print-none` : ne pas afficher avec CTRL+P donc imprimer
	* :code:`display-<none/block>` : cacher/afficher
	* :code:`display-<breakpoint>-<none/block>` : pareil sauf que ce n'est fait que si l'écran est d'au moins breakpoint taille
	* Il existe d'autres valeurs que none/block (flex, ...)

3. Mise en page
==========================

Bootstrap utilise un système de lignes et colonnes. La largeur de l'écran équivaut
à 12 colonnes.

Classe :code:`row` : mettre des div sur la même ligne.

Classe :code:`col-n` : crée une colonne qui prends la place de n colonnes sur 12. Valeur n=auto possible.

.. code:: html

	<div class="row mx-0">
		<div class="col-md-6 col-12"> ... </div>
		<div class="col-md-6 col-12"> ... </div>
	</div>

Autres classes utiles
----------------------

Deux autres classes pratiques sont :code:`container`
et :code:`container-fluid`.

Vous pouvez centrer/... le contenu avec des classes du style :code:`justify-content-center`
ou faire des affichages particuliers avec les classes du type :code:`align-items-center`.

Marge et padding
-------------------------

Vous pouvez appliquer des marges avec :code:`mt, mb, ml, mr`
et des paddings avec :code:`pt, pb, pl, pr` suivit de :code:`-nombre` entre
0 et 5 (valeur qui détermine responsivement une taille plus ou moins grande).

Note: t = top, b = bottom, l = left et r = right.

Vous avez les classes :code:`mx, my, px, my` qui sont l'équivalent de
faire left+right (x) et top+bottom (y).

Taille
-------

On détaille la largeur avec :code:`w-n` qui vaut 25,50,75,100,auto donc un pourcentage de la largeur
de l'écran. Il existe la même pour la hauteur avec :code:`h-n`.

On peut définir une taille maximale avec :code:`mw-100` (max width 100) par exemple.

4. Couleurs et Fonds
==========================

Titres
	Vous pouvez donner le style d'une H1 à une H2 (car une 1 par document) en utilisant
	la classe :code:`hn` (n de 1 à 6).

Couleur
	Vous pouvez donner une couleur de police parmi les prédéfinies [#1]_ avec :code:`text-<couleur>`.

Fond
	Vous pouvez donner une couleur de police parmi les prédéfinies [#1]_ avec :code:`bg-<couleur>`.

.. [#1] les couleurs sont listées ici : https://getbootstrap.com/docs/4.6/utilities/colors/

Autres
	| Classe :code:`lead` qui donne une apparence qui sort du lot à un paragraphe.
	| Classe :code:`display-n` (n de 1 à 4) qui fait des gros titres.

Placement du texte
	| Classe :code:`text-justify` (ou left, right, center). Aligne le texte.
	| Classe :code:`text-truncate` : mets ... si l'écran est trop petit pour afficher
	| Classe :code:`text-break` : découpe un mot trop long si si l'écran est trop petit pour afficher

5. Tableaux
========================

On déclare comme classes du tableau les classes de style.

	* :code:`table` : pour avoir le style d'un tableau bootstrap
	* :code:`table-dark` (ou light) : tableau sombre/clair
	* :code:`table-borderless` : supprime la bordure
	* :code:`table-<couleur>` : colorier une balise td
	* :code:`table-hover` : ligne parcourue mise en avant
	* :code:`table-responsive` : si le tableau est trop grand alors il aura un scroll horizontal pour tout voir

6. Autres
======================

Alertes
	Plutôt cool pour afficher un message qui doit se voir (erreur, info, ...). Utilisez
	les classes :code:`alert alert-<couleur>` (faut les 2 dans une div).

	Vous pouvez utiliser :code:`alert-heading` pour un titre et la balise :code:`<hr>` pour embellir votre alerte.

Boutons
	Vous utilisez les classes :code:`btn btn-<couleur>` pour faire un beau bouton (ou
	btn-outline-<couleur>).

Card
	Regardez `la doc des card <https://getbootstrap.com/docs/4.6/components/card/>`_,
	c'est une petite carte (qu'on peut retourner avec du js) comme une carte pokemon.

Carrousel
	Regardez `la doc des carrousel <https://getbootstrap.com/docs/4.6/components/carousel/>`_,
	il s'agit d'une galerie/... donc des images que l'on veut parcourir avec des flèches etc.

Collapse
	Regardez `la doc collapse <https://getbootstrap.com/docs/4.6/components/collapse/>`_,
	super pratique si vous voulez permettre à l'utilisateur d'afficher/cacher des informations.

Formulaire
	Regardez `la doc des forms <https://getbootstrap.com/docs/4.6/components/forms/>`_.

	On utilise généralement la classe :code:`form-group` pour un chaque div
	contenant l'input+le label. Chaque input a la classe :code:`form-control`.

Modals
	Une popup bootstrap, voir la documentation.

Nav et Navbar
	Barre de navigation, voir la documentation.

-----

**Crédits**
	* Documentation officielle (getbootstrap.com)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://getbootstrap.com/docs/5.0/getting-started/introduction/
	* https://www.ipraxa.com/blog/bootstrap-5-whats-new-whats-changed/
	* https://www.w3schools.com/bootstrap4/