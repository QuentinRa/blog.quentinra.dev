============
Directives
============

Vous pouvez spécifier des directives, obligatoire à la première ligne non vide (commentaires inclus)
de votre code donc avant le FROM.

Les directives vous permettent de changer la version du Dockerfile ou encore le caractère d'échappement.

.. code-block::

	#syntax={syntaxe} syntaxe du Dockerfile (ex: docker/dockerfile)
	#escape={caractère} changer le caractère d'échappement (\ par défaut)