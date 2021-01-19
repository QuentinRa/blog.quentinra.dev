================================
Protocoles : TCP, UDP, IMCP
================================

TCP (numéro 6)
	Le protocole TCP (transmission control protocol) est utilisé par les applications
	avec une garantie d’être informées en cas de pertes des données (=fiable).

	Ex : ssh (commande)

	Header

		* 2 bytes pour le port source
		* 2 bytes pour le port destination
		* 4 bytes pour le numéro de séquence (le seq)
		* 4 bytes pour le numéro de réception (le ack)
		* 1/2 byte pour l'offset
		* 1/2 byte : reserved
		* 1 byte pour le flag (1=F=Fin, 2=S=Syn, 4=R=Reset, 8=P=Push, 16=A=Ack, 32=..., 64=..., 128=...)
		* 2 bytes pour la frame/window/le cadre
		* 2 bytes pour la checksum
		* 2 bytes pour ...
		* 4 bytes pour des options (optionnel)

UDP (numéro 17)
	Le protocole UDP (user datagram protocol) est utilisé pour les applications qui
	ne souhaitent pas être informées si leurs données sont perdues mais cela leur permet
	de fonctionner plus vite. (=non fiable)

	Ex : dig (commande)

	Header

		* 2 byte pour le port source
		* 2 byte pour le port destination
		* 2 byte pour la taille
		* 2 byte pour le checksum

IMCP (numéro 1)
	Le protocole IMCP (internet control message protocol) est utilisé pour gérer
	les erreurs/événements survenant sur le réseau tel qu’un hôte hors d’atteinte, un port non trouvé....

	Ex : ping (commande)

	Header

		* 1 byte pour le type
		* 1 byte pour le code
		* 2 bytes pour le checksum
		* 4 bytes pour des informations spécifiques

	Les types (code) sont 0 (echo reply), 3 (destination unreachable), 5 (redirect), 8 (echo), 11 (time exceeded).

Autres

	* IGMP = 2
	* IGRP = 9
	* GRE = 47
	* ESP = 50
	* AH = 51
	* SKIP = 57
	* EIGRP = 88
	* OSPF = 89
	* L2TP = 115