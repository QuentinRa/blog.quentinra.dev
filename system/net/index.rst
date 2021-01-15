.. _net:

================================
Réseau
================================

| :math:`\color{grey}{Version \ 0.2.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 15/01/2021}`

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
deux notations : notation décimale pointée et la notation CIDR (qui permet
facilement de savoir combien on peut avoir de machines sur un réseau).

Chaque réseau à deux adresses réservées (donc deux slots en moins par sous-réseau)
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

...

5. Table de routage et ARP
==============================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune