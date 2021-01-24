================================
Protocole ARP
================================

Niveau débutant
***********************

1. Routes et voisinage réseau
==================================

.. code:: bash

		$ ping -c 1 salle225-08.arda
		PING salle225-08.arda (172.16.2.81) 56(84) bytes of data
		64 bytes from salle225-08.arda (172.16.2.81) : icmp_seq=1 ttl=64 time=1.21ms

		--- salle225-08.arda ping statistics ---
		1 packets transmitted, 1 received, 0% packet loss, time 0ms
		rtt /min/avg/max/mdev = 1.208/1.208/1.208/0.000 ms

Compléter les adresses MAC et IP dans la trace tcpdump générée pendant l'exécution
de la commande ping précédente :

.. code:: bash

		34:17:eb:99:29:ad > ..:..:..:..:..:.., ethertype ARP (0x806), length 42:
		Request who-has ............... tell 172.16.2.161, length 28

		..:..:..:..:..:.. > ..:..:..:..:..:.., ethertype ARP (0x806), length 60:
		Reply ............... is-at 64:00:6a:8d:1a:31, length 46

		..:..:..:..:..:.. > ..:..:..:..:..:.., ethertype IPV4 (0x800), length 98:
		............... > ............... ICMP echo request, id 25160, seq 1, length 64

		..:..:..:..:..:.. > ..:..:..:..:..:.., ethertype IPV4 (0x800), length 98:
		............... > ............... ICMP echo reply, id 25160, seq 1, length 64

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<arp/d1>

| :code:`[TAG] IUTSF ASR TD2 2019 S2`

2. Routes et voisinage réseau II
=================================

.. code:: bash

		$ ip link
		1: lo: <LOOPBACK,UP,LOWER_UP> mtu 655536 ...
		 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
		2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 ... state UP ....
		 link/loopback 34:17:eb:99:29 brd ff:ff:ff:ff:ff:ff

		$ ip address show dev eno1
		2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 ... state UP ....
		 link/loopback 34:17:eb:99:29 brd ff:ff:ff:ff:ff:ff
		 inet 172.16.2.161/16 brd 172.16.255.255

		$ ip route
		default via 172.16.1.254 dev eno1 proto dhcp src 172.16.2.161 ....

		$ ip neigh
		172.16.2.84 dev eno1 lladdr 64:00:6a:8d:27:1c STALE
		172.16.2.31 dev eno1 FAILED
		172.16.2.110 dev eno1 lladdr 5c:f9:dd:70:ac:b7 STALE
		172.16.2.30 dev eno1 lladdr 24:6e:96:13:28:b4 REACHABLE
		172.16.2.106 dev eno1 lladdr 5c:f9:dd:70:a1:dc STALE
		172.16.2.254 dev eno1 lladdr 5c:54:00:e7:b9:0f REACHABLE

On a donné la commande suivante, sur la machine ayant la configuration ci-dessus :

.. code:: bash

		$ ping -c 1 www.archlinux.org
		PING apollo.archlinux.org (138.201.81.199) 56(84) bytes of data.
		64 bytes from apollo.archlinux.org (138.201.81.199): icmp_seq=1 ttl=56 time=16.8ms

		--- apollo.archlinux.org ping statistics ---
		1 packets transmitted, 1 received, 0% packet loss, time 0ms
		rtt /min/avg/max/mdev = 16.813/16.813/16.813/0.000 ms

Compléter les adresses MAC et IP dans la trace tcpdump générée pendant l'exécution
de la commande ping précédente :

.. code:: bash

		..:..:..:..:..:.. > ..:..:..:..:..:.., ethertype IPV4 (0x800), length 98:
		(tos 0x0, ttl 64, id 59310, offset 0, flags [DF], proto ICMP (1), length 64)
		............... > ............... ICMP echo request, id 27844, seq 1, length 64

		..:..:..:..:..:.. > ..:..:..:..:..:.., ethertype IPV4 (0x800), length 98:
		(tos 0x0, ttl 56, id 18522, offset 0, flags [none], proto ICMP (1), length 84)
		............... > ............... ICMP echo reply, id 27844, seq 1, length 64

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<arp/d2>

| :code:`[TAG] IUTSF ASR TD2 2019 S2`

3. Routes et voisinage réseau III
=================================

On considère la même configuration qu'en 3.

.. code:: bash

		$ ping -c 1 www.mit.edu
		PING e9566.dscb.akamaiedge.net (23.215.32.102) 56(84) bytes of data.
		64 bytes from a23-215-32-102.deploy.static.akamaitechnologies.com (23.215.32.102): ...

		--- e9566.dscb.akamaiedge.net ping statistics ---
		1 packets transmitted, 1 received, 0% packet loss, time 0ms
		rtt /min/avg/max/mdev = 3.202/3.202/3.202/0.000 ms

On a tracé le trafic par tcpdump et on a obtenu :

.. code:: bash

		IP (tos 0x0, ttl 64, id 37308, offset 0, flags [DF], proto UDP (17), length 57)
		 172.16.2.161.39552 > 172.16.1.21... : 43739+ A? www.mit.edu. (29)
		IP (tos 0x0, ttl 64, id 2345, offset 0, flags [none], proto UDP (17), length 470)
		 172.16.1.21... > 172.16.2.161.39552 : 43739 3/8/9 www.mit.edu. ... A 23.215.32.102

		IP (tos 0x0, ttl 64, id 37310, offset 0, flags [DF], proto UDP (17), length 57)
		 172.16.2.161.39552 > 172.16.1.21... : 45814+ A? www.mit.edu. (29)
		IP (tos 0x0, ttl 64, id 2346, offset 0, flags [none], proto UDP (17), length 510)
		 172.16.1.21... > 172.16.2.161.39552 : 45814 4/8/9 www.mit.edu. ... AAAA 2a02:26f0:d4:19d::255e

		IP (tos 0x0, ttl 64, id 13222, offset 0, flags [DF], proto ICMP (1), length 84)
		 172.16.1.161 > 23.215.32.102: ICMP echo request, id 29453, seq 1, length 64
		IP (tos 0x0, ttl 57, id 38416, offset 0, flags [none], proto ICMP (1), length 64)
		 23.215.32.102 > 172.16.1.161: ICMP echo reply, id 29453, seq 1, length 64

| :code:`[TAG] IUTSF ASR TD2 2019 S2`

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