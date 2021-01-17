=======================================
Structure basique et déclarations
=======================================

Un script bash commence forcément par la ligne :code:`#!/bin/bash`,
vous écrivez ensuite votre code et à la fin vous pouvez mettre un exit (facultatif
mais bon si vous mettez la première ligne avec c'est logique d'aussi mettre celle là).

.. code:: bash

	#!/bin/bash

	code

	exit;

Déclaration de variable

.. code:: bash

	nombre=5 # pas d'espaces
	texte=texte # quotes comme dans le terminal optionnelles
	texte="texte" # quotes comme dans le terminal optionnelles
	commande=`commande` # comme vu en bash, stocke le résultat de commande dans commande
	commande=$(commande) # comme vu en bash, stocke le résultat de commande dans commande

Utilisation

.. code:: bash

	trois=$[nombre-2] # dans un calcul

	echo $texte # de façon générale
	echo ${texte} # ou de façon générale

.. danger::

	Attention, une variable n'a pas besoin d'être initialisée en bash. Les variables ont par défaut
	"aucune valeur" (donc rien, pas de 0 ou autre).

	Je crois que le "aucune valeur" corresponds à une string vide mais je ne suis pas sûr.