===========
Frame TCP
===========

TCP (numéro 6)
	Le protocole TCP (transmission control protocol) est utilisé par les applications
	avec une garantie d’être informées en cas de pertes des données (=fiable).

	Ex : ssh (commande)

	Header

		* 2 octets pour le port source
		* 2 octets pour le port destination
		* 4 octets pour le numéro de séquence (le seq)
		* 4 octets pour le numéro de réception (le ack)
		* 1/2 octet pour l'offset
		* 1/2 octet : reserved
		* 1 octet pour le flag (1=F=Fin, 2=S=Syn, 4=R=Reset, 8=P=Push, 16=A=Ack, 32=..., 64=..., 128=...)
		* 2 octets pour la frame/window/le cadre
		* 2 octets pour la checksum
		* 2 octets pour ...
		* 4 octets pour des options (optionnel)

Particularité

	* mode connecté (socket, listen, bind, ...)
	* contrôle d’erreur de transmission
	* très utilisé

Le protocole TCP utilise un système de seq pour "numéroter" les messages. Le receveur
envoi toujours un ACK pour attester la bonne réception.

	* On prends A et B
	* A génère un numéro de séquence x
	* A envoi un message, seq=x
	* B atteste, seq=x+1
	* B génère un numéro de séquence y
	* B réponds, seq=y
	* A atteste, seq=y+1