=================================
Notation CHN
=================================

La notation CHN (Colon hexadecimal notation)

Une adresse ipv6 est codée sur 128bits soit 16 octets,
séparés par groupes de 2 octets avec ':'.

Ex : 416c696369612046616c636f6e234146 donne l’adresse IPV6 :
:code:`416c : 6963 : 6961 : 2046 : 616c : 636f : 6e20 : 3c33`.

Il existe des règles pour simplifier la notation :

	* les 0 au début d’un groupe d’octets peuvent être omis (...:0014:... devient ...:14:...)
	* un groupe d’octets avec que des zéro peut être remplacé avec 0 (...:0000:... devient ...:0:...)
	* \
		plusieurs groupes de zéro qui se suivent peuvent écrits :: mais seulement une seule fois
		donc on prend le plus grand groupe
		(ex: 416c:0000:0000:0046:0000:0000:0000:3c33 devient 416c:0:0:46::3c66)

Les types d’adresses en ipv6 sont :

.. image:: /assets/system/net/cours/ipv6m.png