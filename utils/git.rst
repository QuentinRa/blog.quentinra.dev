.. _git:

================================
Git
================================

| :math:`\color{grey}{Version \ 1.0.4}`
| :math:`\color{grey}{Dernière \ édition \ le \ 16/02/2021}`

Git est un gestionnaire de version de votre code. Il vous permet de créer des sauvegardes
(appelées **commits**). Il facilite également le travail de groupe, en permettant a chacun
de partir d'un commit, de travailler de son côté (sur une **branche**) puis de fusionner
le code afin d'intégrer les modifications de chacun (**merge**).

1. Introduction
===================================

Vous pouvez utiliser un serveur git comme `Github <https://github.com/>`_ ou `GitLab <https://about.gitlab.com/>`_
ou héberger un serveur git chez vous avec `Gogs <https://gogs.io/>`_ par exemple.

Toutes les commandes :code:`git` sont dans le package git et sont appelées
en mettant :code:`git <commande> <autres arguments>`.

Vous pouvez installer git chez vous sous windows avec l'installeur de gitscm (https://gitforwindows.org/)
ou sous linux simplement avec :code:`sudo apt-get install git` (par exemple).

Lors de votre toute première utilisation (premier commit mais faites le dès le début), vous devez
spécifier votre nom+email. Cela se fait avec les commandes

.. code:: bash

	git config --global user.name "Votre nom"
	git config --global user.email "Votre email"

Pour éviter de devoir vous connecter a chaque commit, vous pouvez configurer une clef
ssh

	* :code:`ssh-keygen -t rsa -b 4096 -C "email"`
	* :code:`cat ~/.ssh/id_rsa.pub`
	* copier le texte affiché
	* allez sur git dans settings > clef ssh
	* ajouter la clef et lui donner un nom pour se souvenir la machine associée
	* terminé !

Si vous voulez avoir des commits vérifiés (donc marqué vérifié a côté de vos commits, rien de plus
donc totalement optionnel),
alors vous avez un tuto ici : https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key.

Généralement, une utilisation basique de git va se résumer à ça

.. code:: bash

	# la première fois (ou utilisez le lien ssh)
	git clone https://github.com/lgs-games/memorize.git

	# puis de façon quotidienne
	git pull # récupère la dernière version du serveur
	git add . # ajout des fichiers pour commit
	# création du commit
	git commit -m "un texte ici qui décrit mes modifications"
	# envoi sur le serveur
	git push

2. Les commandes basiques
======================================

:code:`git add <fichiers>` (ou git add . pour tout ajouter)
	Seulement les fichiers ajoutés seront commits.

:code:`git commit -m "description du commit"`
	Création de la sauvegarde, ayant pour description \"description du commit\". Le commit est local, il faudra l'envoyer
	sur le serveur.

:code:`git push`
	Envoi tous les commits locaux sur le serveur.

:code:`git pull`
	Récupère la dernière version du dépôt.

:code:`git clone url`
	Télécharge le répertoire à url (donner une url en http ou ssh) dans votre dossier courant.

	Sur github, sur la page du projet vous avez généralement un bouton vert pour télécharger le code
	qui vous donne l'URL HTTP ou l'URL SSH si vous avez été smart et avez généré une clef comme vu
	plus haut.

:code:`git status`
	Indique le status du dépôt, très utile. Donne le nombre de commits non envoyés, les fichiers ajoutés
	non commités et les fichiers non ajoutés.

Il est également possible que vous utilisiez les commandes

	* :code:`git init` : créé un dépôt git (il faudra après set-url)
	* :code:`git log` : voir des informations sur les derniers commits

3. Les commandes avancées
=============================

:code:`git branch <nom>`
	Créer une branche (=copie de votre code et de tous les commits précédents)
	depuis votre branche actuel (master par défaut).

:code:`git checkout <nom>`
	Vous déplacer sur une autre branche (attention, les modifications locales sont perdues)

:code:`git merge`
	Fusionne votre branche actuelle avec master. Si des fichiers ont étés modifiés dans les deux branches,
	alors vous devrez manuellement choisir quoi garder (vous allez voir des fichiers bizarres ============>...
	et faudra supprimer le code non voulu : c'est relou).

	Pour faire des merge un peu plus facile, vous pouvez utiliser un IDE comme Intellij qui vous montre une interface
	avec 3 fichiers : celui de votre branche, le résultat et celui de l'autre branche. Les lignes modifiés sont en couleur.
	Vous pouvez choisir quoi garder en cliquant sur les flèches et c'est super pratique.

:code:`git remote`
	Si vous avez changé l'URL du dépôt etc. ou voulez passer de HTTP à SSH, ... alors il faut généralement
	changer l'URL d'origin (ou re-télécharger le dépôt, parfois plus rapide).

		* :code:`git remote` : liste toutes les remote ?
		* :code:`git remote get-url origin` : affiche l'URL d'origin
		* :code:`git remote set-url origin nouvelle_url` : change l'URL d'origin

4. Bonne conduite
=================================

Commits atomiques
	Si possible et dans la mesure du raisonnable, essayer de faire des petits commits, par exemple
	un par fonctionnalité.

Commits détaillés
	Lorsque vous faites des commits, vous pouvez "leur donner une description". Il est généralement mieux de faire
	un commit de la forme

	.. code:: bash

		git commit -m "une courte description du commit

		un description
		plus longue et détaillée
		"

	Seulement la partie "courte" sera affichée dans le gestionnaire mais vous pourrez si besoin voir
	la partie longue.

Readme.md
	À la racine de votre projet, il est écrit en Markdown (.md) et contient une description du dépôt.

.gitignore
	À la racine de votre projet, il décrit les chemins de fichiers/dossiers qui ne seront pas ajoutés.
	Vous pouvez utiliser des regex (donc faire \*.o pour tous les fichiers .o par exemple).

	Site utile pour générer des .gitignore : https://www.toptal.com/developers/gitignore

5. Fonctionnalités expert (~Github)
========================================

Voici quelques fonctionnalités ultra pratiques mais possiblement compliquées a utiliser.
Elles sont disponibles sur Github mais toutes ne sont pas disponibles partout.

.. toctree::
	 :maxdepth: 1


		Pages Wiki & Documentation       <git/wiki>
		Intégration continues (actions)  <git/actions>
		PullRequest et Issues            <git/special>
		Organisation                     <git/org>
		Github pages                     <git/pages>

-----

**Crédits**
	* Anonymous#8678 (étudiant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://docs.github.com/en/github/using-git/changing-a-remotes-url
	* https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
	* http://adopteungit.fr/methodologie/2017/04/26/commits-atomiques-la-bonne-approche.html
	* https://dubrayn.github.io/IPS-DEV/git.html#1