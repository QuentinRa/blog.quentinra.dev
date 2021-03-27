=================================
Définitions de bases
=================================

Internet et internet
	internet désigne un réseau de machines connectées entre elles.

	Internet désigne le plus grand réseau de machine interconnectés donc la version
	large.

Protocole
	Une définition simple : forme des données + procédure d'envoi. Il s'agit donc
	de la façon dont les données sont échangées.

	Exemples : TCP, UDP, FTP, IP, ...

Protocol Data Unit (PDU)
	Il s'agit de la forme utilisée pour échanger les données par un protocole. Il s'agit d'un
	ensemble contenant un en-tête (header) propre au protocole et des données.

	On va donner des noms a cet ensemble selon le protocole : paquet (TCP), datagram (UDP), ...

	On peut grossièrement dire paquet partout.

Adresse IPV4
	Une adresse IPV4 est de la forme 172.16.1.0. Elle est formée de 4 octets sur 32 bits.

	Certaines machines ont également un nom qui peux être utilisé à la place d'une adresse IP,
	mais cela ne marche que pour un réseau domestique.

Adresse MAC
	L'adresse MAC est une adresse physique unique correspondant à la carte réseau utilisée
	pour se connecter à internet (ex : 6 octets de la forme FF:FF:FF:FF:FF:FF).

Interfaces réseaux
	Une interface réseau est définie par ce qui fait la liaison entre notre machine et le réseau.
	On peut en avoir plusieurs.

	Une interface particulière est celle qui gère le réseau local/virtuel de notre machine.
	Elle est appelée lo (loopback) et est associée à l’adresse 127.0.0.1 (plage).

	En gros, ce qu'il vaut retenir c'est que toutes les machines font tourner un réseau local,
	:code:`localhost`. C'est pratique car vous pouvez l'utiliser pour communiquer des informations
	entre plusieurs applications en utilisant les protocoles réseaux.

	Quelques exemples : :code:`eth0` (Ethernet0), ...

Port
	Il s'agit de l'endroit où le canal utilisé par un protocol est ouvert. Un message sera
	envoyé depuis ce port et une machine devra envoyer sa réponse sur ce port.

	Généralement, pour des raisons de sécurité, ces ports sont changés de leur valeurs par défaut.
	Ils sont utilisés par les protocoles de la couche applicative.

	Quelques ports connus : 21 (ftp), 22 (ssh), 80 (http), ...