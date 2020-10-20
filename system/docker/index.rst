.. _docker:

Docker
================================

1. Présentation de Docker
--------------------------------

1.1 Pourquoi ?
~~~~~~~~~~~~~~~~~~~~~~~~

Il se peut que vous voulez déployer (partager) une application, pour permettre
à d'autres personnes de l'utiliser.

Cependant, il se peut que pour que votre application marche, elle a besoin d'un environnement.

Environnement
	On peut définir un environnement comme
			* utilisateurs
			* fichiers
			* langue
			* architecture matérielle
			* système d'exploitation

Docker va vous permettre d'exécuter votre application peut importe la machine sur laquelle vous voulez
lancer votre application. Le plus est que Docker est léger et contrairement à une machine virtuelle, Docker
utilise les ressources de votre Machine.

.. L'utilité de Docker est que vous allez pouvoir exécuter votre application (qui va par exemple télécharger
	des fichiers manquants etc...), mais à la fin de l'exécution, votre machine sera inchangée !

1.1 Principe
~~~~~~~~~~~~~~~~~~~~~~~~

Docker = Conteneur permet d'empaqueter une application sous la forme d'une "image" [#0]_.

C'est cette image qui sera transmise (=mise en production/partagée), et son exécution lancera le logiciel.

Vous allez écrire un fichier **DockerFile**, qui une fois compilé vous donnera une image.
Puis sur n'importe quelle machine, vous pouvez lancer votre application avec
:code:`docker run [nom_image]`.


1.2 Écrire son DockerFile
--------------------------------

Un fichier DockerFile doit obligatoirement s'appeler DockerFile (sans extension).
Les instructions de votre DockerFile seront exécutés via la commande docker.

1.3 Isolation
--------------------------------

Une machine virtuelle consiste à recréer entièrement une machine (OS=Système d'exploitation, système de fichiers...)
ce qui peu être trop si tout ce qu'on veut tester/déployer c'est une application.

Un Docker est moins isolé car il va utiliser le système de fichiers, la RAM, le CPU du système actuel.
Les échanges entre ce qu'il y a dans le conteneur et le système actuels passent par une API.

2.1 Compiler un DockerFile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Un DockerFile se compile avec la commande :code:`docker build .` si le DockerFile est dans votre répertoire courant.

Vous avez ci-après quelques explications en détail.

.. code-block:: bash

		# -------- docker build ---------- #
		#
		# compile le DockerFile du dossier actuel (+sous répertoires), vous pouvez charger des fichiers d'un répertoire/url
		#   -f {chemin/DockerFile} si le DockerFile n'est pas dans le dossier courant
		#   -t {chemin/nom} spécifier où enregistrer l'image
		#
		docker build . # charger les fichiers du répertoire courant (récursif)
		docker build path/to/... # charger les fichiers d'un répertoire
		docker build url_git # charger les fichiers d'un dépôt GIT

2.2 Syntaxe basique
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La syntaxe générale est
	* une instruction en majuscules (FROM, RUN, WORKDIR, ... voir :ref:`instructions`)
	* puis les arguments de l'instruction

Un DockerFile ressemble généralement à ça.

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
--------------------------------

.. note::

	[arg] signifie que arg est un argument optionnel donc vous n'êtes pas obligé de le passer
	à une instruction.

3.1 Instruction basiques
~~~~~~~~~~~~~~~~~~~~~~~~~~~~



3.2 Instruction avancés
~~~~~~~~~~~~~~~~~~~~~~~~~~~~



3.3 Instruction à l'exécution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3.4 Instruction qui modifient l'environnement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


4. Autre
--------------------------------

Kubernetes
	Il se peut que vous vouliez qu'une application soit lancée X fois et qu'il y ait toujours
	Y instances de votre applications en train de tourner.

	Kubernetes est une solution à ce type de problème.

.dockerignore
	Il se peux que le répertoire de votre DockerFile contiennent des images non nécessaire à son exécution.

	Vous pouvez préciser quels fichiers ne doivent pas être inclus dans l'image avec un DockerFile.

	La structure est la même que les fichiers ".ignore", les chemins/regex de chemins spécifiés sont exclus.

	.. code::

		# les .exe ne seront pas ajoutés
		*.exe
		#si une règle exclu a.exe, alors son exclusion est annulée
		!a.exe
		# exclure un répertoire
		directory/

-----

.. [#0]
		Une image est un fichier dont la structure est sous la forme de couches dans lequel les fichiers sont empilés
		les uns au dessus des autres.

		Un image fonctionne toujours comme si c'était la première fois que vous la lanciez (pas de mémoire)

------

Crédits
	* Denis Clavier (étudiant à l'ENSIIE)

Sources
	* https://docs.docker.com/