.. _node:

========
Node.js
========

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 20/04/2021}`

Ceci n’est pas vraiment un cours, seulement des notes d’un débutant
de node.js, utilisant :code:`Discord.js` et :code:`Socket.io`
(donc pas encore pour un site web).

1. Introduction
=================

:code:`Node.js` est un outil javascript vous permettant d’avoir une architecture
client-serveur utilisant plusieurs threads.

Par exemple, vous pouvez envoyer une page web au client (en PHP) puis créer un lien entre
cette page (client) et vous serveur et envoyer des informations efficacement
à cette page : :code:`Socket.io`.

Vous pouvez télécharger node ici : `nodejs.org <https://nodejs.org/en/download/>`_. Il est
recommandé ensuite d’installer :code:`npm` qui va vous permettre d’installer facilement
des librairies (`npmjs <https://docs.npmjs.com/downloading-and-installing-node-js-and-npm>`_).

Vous pouvez aussi télécharger :code:`nodemon` pour que votre script soit relancé s’il crash par
exemple, très pratique pour un bot discord par exemple (:code:`npm install -g nodemon`).

2. package.json
======================

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
partager ce fichier pour permettre aux autres d’avoir les mêmes librairies
que vous, le fichier :code:`package.json` sera créé automatiquement si vous
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
js. Le module rends public des objets, par exemple :code:`FileSystem`
ou :code:`Client`. Vous pourrez donc utiliser ces object selon la documentation pour utiliser
votre librairie.

Alternativement, vous pouvez aussi faire pareil avec votre propre fichier js :code:`file.js`
dans lequel vous rendez comme ceci des objets public

.. code:: js

		module.exports = {
		 nom1: valeur1,
		 nom2: valeur2,
		}

Valeur1 et Valeur2 peuvent êtres des objects donc une valeur, une fonction, ou
une autre structure au même format. Si vous ne donnez pas d’étiquette (nom1, nom2, ...)
alors le nom de l’object sert d’étiquette.

Juste pour donner un exemple, on peut donc faire :code:`File.nom1` dans le code
qui a fait :code:`const File = require('./file.js');`.

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://nodejs.org/en/download/
	* https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
	* https://nodejs.dev/learn/the-package-json-guide
	* https://nodejs.dev/learn/semantic-versioning-using-npm