=================================
Structure IPV4
=================================

Une adresse IPV4 (Internet Protocol version 4) est une adresse sur
32 bits composées de deux parties :

	*	id_net : une partie fixe de l’adresse (bits fixés) qui permet d’identifier le réseau
	*	\
		id_host : les bits restants sont assignés à une machine. Lors que l'id_host vaut 0, on obtient
		l'adresse réseau, sinon l'adresse est une adresse machine.

**Exemple**

On considère l'adresse 77.33.225.0 qui notée en binaire (on verra comment dans la partie suivante) donne
01001101.00100001.11100001.00000000. On va dire qu'il y a 17 bits fixes (nombre pris au hasard ici, voir CIDR)
donc on a

	* id_net (17 bits) : 01001101.00100001.1
	* id_host (15 bits) : 1100001.00000000

Vous remarquez que id_host contient des 1 donc cette adresse n'est pas une adresse de réseau
mais une adresse de machine (host).