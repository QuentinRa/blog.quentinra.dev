.. _js:

================================
Javascript (JS)
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 05/03/2021}`

Ceci est un cours de Javascript aussi connu sous le nom d'ECMAScript
dans sa version 6, nommé ES2020 (été 2020).

1. Introduction
===================================

Le javascript est exécuté dans le navigateur du client

	* afficher un popup
	* faire apparaitre/disparaitre des choses
	* faire des animations (avec des librairies connues comme d3)
	* remplacer le php (avec Node.js)
	* faire des requêtes ajax (en gros parler avec un serveur mais depuis le navigateur client)
	* afficher des messages d'erreurs si un formulaire est incorrect

Nous verrons ici la base (popup/hide/...), la gestion d'erreurs de formulaires. Un cours sera
dédié aux requêtes Ajax avec les API Rest, un autre pour Node.js et éventuellement un autre
pour présenter des librairies js.

On attends souvent parler de JQuery en JS, il s'agit d'une librairie qui propose plein de fonctions
utiles mais qui est presque entièrement disponible de nos jours dans le javascript natif.

2. Présentation générale
=============================

.. toctree::
	 :maxdepth: 1


		Mon premier script           <files/pre/start>
		Javascript dans la console   <files/pre/cons>
		Variables en JS              <files/pre/var>
		Opération en JS              <files/pre/op>
		Boucles en JS                <files/pre/struct>

Il existe quelques trucs utiles

	* :code:`alert(v)` : afficher une variable (ou du texte) dans un popup, pratique pour debug
	* :code:`console.log(v)` : pareil que alert mais mets le résultat dans la console

Le :code:`;` en fin de ligne est optionnel mais je le mets presque tout le temps sauf
quand je pense à ne pas le mettre.

Attention, parfois il faut recharger le cache sinon vos modification du javascript
ne sont pas appliquées et vous pouvez vous demandez pourquoi ça BUG : :code:`CTRL-SHIFT-R`
ou :code:`SHIFT-F5`.

3. Fonctions basiques
=========================

On parle généralement de DOM en JS pour parler du Document soit votre page web.
Elle est contenue dans une variable :code:`window.document` (ou :code:`document`)
avec :code:`window` la frame/écran du client.

On interrogera le DOM pour savoir les balises contenues, par exemple récupérer une certaine
div, les éléments d'une classe etc.

On utilisera la window principalement pour les événements au chargement de la page ou
pour faire des cookies en javascript.

.. toctree::
	 :maxdepth: 1

		Manipulation de document <files/base/dom>
		Manipulation de window   <files/base/frame>

-----

**Crédits**
	* Anne-Laure LIGOZAT (enseignante à l'ENSIIE)
	* Vitera Y (enseignant à l'ENSIIE)
	* Thomas LAURENT (enseignant à l'ENSIIE)
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.javascript.com/learn/strings
	* https://www.w3schools.com/Js/default.asp
	* https://www.w3schools.com/Js/js_versions.asp
	* https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage