================================
Ethernet
================================

L’Ethernet (une réalisation de la norme IEE 802.3) est une technologique qui connecte
par un câble des nœuds (=machines) à un HUB (=switch) avec une certaine méthode pour émettre et lire.

.. image:: /assets/system/net/cours/ether.png

Le Hub reçoit un signal sur un port et le renvoi sur tous les autres ports. Donc ici,
nœud1 et en contact avec nœud2 et nœud3 et réciproquement alors qu’ils ne sont pas directement relié !

La technique utilisée est CSMA/CP (Carrier sensitive multiple access with collision detection)
qui est explicable facilement ainsi :

	*	les interfaces écoutent le réseau et détectent l’absence de signal
	*	elles envoient alors un message et écoutent s’il y a collision

		*	s’il y a collision, alors elles préviennent que le signal va être renvoyé
		*	le renvoient (délais aléatoire pour chaque carte interface)

	*	puis elles retournent en mode écoute

La trame Ethernet est la suivante :

.. image:: /assets/system/net/cours/trameE.png

La partie mac destination contient l’adresse de la machine destinatrice,
mac destination est la Mac de l’adresse de la machine émettrice.

Payload (=charge) contient les données de ce que l’on transporte, sa taille est limitée par le MTU.

MTU : Maximum transmission unit, il s’agît du nombre maximum d’octet que l’on est
capable de traiter en un seul coup (1500 généralement).