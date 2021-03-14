===========
Arguments
===========

Vous pouvez envoyer des arguments au format JSON au Dockerfile. Par exemple si le façon de construire votre image change
en fonction, vous pouvez un FROM pour chaque gamme de versions.

.. code-block:: bash

	ARG CODE_VERSION=latest #=latest est facultatif, latest=valeur par défaut
	FROM base:${CODE_VERSION}
	ARG CODE_VERSION # il faut redéclarer localement si vous voulez utiliser l'argument dans le FROM
	#...

	FROM extras:${CODE_VERSION}
	#...