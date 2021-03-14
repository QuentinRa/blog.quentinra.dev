=======
FROM
=======

| Forme: :code:`FROM {image}[:{version}] [as {name}]`

From indique l'image utilisée comme source (typiquement l'OS de base sur lequel les commandes marchent).
Il s'agit généralement de la première ligne d'un Dockerfile et elle est obligatoire.

Vous pouvez utiliser une image comme source, donc par exemple si vous utilisez python, vous
allez probablement faire un smart move en cherchant une image python. Vous pouvez
trouver des images ici : `https://hub.docker.com/ <https://hub.docker.com/>`_. Vous avez
dans tags les versions.

La version est la version de l'image (:latest pour la dernière version).

.. note::

	Il est possible d'avoir plusieurs FROM, et vous pouvez leur donner un nom (avec as) pour les retrouver
	ou spécifier le FROM que vous voulez manipuler.