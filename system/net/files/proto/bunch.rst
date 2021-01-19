================================
Protocoles : TCP, UDP, IMCP
================================

TCP (numéro 6)
	Le protocole TCP (transmission control protocol) est utilisé par les applications
	avec une garantie d’être informées en cas de pertes des données (=fiable).

	Ex : ssh (commande)

UDP (numéro 17)
	Le protocole UDP (user datagram protocol) est utilisé pour les applications qui
	ne souhaitent pas être informées si leurs données sont perdues mais cela leur permet
	de fonctionner plus vite. (=non fiable)

	Ex : dig (commande)

IMCP (numéro 1)
	Le protocole IMCP (internet control message protocol) est utilisé pour gérer
	les erreurs/événements survenant sur le réseau tel qu’un hôte hors d’atteinte, un port non trouvé....

	Ex : ping (commande)