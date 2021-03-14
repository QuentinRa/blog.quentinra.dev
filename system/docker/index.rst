.. _docker:

================================
Docker
================================

| :math:`\color{grey}{Version \ 2.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/10/2020}`

1. Présentation de Docker
==============================

Il se peut que vous voulez déployer (partager) une application, pour permettre
à d'autres personnes de l'utiliser.

Cependant, il se peut que pour que votre application marche, elle a besoin d'un environnement.

**On peut définir un environnement comme**
	* utilisateurs
	* fichiers
	* langue
	* architecture matérielle
	* système d'exploitation (linux/windows)

Docker va vous permettre d'exécuter votre application peut importe la machine sur laquelle vous voulez
lancer votre application. Le plus est que Docker est léger et contrairement à une machine virtuelle, Docker
utilise les ressources de votre Machine.

.. toctree::
	 :maxdepth: 1

			Principe				        <files/how>
			Compiler un Dockerfile	<files/build>
			Lancer une image, ...   <files/start>

Voici quelques notes

	* lien pour installer docker sous linux (debian) : https://docs.docker.com/engine/install/debian/
	* :code:`docker -v` : tester docker installé
	* trouver des images docker : https://hub.docker.com/
	* :code:`docker run -it image` : lance l'image de façon interactive
	* :code:`docker ps` : liste les conteneurs (avec leur id)
	* :code:`docker rm id` : terminer un conteneur (l'id est obtenu plus haut/nom de la machine généré à chaque lancement)

2. Dockerfile
================================

La syntaxe générale est
	* une instruction en majuscules (FROM, RUN, WORKDIR, ... voir :ref:`instructions`)
	* puis les arguments de l'instruction

Un Dockerfile ressemble généralement à ça.

.. code-block:: bash

		# ceci est un commentaire
		# la première instruction est généralement FROM, voir la partie instructions

		# source : debian version 10
		FROM debian:10

		WORKDIR path # change le répertoire courant

		RUN commande # exécute une commande
		RUN commande_part_1 \
		# la ligne suivante est considérée comme à la suite de commande_part_1 même s'il y a 2 lignes de différence
		commande_part_2

		ADD path/to/source path/to/dest
		COPY path/to/source path/to/dest

		EXPOSE 80 # port 80=http accessible en dehors du conteneur

		CMD ["command", "arg"]

.. _instructions:

3. Instructions
===================

.. note::

	Attention aux notations qui vont suivre !

	[arg] signifie que arg est un argument optionnel donc vous n'êtes pas obligé de le passer
	à une instruction.

	{valeur} signifie que vous devez remplacer {valeur} par une valeur. Par exemple
	{nombre} sera remplacé par 5 (et non {5}).

Voici un résumé de quelques instructions, vous avez tous
les détails plus bas

	* :code:`FROM` : le système original sur lequel l'appli est codée (~par forcément un système)
	* :code:`WORKDIR` : Change le répertoire courant.
	* :code:`COPY` : copier des fichiers
	* :code:`EXPOSE` : ouvrir un port entre le PC actuel et l'appli Docker
	* :code:`USER` : crée un utilisateur
	* :code:`RUN` : lancer des commandes
	* :code:`LABEL` : métadonnées de l'image
	*
		:code:`VOLUME` : créé un point de montage externe, par exemple pour échanger entre
		le système de fichiers de l'image et votre système de fichiers.

.. toctree::
	 :maxdepth: 1

			FROM			  <files/i/from>
			WORKDIR			<files/i/wdir>
			ADD			    <files/i/add>
			COPY			  <files/i/copy>
			EXPOSE			<files/i/expose>
			USER			  <files/i/user>
			RUN			    <files/a/run>

Les instructions avancées sont

.. toctree::
	 :maxdepth: 1

			VOLUME			<files/a/volume>
			LABEL			  <files/a/label>
			ONBUILD			<files/a/onbuild>
			STOPSIGNAL	<files/a/stopsignal>

Il est possible d'exécuter du code à l'exécution, c'est à dire lorsque vous utilisez
:code:`docker run image`.

.. toctree::
	 :maxdepth: 1

			CMD			      <files/e/cmd>
			ENTRYPOINT		<files/e/entrypoint>

4. Commandes avancées
=============================

.. toctree::
	 :maxdepth: 1

			Variables d'environnement	 <files/p/env>
			Arguments		               <files/p/arg>
			Directives		             <files/p/dir>

5. Autre
=================

Kubernetes
	Il se peut que vous vouliez qu'une application soit lancée X fois et qu'il y ait toujours
	Y instances de votre applications en train de tourner.

	Kubernetes est une solution à ce type de problème.

.dockerignore
	Il se peux que le répertoire de votre Dockerfile contiennent des images non nécessaire à son exécution.

	Vous pouvez préciser quels fichiers ne doivent pas être inclus dans l'image avec un Dockerfile.

	La structure est la même que les fichiers ".ignore", les chemins/regex de chemins spécifiés sont exclus.

	.. code:: bash

		# les .exe ne seront pas ajoutés
		*.exe
		#si une règle exclu a.exe, alors son exclusion est annulée
		!a.exe
		# exclure un répertoire
		directory/

Voici un exemple tiré de hub.ducker.com

.. code:: docker

		FROM gcc:4.9 # gcc version 4.9
		COPY . /usr/src/myapp # déplace nos fichiers dans le répertoire courant
		WORKDIR /usr/src/myapp # on va faire gcc ici
		RUN gcc -o myapp main.c # génère notre exécutable
		CMD ["./myapp"] # à l'exécution, on exécute la commande ./myapp

-----

**Crédits**
	* Denis CLAVIER (étudiant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://docs.docker.com/
	* https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/