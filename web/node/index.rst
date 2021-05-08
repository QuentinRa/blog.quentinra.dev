.. _node:

====================================
Node.js, TypeScript, SCSS et SASS
====================================

| :math:`\color{grey}{Version \ 0.2.5}`
| :math:`\color{grey}{Dernière \ édition \ le \ 06/05/2021}`

Ceci n’est pas vraiment un cours, seulement des notes
d'utilisation de node.js, utilisant :code:`Discord.js`, :code:`Socket.io`,
:code:`electron`.

1. Introduction
=================

:code:`Node.js` est un outil javascript vous permettant d’avoir une architecture
client-serveur donc remplacer la partie serveur avec un mix JS-PHP ou JS uniquement
par exemple.

Avec :code:`Socket.io` vous pouvez créer un système de messagerie très simplement, et vous pouvez
même intégrer Node en PHP donc faire une page en PHP qui utilise Node.js pour l'échange des messages.

Vous pouvez télécharger node ici : `nodejs.org <https://nodejs.org/en/download/>`_. Il faut
ensuite installer :code:`npm` qui va vous permettre d’installer facilement
des librairies (`npmjs <https://docs.npmjs.com/downloading-and-installing-node-js-and-npm>`_).

Vous pouvez aussi télécharger :code:`nodemon` pour que votre script soit relancé s’il crash ou est modifié,
très pratique pour un bot discord par exemple (:code:`npm install -g nodemon` avec g pour global).

2. package.json
==================

:code:`Node.js` utilise comme gradle par exemple, un fichier pour gérer les librairies
du projet. Il s’agit de :code:`package.json`.

Une version très simpliste est la suivante. Les dépendances sont automatiquement
ajoutées lorsque vous faites :code:`npm install ma_librairie`

.. code:: json

		{
			"name": "...",
			"version": "...",
			"dependencies": {
				"express": "^4.17.1",
				"mariadb": "^2.5.3"
			},
			"devDependencies": {
				"fs.js": "0.0.1",
				"sequelize": "^6.6.2"
			}
		}

Vous pouvez changer le critère de version (le :code:`^`) avec

	* :code:`^1.2.3` : garde la version majeure (1) mais peut changer la version mineure (2.3)
	* :code:`~1.2.3` : garde la version majeure+mineure1 (1.2) mais peut changer la version mineure2 (3)
	* :code:`>=version` : version plus grande (pareil en :code:`<=` et :code:`<` et :code:`>`)
	* :code:`=version` : exactement cette version
	* :code:`version-version` : intervalle de versions
	* :code:`a||b` : ou logique, on peut combiner des règles
	* :code:`latest` : dernière version disponible

Si vous avez configuré un :code:`package.json` alors vous pouvez faire

	* :code:`npm install` : installe les librairies dans node_modules
	* :code:`npm update` : mets à jour selon la configuration les librairies

En particulier, vous verrez qu’un fichier :code:`package-lock.json`
qui contient les librairies exactes utilisées pour le projet. Vous devez
partager ce fichier (donc pas git package.json par exemple)
pour permettre aux autres d’avoir les mêmes librairies que vous, le fichier
:code:`package.json` sera créé automatiquement si vous
ne l’avez pas et que vous avez :code:`package-lock.json`.

3. Require/Export Node.js
===========================

Tout d’abord c'est globalement pareil que du JavaScript donc je vous
laisse voir le cours de Javascript si vous ne vous sentez pas capable
de déclarer une fonction, créer un object ou manipuler des variables.

.. code:: js

	const FileSystem = require('fs');
	const {Client, Collection} = require('discord.js');
	const File = require('./file.js');

Pour résumer, :code:`fs` et :code:`discord.js` sont des librairies
js. Un script rends public des objets (par exemple :code:`FileSystem`
ou :code:`Client` ici) et vous pourrez donc utiliser ces object selon la documentation pour utiliser
votre librairie. Vous pouvez aussi faire pareil avec votre propre fichier js :code:`file.js`
dans lequel vous rendez comme ceci des objets public

.. code:: js

		module.exports = {
		 nom1: valeur1,
		 nom2: valeur2,
		}

