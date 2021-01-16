========================================
Notations : décimale pointée et CIDR
========================================

Notation décimale pointée
---------------------------

Il s'agit d'une écriture dans laquelle on sépare chaque octet de l'adresse par un .,
chaque octet est convertit de base 2 vers base 10.

Par exemple 77.33.225.0 est l'écrire pointée de l'adresse réseau 01001101001000011110000100000000.

Notation CIDR
--------------

La notation CIDR (Classless Interdomain Routing) permet d'obtenir l'adresse de réseau
tout en indicant le nombre de bits fixes.

Format : 77.33.225.0/24 ou encore 77.33.128.0/17.

L'idée est simplement de trouver le nombre de bits fixes donc id_net. Vous écrivez
alors en binaire les id_net bits de l'adresse et mettez le reste des bits à 0. Vous
réécrivez l'adresse sous la notation dp et mettez un /id_net à la fin.