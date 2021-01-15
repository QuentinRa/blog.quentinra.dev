=====================================================
NetWork address translation : translation d’adresse
=====================================================

La table NAT permet à une machine de communiquer avec une autre sans que celle si
n’ai connaissance la machine avec qui elle communique.

.. image:: /assets/system/net/cours/imunes.png

Par exemple, ici on peut faire en sorte que pc1 puisse communiquer avec
pc2 sans pour autant que pc2 sache que pc1 existe en utilisant le fait que pc2
connaisse host1 donc on peut dire à host1 :

	* \
		si un message arrive de pc1 (source) pour pc2 (dest) alors tu remplaces la source (pc1)
		par ton adresse et donc pc2 va croire que c’est host qui a envoyé le message
	* \
		lorsque pc2 répond, host1 à mémorisé son changement et donc remplace de
		nouveau la destination (pas la source cette fois car c’est pc2 qui envoie) par
		l’adresse de pc1. (ce procédé est fait automatiquement par host1)

Cela suppose que l’on appliquer nos commandes sur host1 car c’est avec son adresse que
l’on remplace la source/la destination.

La table NAT possède 3 chaines :

	*	POSTROUTING : si on souhaite changer la source (SNAT)
	*	PREROUTING : si on souhaite changer la destination (DNAT)
	*	OUTPUT : sur les paquets générés localement

.. image:: /assets/system/net/cours/iptables2.png

Ce qui signifie (schéma pour le schéma plus haut) que si une communication
sort de host par l’interface eth2 pour aller vers l’extérieur alors on remplace la source par 50.50.50.50.

Ce n’est pas optionnel. Il faut se rappeler que nos adresses en 172.16…. sont privées et
qu’elles ne permettent de nous identifier que dans le réseau. 50.50.50.50 est
l’adresse de l’interface qui interagit avec l’extérieure et donc une adresse routable (valide sur internet).