.. _css:

================================
CSS
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 21/01/2021}`

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

2. Logique d'application
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


-----

**Crédits**
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune