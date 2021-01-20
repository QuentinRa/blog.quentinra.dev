================================
Protocole IP
================================

Niveau débutant
***********************

1. tshark and tcpdump
==================================

La trace suivante fournie par tcpdump décrit le trafic généré suite au lancement
d'une certaine ligne de commande :

.. code:: bash

		IP (tos 0x0, ttl 64, id 34443, offset 0, flags [+], proto ICMP (1), length 1500)
		 172.16.3.80 > 172.16.2.161: ICMP echo request, id 2971, seq 1, length 1480
		IP (tos 0x0, ttl 64, id 34443, offset 1480, flags [none], proto ICMP (1), length 596)
		 172.16.3.80 > 172.16.2.161: ip-proto-1
		IP (tos 0x0, ttl 64, id 47978, offset 0, flags [+], proto ICMP (1), length 1500)
		 172.16.3.161 > 172.16.2.80: ICMP echo reply, id 2971, seq 1, length 1480
		IP (tos 0x0, ttl 64, id 47978, offset 1480, flags [none], proto ICMP (1), length 596)
		 172.16.3.161 > 172.16.2.80: ip-proto-1

Lorsqu'on demande à tshark de fournir une trace pour la même ligne de commande il dit
:download:`résultat.txt <../../../assets/system/net/exercices/ip2.txt>`.

(a) Expliquer pourquoi autant de datagrammes ont voyagé
(b) Quelle a été cette ligne de commande ?
(c) tshark ne semble par être en accord avec tcpdump sur la valeur a placer dans le champ fragment offset. Que se passe-t-il ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<ip/d1>

| :code:`[TAG] IUTSF ASR TD2 2019 S2`

2. PAYLOAD IP
============================

Le paquet suivant a été montré par tcpdump :

| 4500 00dd 1819 0000 4011 0572 ac10 0115
| ac10 0350 0035 86c7 00c9 3a06 b4d3 8180
| 0001 0001 0004 0004 0377 7777 0667 6f6f
| .......................................
| .......................................

(a) Ce paquet provient-il de la fragmentation d'une autre paquet ?
(b) Quelle est la longueur de l'en-tête ?
(c) Où commence la charge (payload) IP ? Quelle est la longueur (en octets) de cette charge ?
(d) Quel protocole est transporté par ce paquet ?
(e) Quelles sont en notation décimale pointée les adresses source et destination ?

Mêmes questions pour ce paquet.

| 4500 0054 c886 4000 4001 143d ac10 0350
| ac10 0275 0800 fd82 5487 0001 8c8f 2d59
| fd08 0400 0809 0a0b 0c0d 0e0f 1011 1213
| .......................................
| .......................................

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<ip/d2>

| :code:`[TAG] IUTSF ASR TD2 2019 S2`

2. Fragmentation IP
============================

Par quoi les cinq datagrammes IP suivants sont-ils liés ? Quelle en est la machine
destinataire ? Doit-elle s'attendre à l'arrivée d'autres datagrammes liés à ceux-ci ? Reconstituer
les datagrammes dans l'ordre logique. Quels sont les noms et valeurs du paramètre
réseau qui est responsable de cet événement ?

(a)

		| 4500 05dc bd4c 222b 4001 37c4 ac10 0350
		| ac10 0275 5051 5253 5455 5657 5859 5a5b
		| 5c5d 5e5f 6061 6263 6465 6667 6869 6a6b
		| .......................................
		| .......................................

(b)

		| 4500 05dc bd4c 20b9 4001 3936 ac10 0350
		| ac10 0275 c0c1 c2c3 c4c5 c6c7 c8c9 cacb
		| cccd cecf d0d1 d2d3 d4d5 d6d7 d8d9 dadb
		| .......................................
		| .......................................

(c)

		| 4500 006c bd4c 02e4 4001 5c7b ac10 0350
		| ac10 0275 1819 1a1b 1c1d 1e1f 2021 2223
		| 2425 2627 2829 2a2b 2c2d 2e2f 3031 3233
		| .......................................
		| .......................................

(d)

		| 4500 05dc bd4c 2000 4001 39ef ac10 0350
		| ac10 0275 0800 53bf 5553 0001 369d 2d59
		| 9cff 0000 0809 0a0b 0c0d 0e0f 1011 1213
		| .......................................
		| .......................................

(e)

		| 4500 05dc bd4c 2172 4001 387d ac10 0350
		| ac10 0275 8889 8a8b 8c8d 8e8f 9091 9293
		| 9495 9697 9899 9a9b 9c9d 9e9f a0a1 a2a3
		| .......................................
		| .......................................

| :code:`[TAG] IUTSF ASR TD2 2019 S2`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

-----

**Crédits**
	* ...