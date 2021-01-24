================================
Tables de routage
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

	Proposition de correction n°1			<route/d1>

| :code:`[TAG] IUTSF ASR TD1 2019 S2`

2. Guess the routes
----------------------------------

.. image:: /assets/system/net/exercices/route4.png

1. De combien de réseaux est constitué notre réseau?
2. Donnez la table de routage de la machine A.
3. Donnez la table de routage de la machine Z.
4. Donnez la table de routage de la machine R.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<route/d2>

| :code:`[TAG] ENSIIE PWR CM1 2021 S2`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignants à l'IUT de Sénart-Fontainebleau)
	* Frédéric GERVAIS (enseignants à l'IUT de Sénart-Fontainebleau)
	* enseignant de l'ENSIIE du cours 2018-2019