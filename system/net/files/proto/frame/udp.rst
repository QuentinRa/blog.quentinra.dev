===========
Frame UDP
===========

UDP (numéro 17)
	Le protocole UDP (user datagram protocol) est utilisé pour les applications qui
	ne souhaitent pas être informées si leurs données sont perdues mais cela leur permet
	de fonctionner plus vite. (=non fiable)

	Ex : dig (commande)

	Header

		* 2 octets pour le port source
		* 2 octets pour le port destination
		* 2 octets pour la taille
		* 2 octets pour le checksum