========================================
Notations : décimale pointée et CIDR
========================================

Notation décimale pointée (dotted)
----------------------------------------

Il s'agit d'une écriture dans laquelle on sépare chaque octet de l'adresse par un .,
chaque octet est convertit de base 2 vers base 10.

Par exemple 77.33.225.0 est l'écriture pointée de l'adresse réseau 01001101001000011110000100000000.

Quelques notes

	* la forme est n.n.n.n avec n compris entre 0 et 255
	* chaque nombre (77, 33, ...) corresponds à 8 bits de la notation binaire
	* https://www.browserling.com/tools/ip-to-bin (et inversement)

Pour obtenir cette notation depuis le nombre binaire, on fait

	* nombre : :math:`01001101001000011110000100000000`
	* sépare en 4 blocs (octets) de 8 bits (4 * 8 = 32 bits = 4 octets)

		* :math:`01001101`
		* :math:`00100001`
		* :math:`11100001`
		* :math:`00000000`

	* on mets tout sur une ligne, séparé par des points
	* :math:`01001101.00100001.11100001.00000000`
	* on convertit (expliqué ici si besoin :ref:`enc_int`)
	* ce qui donne
	* :math:`77.33.225.0`

Notation CIDR
--------------

La notation CIDR (Classless Interdomain Routing) permet d'obtenir l'adresse de réseau
tout en indicant le nombre de bits fixes.

Format : 77.33.225.0/24 ou encore 77.33.128.0/17.

Le format est donc :code:`adresse/n`.

L'idée est simplement de trouver le nombre de bits fixes nécessaires pour déterminer id_net. Vous écrivez
alors en binaire les id_net bits de l'adresse et mettez le reste des bits à 0. Vous
réécrivez l'adresse sous la notation dp et mettez un /id_net à la fin.

En plus clair, vous avez :code:`n` bits fixes, vous allez donc

	* écrire votre adresse en binaire, mais seulement les n premiers chiffres
	* mettre tout ce qui reste à 0, jusqu'à avoir 32 bits
	* remettre l'adresse sous notation décimale pointée
	* mettre un :code:`\n` à la fin

Notez que ce nombre ne se devine pas, soit on vous le donne donc /n soit
on vous donne une adresse spéciale : le netmask qui existe uniquement
pour contenir cette information (voir partie suivante).