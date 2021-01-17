================================
Tables de routages et ARP
================================

Niveau débutant
***********************

1. Tables de routage
==========================

Kernel IP Routing Table

============= ============== =============== ===== ====== ==== === =====
Destination   Gateway        Genmask         Flags Metric Ref  Use IFace
============= ============== =============== ===== ====== ==== === =====
92.103.29.192 0.0.0.0        255.255.255.240 U      0      0    0   eth0
172.16.0.0    0.0.0.0        255.255.0.0     U      0      0    0   eth1
127.0.0.0     0.0.0.0        255.0.0.0       U      0      0    0   lo
0.0.0.0       92.103.29.193  0.0.0.0         UG     1      0    0   eth0
============= ============== =============== ===== ====== ==== === =====

(a) \
	Combien d'interfaces réseau cette machine possède-t-elle ?

(b) \
	Les adresses dans la colonne gauche sont-elles des adresses de hosts ou des adresses
	de réseaux ? Réécrire ces adresses en utilisant la notation CIDR.

(c) \
	Qu'arrive-t-il à un paquet émis par cette machine à destination de 172.16.1.117 ?
	de 172.16.2.117 ? de 172.17.1.117 ? de 92.103.29.200 ? 92.103.29.208 ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<arp/d1>

| :code:`[TAG] IUTSF ASR TD1 2019 S2`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignants à l'IUT de Sénart-Fontainebleau)