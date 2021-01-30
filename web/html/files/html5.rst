================================
Fichier type HTML
================================

L'architecture est sous la forme d'un arbre. Une balise :code:`html`
contient votre document. Elle est divisée entre :code:`head` qui décrit
votre document (métadonnées : langue, style, description, auteurs, ...)
et :code:`body` qui contient la partie affichée de votre site.

.. code:: html

		<!-- indique que cette page est écrite en HTML5 -->
		<!DOCTYPE html>
		<!-- bloc qui contient la page web, le contenu indiqué ici est français -->
		<html lang="fr">
		<!-- ici vous préparez votre site -->
		<head>
			<!-- titre du site, celui affiché dans l'onglet, obligatoire -->
			<title>titre du site</title>
			<!-- informations sur votre page web -->
			<!-- écrite en UTF-8 - facultatif -->
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		</head>
		<!-- ici vous gérez l'affichage -->
		<body>
			<!-- la partie header est la représentation logique d'une barre de menu -->
			<header>...</header>
			<!-- les parties section sont les représentations logiques du contenu de la page -->
			<section>...</section>
			<section>...</section>
			<!-- les parties asides sont les représentations logiques du contenu à gauche ou à droite des sections -->
			<aside>...</aside>
			<!-- le footer est la représentation logique du pied de page -->
			<footer>...</footer>
		</body>
		</html>

Version courte

.. code:: html

		<!DOCTYPE html>
		<html lang="fr">
		<head>
			<title>titre du site</title>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		</head>
		<body>
			<!-- code -->
		</body>
		</html>

.. code:: html

Notez les balises section, header, ... Il s'agit de balises qui ne sont rien d'autres
que contenir d'autre balises. Celles-ci ont pour utilité de créer des groupes sémantiques
de balises afin de comprendre plus facilement quel code fait quoi

	* header/nav : barre de navigation ou le top de votre site
	* section : contenu du site
	* aside : notes par rapport au contenu
	* footer : pied de page

Voici une image (source: http://www.htmlgoodies.com/imagesvr_ce/8525/html5_doc_sections.gif)

.. image:: /assets/web/html/cours/html5.png