===========
ENTRYPOINT
===========

ENTRYPOINT est une alternative à CMD pour les commandes qui prennent des arguments.
Les arguments additionnels passés à l'image à l'exécution seront utilisées pour la commande.

| Forme: :code:`ENTRYPOINT {command}`
| Forme: :code:`ENTRYPOINT ["command","arg1","arg2"]:`

.. code-block:: bash

	docker build {image}
	docker run {image} arguments #ici les arguments sont passées à la commande donnée en ENTRYPOINT