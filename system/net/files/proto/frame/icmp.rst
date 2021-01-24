===========
Frame IMCP
===========

IMCP (numéro 1)
	Le protocole IMCP (internet control message protocol) est utilisé pour gérer
	les erreurs/événements survenant sur le réseau tel qu’un hôte hors d’atteinte, un port non trouvé....

	Ex : ping (commande)

	Header

		* 1 octet pour le type
		* 1 octet pour le code
		* 2 octets pour le checksum
		* 4 octets pour des informations spécifiques

	Les types (code) sont 0 (echo reply), 3 (destination unreachable), 5 (redirect), 8 (echo), 11 (time exceeded).