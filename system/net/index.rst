.. _net:

================================
Réseau
================================

| :math:`\color{grey}{Version \ 0.8.15}`
| :math:`\color{grey}{Dernière \ édition \ le \ 24/01/2021}`

1. Introduction et Vocabulaire
===================================

La communication réseau se fait entre machines (aussi appelés nœuds).
Elles ont toutes un identifiant unique appelé adresse IP et communiquent selon un protocole.

Vous pouvez utiliser :code:`imunes` (http://imunes.net/) pour simuler un réseau.

.. toctree::
	 :maxdepth: 1

		 Définitions de base             <files/intro/voc>
		 Les structures physiques        <files/intro/voc2>
		 Introduction à imunes           <files/intro/imunes>

En particulier

	* Adresses IPV4 (théorie) : écriture (ndp, CIDR), notions (masques, ...)
	* Adresses IPV6 (théorie) : écriture (CHN, EUI64, SLAAC)
	* Protocoles (théorie) : TCP, UDP, IMCP, IP, frames et Ethernet
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

			Protocoles                 <files/proto/def>
			Couches et Modèle OSI      <files/proto/osi>

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
			Tables de routage          <exercices/route>
			Protocole ARP              <exercices/arp>
			Protocole IP               <exercices/ip>
			iptables (Nat/NetFilter)   <exercices/iptables>

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
	* https://community.cisco.com/t5/switching/datagram-vs-packet/td-p/3182138
	* https://community.fs.com/fr/blog/whats-the-difference-hub-vs-switch-vs-router.html
	* https://insolus.com/blog/internet-majuscule-minuscule
	* https://www.fun-mooc.fr/c4x/MinesTelecom/04003S03/asset/c_4_t.pdf
	* https://www.developpez.net/forums/d1422341/systemes/reseaux/protocoles/comprendre-entites-protocolaires/
	* https://www.edrawsoft.com/fr/network-protocol.html
	* https://fr.linkedin.com/learning/les-fondements-des-reseaux-les-protocoles-et-les-outils-cli/apprehender-l-encapsulation-de-donnees?autoplay=true&trk=learning-course_table-of-contents_video&upsellOrderOrigin=default_guest_learning
	* https://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model)#Layer_7_(Application_Layer)
	* https://fr.wikipedia.org/wiki/Liste_de_ports_logiciels
	* https://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model)

	* outils

		* https://www.browserling.com/tools/ip-to-bin
		* https://www.browserling.com/tools/bin-to-ip
		* https://www.browserling.com/tools/hex-to-ip
		* https://www.binaryhexconverter.com/hex-to-decimal-converter