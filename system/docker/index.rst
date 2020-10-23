.. _docker:

================================
Docker
================================

| :math:`\color{grey}{Version \ 1.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/10/2020}`

1. Présentation de Docker
==============================

1.1 Pourquoi ?
****************************

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
****************************

Docker = Conteneur permet d'empaqueter une application sous la forme d'une "image" [#0]_.

C'est cette image qui sera transmise (=mise en production/partagée), et son exécution lancera le logiciel.

Vous allez écrire un fichier **DockerFile**, qui une fois compilé vous donnera une image.
Puis sur n'importe quelle machine, vous pouvez lancer votre application avec
:code:`docker run [nom_image]`.


1.2 Écrire son DockerFile
****************************

Un fichier DockerFile doit obligatoirement s'appeler DockerFile (sans extension).
Les instructions de votre DockerFile seront exécutés via la commande docker.

1.3 Isolation
****************************

Une machine virtuelle consiste à recréer entièrement une machine (OS=Système d'exploitation, système de fichiers...)
ce qui peu être trop si tout ce qu'on veut tester/déployer c'est une application.

Un Docker est moins isolé car il va utiliser le système de fichiers, la RAM, le CPU du système actuel.
Les échanges entre ce qu'il y a dans le conteneur et le système actuels passent par une API.

2. DockerFile
================================

2.1 Compiler un DockerFile
****************************

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
****************************

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
===================

.. note::

	[arg] signifie que arg est un argument optionnel donc vous n'êtes pas obligé de le passer
	à une instruction.

	{valeur} signifie que vous devez remplacer {valeur} par une valeur. Par exemple
	{nombre} sera remplacé par 5 (et non {5}).

3.1 Instruction basiques
****************************

**3.1.1 FROM**

| Forme: :code:`FROM {image}[:{version}] [as {name}]`

From indique l'image utilisée comme source (typiquement l'OS de base sur lequel les commandes marchent). Il s'agit généralement de la première ligne d'un DockerFile et elle est obligatoire.

La version est la version de l'image (:latest pour la dernière version).

.. note::

	Il est possible d'avoir plusieurs FROM, et vous pouvez leur donner un nom (avec as) pour les retrouver
	ou spécifier le FROM que vous voulez manipuler.

**3.1.2 WORKDIR**

| Forme: :code:`WORKDIR {path}`

Change le répertoire courant.

**3.1.3 ADD**

| Forme: :code:`ADD [--chown={user}:{group}] {src} {dest}`

Récupère un fichier source (depuis un chemin/url) et le place à destination.
Sous linux uniquement, chown permet de définir les permissions du fichier.

**3.1.4 COPY**

| Forme: :code:`COPY [--chown={user}:{group}] {src} ... {dest}`
| Forme: :code:`COPY [--chown={user}:{group}] ["src", ...,"dest"]`

Copie une ou plusieurs sources à une destination.
Sous linux uniquement, chown permet de définir les permissions du fichier.

**3.1.5 EXPOSE**

| Forme: :code:`EXPOSE {port}[/{protocole}]`

Rends un port (+protocole) accessible depuis l'extérieur du docker.

**3.1.6 USER**

| Forme: :code:`USER {name}`

Crée un utilisateur. Sous Windows, vous devez d'abord appeler la commande RUN net user /add {name}.

3.2 Instruction avancés
***************************

**3.2.1 VOLUME**

| Forme: :code:`VOLUME {path}`

Crée un point de montage externe. Vous pouvez d'abord ajouter des fichiers avant de monter le volume.

**3.2.2 RUN**

| Forme: :code:`RUN {command}`
| Forme: :code:`RUN "command1;command2;..."`
| Forme: :code:`RUN ["command","arg1","arg2"]`

La commande RUN permet d'exécuter des commandes. Les modifications sont sauvegardés dans l'image crée. Cette commande à pour but de préparer ce qu'il faut pour les prochaines instructions.

**3.2.3 LABEL**

| Forme: :code:`LABEL "nom_propriété"="valeur"`

Il s'agit d'une instruction qui définit des propriétés à l'image visibles avec docker image inspect {image_name}.

**3.2.4 ONBUILD**

| Forme: :code:`ONBUILD {INSTRUCTION} {ARGUMENT}`

Si cette image est utilisée comme base (FROM) pour une image, alors les instructions ONBUILD sont exécutées.

**3.2.5 STOPSIGNAL**

| Forme: :code:`STOPSIGNAL {code}`

Vous interagissez avec un programme en lui envoyant des signaux. Par exemple CTRL+C envoi un signal de mort dont le code vaut 9. Vous pouvez ici changer le signal requis pour arrêter le programme.

3.3 Instruction à l'exécution
**********************************

Il est possible d'exécuter du code à l'exécution, c'est à dire lorsque vous utilisez
:code:`docker run image`.

**3.3.1 CMD**

| Forme: :code:`CMD {command}`
| Forme: :code:`CMD "command1;command2;..."`
| Forme: :code:`CMD ["command","arg1","arg2"]`

| Il ne peut y avoir qu'une seule instruction CMD par DockerFile.
| Il s'agit d'une commande qui sera exécutée à l'exécution du docker.
| Elle sert à définir les paramètres par défaut du docker.

**3.3.2 ENTRYPOINT**

ENTRYPOINT est une alternative à CMD pour les commandes qui prennent des arguments.
Les arguments additionnels passés à l'image à l'exécution seront utilisées pour la commande.

| Forme: :code:`ENTRYPOINT {command}`
| Forme: :code:`ENTRYPOINT ["command","arg1","arg2"]:`

.. code-block:: bash

	docker build {image}
	docker run {image} arguments #ici les arguments sont passées à la commande donnée en ENTRYPOINT

3.4 Instruction qui modifient l'environnement
***********************************************

**3.4.1 Variables d'environnement**

Il est possible de créer/modifier des variables d'environnement [#1]_

.. code-block:: bash

	# déclaration
	ENV variable /home #ou
	ENV variable=/home

	# utilisation
	WORKDIR ${variable}
	WORKDIR $variable

	WORKDIR ${variable:-default} # si la variable n'existe pas, alors la valeur default est prise
	WORKDIR ${variable:+unset} # si la variable existe, alors elle sa valeur est supprimée

**3.4.2 Arguments**

Vous pouvez envoyer des arguments au format JSON au DockerFile. Par exemple si le façon de construire votre image change
en fonction, vous pouvez un FROM pour chaque gamme de versions.

.. code-block:: bash

	ARG CODE_VERSION=latest #=latest est facultatif, latest=valeur par défaut
	FROM base:${CODE_VERSION}
	ARG CODE_VERSION # il faut redéclarer localement si vous voulez utiliser l'argument dans le FROM
	#...

	FROM extras:${CODE_VERSION}
	#...

**3.4.3 Directives**

Vous pouvez spécifier des directives, obligatoire à la première ligne non vide (commentaires inclus)
de votre code donc avant le FROM.

Les directives vous permettent de changer la version du DockerFile ou encore le caractère d'échappement.

.. code-block::

	#syntax={syntaxe} syntaxe du DockerFile (ex: docker/dockerfile)
	#escape={caractère} changer le caractère d'échappement (\ par défaut)

4. Autre
=================

Kubernetes
	Il se peut que vous vouliez qu'une application soit lancée X fois et qu'il y ait toujours
	Y instances de votre applications en train de tourner.

	Kubernetes est une solution à ce type de problème.

.dockerignore
	Il se peux que le répertoire de votre DockerFile contiennent des images non nécessaire à son exécution.

	Vous pouvez préciser quels fichiers ne doivent pas être inclus dans l'image avec un DockerFile.

	La structure est la même que les fichiers ".ignore", les chemins/regex de chemins spécifiés sont exclus.

	.. code:: bash

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

.. [#1]
	PATH est une variable d'environnement, contenant tous les endroits susceptibles d'être intéressant à regarder
	lorsque vous cherchez à faire quelque chose.

	Par exemple si vous utilisez la commande ls : le shell regarde dans le path s'il existe une tel commande,
	trouve /bin/ls et l'exécute.

-----

**Crédits**
	* Denis Clavier (étudiant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://docs.docker.com/