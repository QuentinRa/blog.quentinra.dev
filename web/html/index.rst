.. _html:

================================
HTML
================================

| :math:`\color{grey}{Version \ 0.2.4}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/01/2021}`

Il est important d'avoir lu le cours sur les généralités du web
et d'avoir lu la partie HTML.

Ce cours se base sur :code:`HTML5`.

1. Introduction
===================================

L'HTML est basé sur un système de balises
dans lequel vous donnez des valeurs à des propriétés appelés attributs.

Voici un exemple, une balise image : :code:`<img src='chemin/image.png' alt='description alternative' />`.

.. toctree::
	 :maxdepth: 1


		Fichier type HTML               <files/html5>

Notes

	* les \"\" ou \'\' après le nom d'un attribut (alt, ...) sont optionnels mais recommandés
	*  Apprendre l'HTML : https://www.w3schools.com/html/default.asp
	* les attributs id et class sont utilisés en javascript et en CSS pour référencer une balise
	* N'oubliez pas de vérifier votre code ici : https://validator.w3.org/#validate_by_input

2. Balises principales
================================

Titres :code:`<hn>titre</hn>`
	n va de 1 à 6 et fait varier la taille.
	1 seule balise h1 par page, utilisé par les moteurs de recherche comme mots clefs du site.

	Page:  https://www.w3schools.com/tags/tag_hn.asp

Texte :code:`<p>paragraphe</p>`
	On utilise généralement des balises span dedans pour mettre en couleur une partie
	par exemple.

	Page: https://www.w3schools.com/tags/tag_p.asp

Conteneur :code:`<div> des balises </div>`
	Une balise non affichée qui sert à grouper des composants pour leur appliquer une style généralement
	(position à un endroit etc.).

	Page: https://www.w3schools.com/tags/tag_div.asp

Lien/Ancre :code:`<a href='destination'>texte affiché</a>`
	Texte affiché qui change la page avec la valeur dans href. On utilise l'attribut
	:code:`target="_blank"` pour ouvrir dans un nouvel onglet.

	Si vous ne savez pas la valeur d'un lien, mettez #. Si vous voulez un lien qui référence une balise
	ayant un id alors vous utilisez #id à la fin de l'url de destination.

	Page: https://www.w3schools.com/html/html_links.asp

Image :code:`<img src="chemin" />`
	Généralement on mets un attribut :code:`alt` avec du texte si l'image ne charge pas.

	Page: https://www.w3schools.com/html/html_images.asp

3. Balises de style
================================

Ces balises permettent de donner du style, on utilisera du css si possible.

Balise :code:`<hr/>`
	Trace une ligne sur toute la largeur.

Balise :code:`<br/>`
	Fait un "saut de ligne".

Balise :code:`<i>texte</i>`
	Mets le texte en *italique*.

Balise :code:`<b>texte</b>`
	Mets le texte en **gras**.

Balise :code:`<s>texte</s>`
	Barre le texte.

Balise :code:`<u>texte</u>`
	Souligne le texte.

4. Tags meta
================================

...

-----

**Crédits**
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.w3schools.com/html/default.asp
	* https://validator.w3.org/