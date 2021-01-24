=========================
Headers et Fragmentation
=========================

Note sur les headers
-------------------------

Le header contient les informations utilisées par le protocole. Il est différent selon le protocol
et nous ne verrons que les protocoles IMCP (ping), TCP et UDP ainsi que IP.

Les protocoles peuvent être mentionnés dans un header par une valeur au lieu
d'un nom. Voici une liste, seulement nos 3 numéros de protocoles sont utiles à retenir

	* **IMCP** = 1
	* IGMP = 2
	* **TCP** = 6
	* IGRP = 9
	* **UDP** = 17
	* GRE = 47
	* ESP = 50
	* AH = 51
	* SKIP = 57
	* EIGRP = 88
	* OSPF = 89
	* L2TP = 115

On appelle trame/frame l'ensemble header+payload.

.. toctree::
	 :maxdepth: 1

		Frame IMCP      <frame/icmp>
		Frame TCP       <frame/tcp>
		Frame UDP       <frame/udp>
		Frame IP        <frame/ip>

Note sur la fragmentation
------------------------------

Maximum Transmission Unit (MTU)
	Pour éviter des pertes, généralement une taille maximum pour chaque adresse IP est définie. En local,
	cette limite est généralement de 65000ko mais pour les autres adresses c'est généralement vers
	10000ko.

	Si un paquet est trop gros, alors il est découpé. Des informations dans les headers permettent de
	reconstituer le paquet.

	Sa valeur par défaut est de 1500.

Certains paquets sont plus grands que la MTU (logique) et sont donc fragmentés. On peut alors
s'intéresser aux cas ou un paquet transite sur plusieurs réseaux ayant des MTU différentes.

Exemple

	* A envoi un message à B, qui passe par R1 puis R2
	* A-R1 (mtu 1500), R1-R2 (mtu 1000), R2-B (mtu 1500)
	* envoi d'un paquet de 1200
	* A-R1 : ok
	* R1-R2 : on découpe le paquet en deux (donc deux PDU)
	* attention, chaque paquet à son header (donc taille1=header+pdu1 et taille2=header+pdu2)
	* on se retrouve avec 2 PDU à l'entrée dans R2-B. On ne peut pas prévoir le comportement suivant
	* R2 peut fusionner les paquets
	* R2 peut envoyer les deux paquets qui seront fusionnés par B