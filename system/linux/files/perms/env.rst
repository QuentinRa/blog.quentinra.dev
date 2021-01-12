=================================
Variables d'environnement
=================================

Les variables d'environnement sont des variables telles qui contiennent des informations
clés sur l'environnement tel que

	* PATH : contient une liste de dossier dans lesquels chercher les commandes
	* HOME : contient le chemin de votre domicile
	* PWD : votre dossier actuel
	* LANG : langue de l'utilisateur
	* ...

Rappelez vous du tout est fichier sous linux, donc la commande :code:`ls` qui liste les fichiers/dossier
d'un répertoire, est un script donc un fichier dans un certain repertoire (:code:`/bin/ls`).

Pour éviter de devoir donner le chemin absolu (/bin/ls) ou relatif à chaque fois qu'on voudrais utiliser la commande,
on l'ajoute à PATH, parce que dès qu'on tape une commande dans un terminal, alors il va regarder dans tous les
dossier du path s'il y a un exécutable avec ce nom, et si oui on va l'exécuter.

.. note::

	Tous les fichiers concernant la configuration de votre système sont dans :code:`/etc/` , si besoin.