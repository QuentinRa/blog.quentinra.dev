=================================
Les structures physiques
=================================

Lan = réseau domestique/local
	Appareils connectés à notre réseau personnel. Vous pouvez voir cela comme tous les appareils
	connectés à votre box internet.

Wan = réseau mondial/étendu
	Un réseau d'ordinateur connectés entre-eux à l'extérieur de notre réseau. C'est
	un peu le reste du monde, si vous vous placez dans un réseau local.

Ethernet
	Il s'agit d'un réseau filaire qui relie toutes les machines d'un réseau à un routeur.

Routeur
	Il s'agit d'un boitier faisant la connexion entre des réseaux (Généralement
	entre un réseau local LAN et un réseau étendu WAN).

Hub/Switch
	Pour éviter des pertes de paquets, on connecte toutes les machines à un HUB qui reçoit les paquets
	et en envoi une copie à toutes les machines du réseau.

	La Switch gère le fait que les messages soient bien arrivés, qu'ils sont dans le bonne ordre et qu'ils
	sont intègres (donc pas corrompus).

	C'est pratique car si A envoi un paquet à B et B envoi un paquet à A alors les paquets seront perdus car ils
	vont se percuter. Le Hub vérifie donc qu'il est possible d'envoyer avant d'envoyer.

	Généralement, un routeur fait le role de Hub/Switch.