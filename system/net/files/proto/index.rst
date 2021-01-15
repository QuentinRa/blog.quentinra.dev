================================
Protocoles
================================

Le protocole TCP/IP peut être représenté sous la forme de 4 niveaux qui vont des données
à envoyer au paquet envoyé. Chaque niveau effectue des opérations et ajoute des informations
permettant l’envoi du paquet.

Ces opérations sont réalisées par des protocoles (TCP, IP, IMCP...)

.. image:: /assets/system/net/cours/protocol.png

À titre informatif, les niveaux correspondent à (de haut en bas) :

	*	le niveau d’application qui spécifie le type d’application utilisé : mail, envoi de fichier…
	*	le niveau de transport (TCP et UDP).
	*	le niveau internet qui apporte une adresse et méthode de routage
	*	le niveau de liaison qui permet l’échange du paquet (protocole Ethernet et l’ARP).