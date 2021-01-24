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