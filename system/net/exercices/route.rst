================================
Routage et Filtres
================================

Niveau débutant
***********************

1. Étude de réseau
------------------------

On donne la configuration suivante.

.. image:: /assets/system/net/exercices/route1.png

Voici le résultat de certaines commandes données sur certaines machines :
:download:`résultat.txt <../../../assets/system/net/exercices/route1-2.txt>`.

Depuis A1, On ping B1. Qu'obtiendra-t-on parmi les possibilités suivantes ? Pourquoi ?

:code:`ping 172.16.2.1`.

(a)

	| PING 172.16.2.1 (172.16.2.1) 56(84) bytes of data
	| From 172.16.1.254 icmp_seq=1 Destination Host Unreachable
	| From 172.16.1.254 icmp_seq=2 Destination Host Unreachable
	| ...

(b)

	| PING 172.16.2.1 (172.16.2.1) 56(84) bytes of data
	| From 172.16.1.254 icmp_seq=1 Destination Net Unreachable
	| From 172.16.1.254 icmp_seq=2 Destination Net Unreachable
	| ...

(c)

	| PING 172.16.2.1 (172.16.2.1) 56(84) bytes of data
	| 64 bytes from 172.16.2.1: icmp_seq=102 ttl=63 time=1.61 ms
	| 64 bytes from 172.16.2.1: icmp_seq=103 ttl=63 time=1.57 ms
	| ...

(d)

	| PING 172.16.2.1 (172.16.2.1) 56(84) bytes of data
	| From 172.16.1.1 icmp_seq=1 Destination Host Unreachable
	| From 172.16.1.1 icmp_seq=2 Destination Host Unreachable
	| ...

(e)

	| connect: Network is unreachable

(f)

	| PING 172.16.2.1 (172.16.2.1) 56(84) bytes of data
	| <rien, le ping ne finit jamais>

| :code:`[TAG] IUTSF ASR TD4 2019 S2`

2. Expert en réseau
----------------------------

On donne la configuration suivante.

.. image:: /assets/system/net/exercices/route2.png

Où on n'a fait figurer qu'une machine représentative de chaque segment mais d'autres
machines existent sur chacun des segments. Le fonctionnement de l'organisation
exige que :

(a)

	N'importe quelle machine du réseau 10.10.10.0/24 doit pouvoir initier une communication
	vers n'importe quelle machine Y du réseau 172.16.10.0/24, et Y devra y répondre.

(b)

	N'importe quelle machine du réseau 172.16.10.0/24 doit pouvoir initier une communication
	vers n'importe quelle machine Z du réseau 192.168.10.0/24, et Z devra y répondre.

(b)

	N'importe quelle machine du réseau 192.168.10.0/24 doit pouvoir initier une communication
	vers n'importe quelle machine X du réseau 10.10.10.0/24, et X devra y répondre.

Ce sont là les seuls cas de communications qui peuvent avoir lieu.

Deux experts se sont penchés sur la question de la configuration du réseau et préconisent
ce qui suit.

Il s'agira d'analyser la solution de chacun des deux experts et indiquer
pourquoi elle réponds ou ne réponds pas aux exigences de l'organisation.

...

| :code:`[TAG] IUTSF ASR TD4 2019 S2`

3. iptables
-------------------

Pour chacune des situations suivantes, on écrit une règle de iptables qui réalise
l'objectif :

(a)

	Une passerelle relie trois réseaux : 192.168.0.0/16, 172.16.0.0/16 et l'extérieur. On veut
	permettre les connexions ssh entre les deux réseaux internes et empêcher les connexions ssh vers
	l'extérieur. Quelle règle mettre en place et où la mettre en place ?


(b)

	On a annoncé que le serveur web de son domaine est sur l'adresse routable
	addr_ip. En réalité, ce serveur web se trouve sur le LAN sur une machine avec une seule interface
	réseau ayant l'adresse 10.3.2.1. Quelle règle mettre en place et où la mettre en place afin que le trafic
	web entrant soit dirigé là où il faut ?

| :code:`[TAG] IUTSF ASR TD4 2019 S2`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

-----

**Crédits**
	* ...