Valeur1 et Valeur2 peuvent êtres des objects donc une valeur, une fonction, ... Si vous ne donnez pas
d’étiquette (nom1, nom2, ...) alors le nom de l’object sert d’étiquette.

Dans le code, celà donne :code:`const {nom1, nom2} = require('./file.js');` puis ensuite
:code:`nom1()` par exemple si nom1 était une fonction etc.

4. TypeScript
==============

Typescript vous permet d'écrire du JavaScript uniformisé et d'ensuiter compiler dans n'importe
quelle version de JS. En particulier, vous aurez une vérification syntaxique plus forte car le langage
est beaucoup plus typé.

	* Installer : :code:`npm install -g typescript`
	* Compiler en JS : :code:`npx tsc` ou :code:`tsc` parfois
	* Compiler en JS (mode watch donc auto-compilation) : :code:`npx tsc -w` ou :code:`tsc`

Vous allez créer des fichiers :code:`.ts` qui seront compilés en :code:`.js`. Personnellement
j'utilise un fichier :code:`tsconfig.json` (créé avec :code:`npx tsc --init`) qui contient
les informations sur la version de Javascript (ES2020/commonjs sont mes valeurs target/module).

Quelques éléments de syntaxe en plus de celle basique du js

.. code:: typescript

	// on précise le type des variables
	let nom_variable : type; // déclaration
	let nom_variable : type = valeur; // pareil mais avec assignation

	let nom_variable : any; // équivalent à ne rien mettre
	let nom_variable : undefined | null; // peut prendre l'un de ces types

	// supprimer un warning
	// @ts-ignore

	// rendre une classe/function/n'importe quoi public
	export class Nom {}

	// importer les éléments exportés=publics
	import { TRUC_EXPORTE , AUTRE_TRUC } from "../files/file"; // un fichier file donc file.ts et file.js

	// les type de retour fonctions
	static getString() : string | undefined { return ...; }

	// comme en JS
	let a = undefined ?? 0; // a vaut 0 car la valeur avant ?? est undefined (pareil avec null)


	class Example {
	 // un getter
	 get number() : number { return 10; };
	 // un setter
	 set number(n: number) { /* code */ };
	}

	// usage
	let example : Example = new Example();
	example.number; // evaluates as 10
	example.number = 5; //ok

	// assert that a value have this type
	let a = /* some value */;
	let b : number = <number>a; // means that we are asserting a is a number so b will be a number

Le site officiel est une bonne référence : `https://www.typescriptlang.org/ <https://www.typescriptlang.org/>`_
ou encore https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html.

5. electron
=============

electron est une arnarque, en fait il s'agit d'un navigateur (chromium) qui se fait passer pour une application de bureau.
Vous coder donc de l'HTML, CSS et JS et avez la possiblité de créer un .exe, une app MacOS/Linux ou encore
un site web (ou les 4).

Avant de commencer, il faut savoir que c'est une très bonne idée de démarrer d'un template, et il y en a beaucoup

	* application simple : https://github.com/electron/electron-quick-start
	* application sécurisée : https://github.com/reZach/secure-electron-template

Des exemples d'applications aussi ça aide

	* https://github.com/hokein/electron-sample-apps
	* https://github.com/akabekobeko/examples-electron
	* fenêtre sans bords, https://github.com/binaryfunt/electron-seamless-titlebar-tutorial

Enfin en dernière note, je n'ai pas chercher à faire un site pour le moment donc j'ai utilisé
vraiment la base d'electron pour faire un petit jeu. Voici mes remarques avant de commencer

	*
		les versions d'electrons (v4, v9, v10, v12, ...) changent souvent donc souvent le code
		des tutoriels ne marche pas dans les dernières versions **donc je vais rester très abstrait**

	*
		j'ai préféré faire au plus simple, j'utilise par exemple des location.href pour changer de page
		et localstorage pour la sauvegarde d'informations.

