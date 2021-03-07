.. _html:

================================
HTML
================================

| :math:`\color{grey}{Version \ 1.3.7}`
| :math:`\color{grey}{Dernière \ édition \ le \ 01/12/2021}`

Il est important d'avoir lu le cours sur les généralités du web
ainsi que d'avoir lu la partie HTML.

Ce cours se base sur :code:`HTML5`.

1. Introduction
===================================

L'HTML est basé sur un système de balises
dans lequel vous donnez des valeurs à des propriétés appelés attributs.

Voici un exemple, une balise image : :code:`<img src='chemin/image.png' alt='description alternative' />`.

.. toctree::
	 :maxdepth: 1


		Fichier type HTML               <files/html5>
		Quelques notes                  <files/notes>

Note pour javascript et CSS : vous pouvez importer une librairie sans télécharger
de fichier .css ou .js ou autre en passant par un CDN (Content Delivery Network).

L'idée est que des sites comme https://cdnjs.com/, https://www.jsdelivr.com/, ... Il suffit
de copier les liens des js/css comme source et c'est bon. Certains CDN vous permettent
de ne pas spécifier une version, donc le lien source redirigera toujours vers la
dernière version de la librairie (donc si vous téléchargez mathjax-4.0.js c'est une
version fixe, mais avec un CDN le lien est fixe mais le fichier affiché sera mathjax-4.x
avec x la dernière version).

2. Balises principales
================================

Titres :code:`<hn>titre</hn>` (`h <https://www.w3schools.com/tags/tag_hn.asp>`_)
	n va de 1 à 6 et fait varier la taille.
	1 seule balise h1 par page, utilisé par les moteurs de recherche comme mots clefs du site.

Texte :code:`<p>paragraphe</p>` (`p <https://www.w3schools.com/tags/tag_p.asp>`_)
	On utilise généralement des balises span dedans pour mettre en couleur une partie
	par exemple. P est bloquante par défaut (1 par ligne, css pour changer ça ou utiliser div+span).

Conteneur :code:`<div> des balises </div>` (`div <https://www.w3schools.com/tags/tag_div.asp>`_)
	Une balise non affichée qui sert à grouper des composants pour leur appliquer une style généralement
	(position à un endroit etc.).

Lien/Ancre :code:`<a href='destination'>texte affiché</a>` (`a <https://www.w3schools.com/html/html_links.asp>`_)
	Texte affiché qui change la page avec la valeur dans href. On utilise l'attribut
	:code:`target="_blank"` pour ouvrir dans un nouvel onglet. On appelle souvent ça une ancre (a pour ancre).

	Si vous ne savez pas la valeur d'un lien, mettez #. Si vous voulez un lien qui référence une balise
	ayant un id alors vous utilisez #id à la fin de l'URL de destination.

Image :code:`<img src="chemin" />`  (`img <https://www.w3schools.com/html/html_images.asp>`_)
	Généralement on mets un attribut :code:`alt` avec du texte si l'image ne charge pas.

Balise rien :code:`<span>quelque chose</span>` (`span <https://www.w3schools.com/tags/tag_span.asp>`_)
	Une balise qui ne fait rien. Utile pour appliquer du style a une partie d'un texte (on ne peut pas
	mettre une div dans une p). Utile lorsqu'on ne peut pas utiliser une p.

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

4. Autres balises
================================

Balise :code:`<ol> ... </ol>`
	Liste numérotée. Chaque élément est une balise li.

Balise :code:`<ul> ... </ul>`
	Liste non numérotée. Chaque élément est une balise li.

Balise :code:`<li> ... </li>`
	Utilisé dans une balise ul/ol. Voir `listes <https://www.w3schools.com/html/html_lists.asp>`_

Balise :code:`<dl> <dt>word</dt><dd>def</dd> ... </dl>`
	Une liste de mots (word) et leur définition (def).

Balise :code:`<pre>truc</pre>` (`pre <https://www.w3schools.com/tags/tag_pre.asp>`_)
	Une balise pre affiche exactement ce qu'il y dedans (respecte les espaces, etc.).

Balise :code:`<code>code</code>` (`code <https://www.w3schools.com/tags/tag_code.asp>`_)
	Utilisée pour affiche du code. Généralement ne fait pas la coloration syntaxique, il faudra
	sûrement utiliser une librairie JS.

Tableaux
	On déclare un tableau avec la balise :code:`<table>`. Dedans on mets deux balises
	:code:`<thead>` (qui contiendra l'en-tête) et :code:`<tbody>` (le contenu du tableau).

	Dans la :code:`thead`, on met une balise :code:`tr` (=1 ligne de header) qui contient des balises
	:code:`<th>nom colonne</th>`.

	Dans la :code:`tbody`, on met une balise :code:`tr` (=1 ligne de body) qui contient des balises
	:code:`<td>valeur</td>`.

	.. code:: html

		<table>
		 <thead>
		  <tr>
		   <td>col1</td>
		   <td>col2</td>
		  </tr>
		 </thead>
		 <tbody>
		  <tr>
		   <td>ligne-1 col-1</td>
		   <td>ligne-1 col-2</td>
		  </tr>
		  <tr>
		   <td>ligne-2 col-1</td>
		   <td>ligne-2 col-2</td>
		  </tr>
		 </tbody>
		</table>

5. Formulaires
===========================

`Formulaires <https://www.w3schools.com/html/html_forms.asp>`_.

Formulaire :code:`<form action="script.php" method="...">`
	Plus de détails en PHP mais un formulaire est une balise logique qui regroupe
	tous les champs de saisie (input, ...). Lorsque le formulaire est validé, alors toutes
	les valeurs sont envoyés selon une méthode (post/get) a un script PHP qui traite les données.

	On place généralement une vérification en javascript/html en plus de la vérification en PHP.

Balise de saisie :code:`<input type="..." >` (`input <https://www.w3schools.com/tags/tag_input.asp>`_)
	Une balise \"joker\" qui selon le type donné devient une checkbox (checkbox),
	un calendrier pour saisir une date (date), du texte (text), un téléphone (tel), un mot de passe
	(password), une interval (range) ou encore des boutons radios (radio).

	L'attribut :code:`placeholder="valeur"` permet de mettre un indication de saisie qui disparait lorsque
	l'utilisateur commence à taper.

	L'attribut :code:`value="valeur"` permet de donner une valeur par défaut. Vous pourrez ainsi ré-remplir
	un formulaire si les données sont incorrectes.

	L'attribut :code:`form="<id>"` permet à une balise de ne pas être dans la balise form mais d'envoyer
	quand même ses données lorsque le formulaire est envoyé.

	L'attribut :code:`name="nom_unique"` est un chaine de caractère permettant sur le serveur de récupérer
	une donnée d'un formulaire.

	Vous pouvez ajouter d'autres attributs pour vérifier le contenu de votre champ :
	:code:`maxlength="x"` (nb max caractères), :code:`minlength="x"` (nb min caractères),
	:code:`max="x"` (valeur max), :code:`min="x"` (valeur min), :code:`required` (obligatoire),

	L'attribut :code:`checked` (sans valeur ou alors true) permet de cocher par défaut une checkbox/un bouton radio.

Balise :code:`<label for="" />`
	Généralement, vous allez vouloir mettre :code:`Prénom: champ de saisie`. Ici prénom est le label, et cliquer
	dessus déclenche automatiquement le début de la saisie. Il faut pour cela que l'attribut for ait pour valeur
	l'id du input, ou alors mettre la balise input dans la balise label (:code:`<label>Prénom: <input ...></label>`).

Dans un formulaire, il faut généralement un bouton pour envoyer le formulaire. Il
s'agit d'un bouton normal mais ayant un attribut :code:`type="submit"` (envoyer)
ou :code:`type="reset"` (vider le formulaire).

Zone de texte :code:`<textarea>...</textarea>` (`textarea <https://www.w3schools.com/tags/tag_textarea.asp>`_)
	Une zone de texte, col et row permettent de lui donner une taille rapidement. Certains
	attributs de input sont utilisables (required, form, placeholder, ...)

Autres balises : :code:`select` (liste déroulante), ...

Vous pouvez cacher des balises input avec hidden, mais attention n'importe qui peut
les voir dans le code et modifier leur valeur.

6. Tags meta
================================

Voici quelques tags meta souvent utilisés. Vous pouvez
utiliser le truc de google https://www.google.com/webmasters/markup-helper/u/0/?hl=fr
pour expliquer à google ce qu'il y a sur votre site si c'est votre but
(https://www.oodlesmarketing.com/blog/use-google-structured-data-markup-helper/).

.. code:: html

		<!-- icône du site dans l'onglet, facultatif -->
		<link rel="icon" href=".../icon.png">

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- auteur, ... pour le référencement (facultatif) -->
		<META NAME="AUTHOR" CONTENT="...">
		<META NAME="COPYRIGHT" CONTENT="...">
		<META NAME="KEYWORDS" CONTENT="....">
		<META NAME="DESCRIPTION" CONTENT="...">

7. Icônes
===============

Vous pouvez embellir votre site avec des icônes très facilement. La référence
incontournable est font-awesome (CC-1.0) mais récemment bootstrap à sortit une librairie
open-source.

Liens

	* https://icons.getbootstrap.com/ (voir utilisation #usage)
	* https://fontawesome.com/icons (usage: :code:`<i class="fad fa-heart"></i>` par exemple)

-----

**Crédits**
	* Anne-Laure LIGOZAT (enseignante à l'ENSIIE)
	* Vitera Y (enseignant à l'ENSIIE)
	* Thomas LAURENT (enseignant à l'ENSIIE)
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.w3schools.com/html/default.asp
	* https://validator.w3.org/