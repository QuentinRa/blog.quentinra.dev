.. _css:

================================
CSS (Cascading Style Sheets)
================================

| :math:`\color{grey}{Version \ 0.8.7}`
| :math:`\color{grey}{Dernière \ édition \ le \ 01/02/2021}`

Il est important d'avoir lu le cours sur les généralités du web
ainsi que d'avoir lu les parties HTML et CSS.

Ce cours se base sur :code:`HTML5` et :code:`CSS3`.

1. Nom de partie
===================================

Un fichier css est généralement appelé :code:`style.css`. Généralement, un site
est accompagné d'un :code:`print.css` pour définir les règles d'impression
(on cache souvent des balises pour ne pas les voir sur la version imprimée).

On peut également faire du css dans un .html avec une balise style, mais **ne faites**
**pas ça** (:code:`<style> du css </style>` ou utiliser l'attribut style).

Le css permet notamment de rendre un site responsive, c'est à dire qui s'adapte
(de façon significative) selon la taille de l'écran (téléphone, tablette, pc).

	* on fait disparaitre des menus (hamburger)
	* on change certains composants pour les rendre plus petits
	* on diminue généralement les tailles/espaces (marges et le padding)
	* etc.

On indique au HTML notre fichier de css comme suit

.. code:: html

		<!-- style (css) -->
		<!-- la page peut être redimensionnée, en fonction du device (mobile, ordinateur, ...) mais
		 vous devrez définir comment. Sans cette ligne, votre site n'essayera pas de se redimensionner -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- importation d'un fichier de style -->
		<link rel="stylesheet" href="chemin/vers/style.css">

Voici un exemple de fichier css.

.. code:: css

	@charset "UTF-8";

	/* un commentaire */
	body {
	 scroll-behavior:smooth;
	}

.. warning::

	Si vous modifiez un fichier css et que le style ne s'est pas appliqué, alors il faudra
	sûrement recharger le cache donc avec :code:`CTRL-SHIT-R` généralement.

2. Sélecteur
=================================

Sélecteur
	Il s'agit du ou des composants sur lesquels on applique le style. Vous pouvez utiliser

		* les balises ayant une classe : :code:`.nom_classe` [#1]_
		* un type de balise : :code:`nom_balise` (ex: br)
		* la balise ayant cette identifiant : :code:`#id`
		* tous (à ne pas utiliser, utiliser body sinon vous allez avoir des "bugs") : :code:`*`
		* un sélecteur spécial (:code:`:root`)

On mets autant de sélecteurs que voulus, séparés par une virgule. Enfin on met des accolades
et on détermine les propriétés des éléments sélectionnés.

.. code:: css

		/* balises */
		html, hr, section, ... {
		 /* ici on définit le style */
		}
		.uneClasse, #id {
		 /* ici on définit le style */
		}

.. [#1] Voici un exemple d'utilisation de classes (une balise peut avoir une ou plusieurs classes)

	.. code:: html

			<!-- on aura .text-small, .text-red et #texte-intro comme sélecteurs disponibles -->
			<p class="text-small text-red" id="texte-intro">...</p>

Il est possible d'aller plus loin dans la sélection en utilisant
un sélecteur basé sur l'état d'une balise, par exemple un style si la souris est au dessus d'un lien
ou encore si on clique sur un bouton.

.. code:: css

	balise:hover {} /* style au survol */
	balise:active {} /* style d'un bouton cliqué */
	balise:visited {} /* style d'un lien visité */
	...

Il existe encore plus de possibilités

	* style d'une balise contenue dans une autre :code:`balise1 > balise2`
	* une balise ayant deux classes de styles :code:`.classe1.classe2`
	* récupérer le nième élément d'une div (https://www.w3schools.com/cssref/sel_nth-child.asp)
	* ...

La liste complète est ici : https://www.w3schools.com/cssref/css_selectors.asp.

3. Valeur de styles
=================================

Il y en a beaucoup trop... Listes

	* liste : https://www.w3schools.com/cssref/default.asp
	* liste courte (page 2) : https://perso.limsi.fr/annlor/enseignement/ensiie/pw/resume_html_css.pdf

Le format est :code:`propriété: valeur;` ou :code:`propriété: valeur !important`
pour forcer un style a être appliqué.

Les unités de tailles sont généralement des :code:`px` (pixels) mais il en existe
pleins d'autres (rem, ...) et vous pouvez aussi utiliser un pourcentage (:code:`50%` par exemple).

Voici quelques propriétés

.. code:: css

		/* exemple avec sélecteur div */
		div {
		 /* générales */

		 background: yellow; /* fond, utiliser un nom, ou rgb(r,g,b) ou #code_hexa */
		 color: red; /* couleur du texte, voir background pour les valeurs */
		 font-size: 15px; /* taille du texte */
		 font-family: "Open Sans", sans-serif; /* définir la police s'il trouve pas la 1er, il test la 2e etc. */
		 font-weight: 400; /* 400=regular, 100=light, 800=bold je crois */
		 text-decoration: underline #dd4441; /* souligne du texte en dd4441 donc rouge */
		 text-decoration: none; /* retire le soulignement, ex: plus de trucs sous un lien */

		 width: 5px; /* largeur */
		 height: 5px; /* hauteur */

		 display: block; /* affichage, block=afficher, none=cacher, ... */

		 border: 1px solid #202735; /* mettre une bordure */
		 border-radius: 4px; /* arrondir tous les angles (sinon faut préciser les 4 valeurs) */

		 cursor: pointer; /* met la souris du clic */
		 outline: none; /* redire la ligne bizarre lors du clic sur un faux bouton */
		}

Des propriétés notables sont

	* margin : mets des marges entre le composant et l'extérieur
	* padding : mets des marges entre le contenu du composant et sa bordure
	* :code:`scroll-behavior:smooth;` : a mettre a body, fait que la défilement (barre droite) est doux

Vous pouvez faire des calculs avec :code:`calc(...)`.

4. Faire des constantes
=========================

.. code:: none

		/* déclarer des constantes */
		:root {
		 --special-grey1: #5d6372;
		 --special-red1: #dd4441;
		}

		.red {
		 color: var(--special-red1);
		}

5. Responsive
=======================

Il est possible de faire un style, qui n'est activé que l'écran est
d'au moins une certaine taille par exemple. On parle de media-queries.

.. code:: none

		@media (min-width: 750px) AND (max-width: 950px) {
		 .telephone-div {
		  ...
		 }
		}

Vous pouvez faire des test, en ouvrant la console puis en cliquant en haut
à gauche de la console sur :code:`Activer/Désactiver l'émulation` (icône téléphone+tablette)
ou avec CTRL+SHIFT+M. La barre en haut vous permet de facilement virtuellement changer
le taille de votre écran et/ou son orientation.

-----

**Crédits**
	* Anne-Laure LIGOZAT (enseignante à l'ENSIIE)
	* Vitera Y (enseignant à l'ENSIIE)
	* Thomas LAURENT (enseignant à l'ENSIIE)
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.w3schools.com/css/default.asp
	* https://validator.w3.org/#validate_by_input
	* https://perso.limsi.fr/annlor/enseignement/ensiie/pw/resume_html_css.pdf