Pour résumer, ayant codé sous :code:`electron 12.0.4` même si je n'ai pas encore très bien
compris toutes les directives en sécurité et utilisation des scripts,

	*

		dans package.json vous donnez à \"main\" le nom du js à lancer avec :code:`npm start`
		et donc dans vous avez start dans scripts

		.. code:: json

				"scripts": {
						"start": "electron ."
				}

	*

		le main contient la lancement de l'application et celui de la création de la fenêtre

		*

			:code:`remote` (que vous verrez partout) à été désactivé au profit de :code:`ipc`
			que je vous recommande d'utiliser (https://github.com/electron/remote pour la version non-deprecated).
			Si vous voulez activer remote (la version deprecated), il suffit de mettre :code:`enableRemoteModule: true`

			.. code:: js

				mainWindow = new BrowserWindow({
				 width: ???, height: ???, icon: ???,
				 webPreferences: {
				  preload: path.join(__dirname, './src/preload.js'),
				  enableRemoteModule: true
				 }
				});

		*

				vous pouvez afficher/cacher la console avec CTRL+SHIFT+I et en bonus, vous pouvez l'ouvrir au lancement
				ou interdire son ouverture

				.. code:: js

						// Open the DevTools.
						mainWindow.webContents.openDevTools();

						// Close the DevTools
						mainWindow.webContents.on("devtools-opened", () => {
						 mainWindow.webContents.closeDevTools();
						});

	*
		Après dans le fichier :code:`renderer.js` (si vous l'utilisez) vous n'avez pas accès à Node seulement aux
		variables stockées par preload dans :code:`windows`.

	*
		dans preload, vous avez accès au code de node, au document, ... donc faites le taff dedans. Moi je regarde
		l'url et j'adapte le code dans ce fichier selon la page.

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://nodejs.org/en/download/
	* https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
	* https://nodejs.dev/learn/the-package-json-guide
	* https://nodejs.dev/learn/semantic-versioning-using-npm
	* https://www.typescriptlang.org/
	* https://www.typescriptlang.org/docs/handbook/modules.html
	* https://www.codevscolor.com/typescript-class-example
	* https://godotengine.org/
	* electron

		* https://medium.com/@johndyer24/creating-and-deploying-an-auto-updating-electron-app-for-mac-and-windows-using-electron-builder-6a3982c0cee6
		* https://dev.to/milburngomes/getting-started-with-electronjs-ep9
		* https://www.akshaydeo.com/blog/2019/10/28/securing-electron-app-source-code/
		* https://sectigo.com/ssl-certificates-tls/code-signing
		* https://interactiveknowledge.com/insights/how-code-sign-electron-app-windows
		* https://www.electronjs.org/docs/tutorial/code-signing
		* https://www.geeksforgeeks.org/keyboard-events-in-electronjs/
		* https://developer.mozilla.org/fr/docs/Web/API/KeyboardEvent/key#key_values
		* https://www.electronjs.org/docs/tutorial/keyboard-shortcuts
		* https://github.com/jcubic/jquery.terminal
		* https://caniuse.com/urlsearchparams
		* https://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
		* https://github.com/binaryfunt/electron-seamless-titlebar-tutorial
		* https://github.com/hokein/electron-sample-apps
		* https://github.com/akabekobeko/examples-electron
		* https://github.com/DPr00f/electron-music-player-tutorial
		* https://stackoverflow.com/questions/12543237/play-audio-with-node-js
		* https://github.com/reZach/secure-electron-template/blob/master/app/electron/main.js
		* https://www.i18next.com/overview/getting-started
		* https://github.com/hokein/electron-sample-apps/tree/master/frameless-window
		* https://buddy.works/tutorials/building-a-desktop-app-with-electron-and-angular
		* https://stackoverflow.com/questions/57807459/how-to-use-preload-js-properly-in-electron
		* https://stackoverflow.com/questions/37884130/electron-remote-is-undefined/63612780#63612780
		* https://stackoverflow.com/questions/30682121/including-an-html-file-into-another-html-file-using-handlebars-js
		* https://stackoverflow.com/questions/45310489/is-it-safe-to-build-a-game-with-javascript-electron-three-js
		* https://github.com/nklayman/electron-multipage-example
		* https://stackoverflow.com/questions/59498415/navigating-through-multiple-pages-in-an-electron-app
		* https://stackoverflow.com/questions/33599908/electron-app-multiple-html-files
		* https://dev.to/milburngomes/getting-started-with-electronjs-ep9
		* https://stackoverflow.com/questions/63866077/electron-js-desktop-app-not-showing-even-after-calling-show-function-on-new-wi

