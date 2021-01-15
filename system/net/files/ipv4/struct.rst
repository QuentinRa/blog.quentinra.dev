=================================
Structure IPV4
=================================

Une adresse IPV4 (Internet Protocol version 4) est une adresse sur
32 bits composées de deux parties :

	*	id_net : une partie fixe de l’adresse (bits fixés) qui permet d’identifier le réseau
	*	\
		id_host : les bits restants sont assignés à une machine. Lors que l'id_host vaut 0, on obtient
		l'adresse réseau, sinon l'adresse est une adresse machine.

Par exemple, votre hébergeur internet va vous donner une plage d'adresses dont le début est de
la forme 77.33.225.* et la dernière partie (*) est la partie host soit celle qui de chaque machine
(77.33.225.1, 77.33.225.2, ...).

.. hint::

	On insiste sur le fait que vous n'aurez pas une adresse IP en zéro (car c'est celle du réseau).