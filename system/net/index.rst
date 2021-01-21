.. _net:

================================
Réseau
================================

| :math:`\color{grey}{Version \ 0.7.13}`
| :math:`\color{grey}{Dernière \ édition \ le \ 21/01/2021}`

1. Introduction et Vocabulaire
===================================

La communication réseau se fait entre machines (aussi appelés nœuds).
Elles ont toutes un identifiant unique appelé adresse IP et communiquent selon un protocole.

Vous pouvez utiliser :code:`imunes` (http://imunes.net/) pour simuler un réseau.

.. toctree::
	 :maxdepth: 1

		 Définitions de bases            <files/intro/voc>
		 Introduction à imunes           <files/intro/imunes>

En particulier

	* Adresses IPV4 (théorie) : écriture (ndp, CIDR), notions (masques, ...)
	* Adresses IPV6 (théorie) : écriture (CHN, EUI64, SLAAC)
	* Protocoles (théorie) : TCP, UDP, IMCP, IP + frames et Ethernet
	* Tables de routage + Arp : comment trouver une machine et configurer son réseau

2. Adresses IPV4 :code:`théorie`
===================================

Les adresses seront souvent sous une forme binaire, donc on a introduit
deux notations : notation décimale pointée (+ masques) et la notation CIDR qui regroupe
toutes les informations.

Chaque réseau à deux adresses réservées (donc deux adresses en moins par sous-réseau)
qui sont le Masque de diffusion et le Masque de sous-réseau.

.. toctree::
	 :maxdepth: 1

			Structure IPV4	                           <files/ipv4/struct>
			Notations : décimale pointée et CIDR	     <files/ipv4/not>
			Masques de réseau/diffusion          	     <files/ipv4/mask>
			Compter le nombre de machines/attribution  <files/ipv4/count>
			Adresses IP privées                        <files/ipv4/private>

3. Adresses IPV6 :code:`théorie`
==================================

Les adresses IPV6 sont introduites car les adresses IPV4 ne permettaient plus
de représenter le nombre croissant de machines.

.. toctree::
	 :maxdepth: 1

			IPV6 et Notation CHN  <files/ipv6/not>
			EUI-64 et SLAAC       <files/ipv6/eui>

4. Protocoles :code:`théorie`
==============================

.. toctree::
	 :maxdepth: 1

			Protocoles                   <files/proto/index>
			Modèle OSI                   <files/proto/osi>
			Protocoles : TCP, UDP, IMCP  <files/proto/bunch>
			Protocole IP                 <files/proto/ip>
			Ethernet                     <files/proto/eth>

5. Table de routage et ARP :code:`théorie`
================================================

On peut configurer notre réseau tel que :

	*	permettre/empêcher une machine de voir une autre (tables de routage)
	*	permettre/empêcher une machine de communiquer avec une autre (filtres de réseaux)

.. toctree::
	 :maxdepth: 1

			ARP                   <files/tdr/arp>
			Table de routage      <files/tdr/iptables>
			Filtres de réseaux    <files/tdr/filter>

6. Connaissances générales
============================

.. toctree::
	 :maxdepth: 1

			LAN et WAN             <files/all/lw>
			Domaines et DNS        <files/all/dns>
			Plages A,B,C et CIDR   <files/all/cidr>

7. Commandes
========================

.. toctree::
	 :maxdepth: 1

			Récupérer des informations : ip, hostname, ifconfig, ss <files/c/c1>
			Commandes basiques : ping, dig, ncat, whois             <files/c/c2>
			Surveiller le trafic : wireshark, tshark, tcpdump       <files/c/c3>
			ARP et Filtres de réseaux : arp, route, iptables        <files/c/c4>

8. Exercices
===========================

.. toctree::
	 :maxdepth: 1

			Comprendre les notions     <exercices/cours>
			Tables de routages et ARP  <exercices/arp>
			Protocole IP               <exercices/ip>
			Routage et Filtres         <exercices/route>

-----

**Crédits**
	* Denis MONNERAT (enseignants à l'IUT de Sénart-Fontainebleau)
	* Luc HERNANDEZ (enseignants à l'IUT de Sénart-Fontainebleau)
	* Selma NABOULSI (enseignants à l'IUT de Sénart-Fontainebleau)
	* Frédéric GERVAIS (enseignants à l'IUT de Sénart-Fontainebleau)
	* Pierre PETRIK (enseignants à l'IUT de Sénart-Fontainebleau)
	* Pierre VALARCHER (enseignants à l'IUT de Sénart-Fontainebleau)
	* Luc DARTOIS (enseignants à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.futura-sciences.com/tech/definitions/tech-modele-osi-1252/
	* https://si.blaisepascal.fr/1t-le-modele-osi/
	* https://openclassrooms.com/fr/courses/857447-apprenez-le-fonctionnement-des-reseaux-tcp-ip/851033-la-creation-dinternet-le-modele-osi
	* https://www.reseaux-telecoms.net/actualites/lire-les-7-couches-du-modele-osi-28083.html
	* https://www.commentcamarche.net/contents/530-le-protocole-ip
	* https://fr.wikibooks.org/wiki/R%C3%A9seaux_TCP/IP/La_pile_TCP/IP

	* outils

		* https://www.browserling.com/tools/ip-to-bin
		* https://www.browserling.com/tools/bin-to-ip
		* https://www.browserling.com/tools/hex-to-ip
		* https://www.binaryhexconverter.com/hex-to-decimal-converter