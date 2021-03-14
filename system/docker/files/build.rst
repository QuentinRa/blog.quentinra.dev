=========================
Compiler un Dockerfile
=========================

Un Dockerfile se compile avec la commande :code:`docker build .` si le Dockerfile est dans votre
répertoire courant.

Vous avez ci-après quelques explications en détail.

.. code-block:: bash

		# -------- docker build ---------- #
		#
		# compile le Dockerfile du dossier actuel (+sous répertoires), vous pouvez charger des fichiers d'un répertoire/url
		#   -f {chemin/Dockerfile} si le Dockerfile n'est pas dans le dossier courant
		#   -t {chemin/nom} spécifier où enregistrer l'image
		#
		docker build . # charger les fichiers du répertoire courant (récursif)
		docker build path/to/... # charger les fichiers d'un répertoire
		docker build url_git # charger les fichiers d'un dépôt GIT