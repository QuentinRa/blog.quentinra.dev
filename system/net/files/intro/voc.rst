=================================
Définitions de bases
=================================

Protocole
	Une définition simple : forme des données + procédure d'envoi.

	Il s'agit de la manière dont les données sont transférés. Les machines se mettent d'accord
	sur le protocole pour que éviter des mauvaises interprétations.

	Il existe quelques protocoles connus au niveau machine qui sont UDP, TCP, ...

	Au niveau programmeur, le protocole consiste à déterminer le type des informations envoyés,
	les séparateurs, etc...

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

	Quelques exemples : :code:`eth0` (Ethernet0), ...