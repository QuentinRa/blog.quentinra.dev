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
la partie fixe est 77.33.225 (choisi arbitrairement les 24 premiers bits) donc on met 24 '1' et
8 '0' ce qui donne le masque de sous-réseau 255.255.255.0 (11111111111111111111111100000000)

Construction à partir de la notation CIDR. Soit 77.33.128.0/17.

	*	on prend le quotient et le reste de 17/8 (=un octet) soit quotient = 2 et reste = 1
	*	on écrit quotient fois 255. donc ici 2 : 255.255.
	*	on fait ensuite :math:`255 (=max) - 2^{8 - 1 (=reste)} + 1 = 255-128+1=128`
	*	on ajoute le résultat et si encore des octets alors on met .0 ce qui donne 255.255.128.0

On va généraliser tout ça

	* on considère :math:`n` bits fixes, :math:`q` un quotient, :math:`r` un reste, :math:`mask` notre netmask
	* :math:`q = n/8` et :math:`r = n%8`
	* :math:`mask =` :math:`q` fois :math:`255.` (ex: q=2, :math:`255.255.`)
	* :math:`mask += "255 - 2^{8 - r} + 1"`
	* si on n'a pas nos 4 octets, on ajoute des :math:`.0` jusqu'à avoir 4 octets

C'est l'organisme qui génère les adresses de réseaux (par exemple votre hébergeur) qui vous
donne le nombre de bits fixes.

Masque de diffusion = broadcast mask
----------------------------------------

Il s'agit dans l'adresse de réseau dans laquelle tous les bits de la partie host
sont à 1. Il s'agit d'une adresse qui englobe toutes les adresses du réseau
et qui cible donc plusieurs machines.

Ex: soit l'adresse réseau 77.33.225.0/24 (01001101001000011110000100000000),
en remplaçant la partie host par des 1, on obtient 77.33.225.255 (01001101001000011110000111111111).

	* on a notre adresse en binaire
	* on mets les bits de 24 à 32 à 1
	* on réécrit notre adresse sous la forme décimale pointée

Vous l'utiliserez notamment avec le protocole ARP pour chercher une machine, mais
c'est de façon générale un très bon moyen d'envoyer un message à toutes
les machines d'un réseau.