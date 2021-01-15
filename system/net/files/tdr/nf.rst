================================
Filtre de paquets
================================

Le filtre de paquets (table filter) permet de décider ce que l’on doit faire avec un paquet :

	*	autoriser un paquet
	*	bloquer un paquet

Elle contient 3 chaines :

	*	FORWARD (paquets qui passent par la machine = transit)
	*	INPUT (paquets qui arrivent à destination de la machine)
	*	OUTPUT (paquets qui sortent de la machine)

.. image:: /assets/system/net/cours/iptable.png

Cette ligne de commande dit que tous les paquets qui rentrent venant de l’adresse 172.16.1.1
par le port 22 (ssh) suivant le protocol tcp doivent être détruit.
Cette règle est appliquée dans la table filter.