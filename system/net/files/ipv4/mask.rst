=================================
Masques de réseau/diffusion
=================================

Masque de sous-réseau = netmask
------------------------------------

Le masque de sous-réseau ou netmask est une adresse permettant de savoir
le nombre de bits fixes d’une adresse ipv4.

Il se construit simplement :

	*	on met autant de bits à '1' que de bits fixes
	*	on met les bits restants à '0' pour atteindre 32 bits

Ex: soit l'adresse réseau 77.33.225.0 (01001101001000011110000100000000),
la partie fixe est 77.33.225 soit les 24 premiers bits donc on met 24 '1' et
8 '0' ce qui donne le masque de sous-réseau 255.255.255.0 (11111111111111111111111100000000)

Construction à partir de la notation CIDR. Soit 77.33.128.0/17.

	*	on prend le quotient et le reste de 15 (=32-17)/8 (=un octet) soit quotient = 2 et reste = 1
	*	on écrit quotient fois 255. donc ici 2 : 255.255.
	*	on fait ensuite 255 (=max) - 2^(8 - 1 (=reste)) + 1 = 255-128+1=128
	*	on ajoute le résultat et si encore des octets alors on met .0 ce qui donne 255.255.128.0

Masque de diffusion = broadcast mask
----------------------------------------

Il s'agit dans l'adresse de réseau dans laquelle tous les bits de la partie host
sont à 1. Il s'agit d'une adresse qui englobe toutes les adresses du réseau
et qui cible donc plusieurs machines.

Ex: soit l'adresse réseau 77.33.225.0/24 (01001101001000011110000100000000),
en remplaçant la partie host par des 1, on obtient 77.33.225.255 (01001101001000011110000111111111).