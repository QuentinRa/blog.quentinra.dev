================================
Protocole IP
================================

Pour regarder plus en détails, le protocole IP (ipv4/ipv6) permet de
fragmenter un paquet en plusieurs paquets car la MTU ne permet pas l’envoi d’un
paquet de cette taille en une transmission.

La procédure d'envoi est une sorte de clap (message implique une confirmation de réception)

	* A envoi à B
	* B indique la bonne réception : ack
	* B réponds à A
	* A indique la bonne réception : ack

Le protocole Internet ressemble à ça (bleu = entête ip, gris = données) :

.. image:: /assets/system/net/cours/ip.png

Explications

	*	Version contient 4 ou 6 pour ipv4 ou ipv6.
	*

		IHL correspond à la taille de l’entête (zone bleu), 20 octet en général
		(c’est-à-dire du de version à destination IP comprise). On stockera la taille divisée par 4
		(soit 5 stocké pour 20octets).

	*	TPL : taille du paquet (en bits)
	*	Fragment ID : identifiant du paquet permettant de savoir dès que l’on fragmente un paquet, quels bouts sont associés.
	*	FLAG : 010 = ne pas fragmenter (D), 001 = fragments arrivent (M), 100 = réservé (X)
	*

		Fragment Offset : index de décalage depuis le début du package non fragmenté, doit coller avec la taille de
		tous les paquets précédents - taille header. (EN OCTETS donc TPL/8)

	*	TTL : durée de vie du paquet, c’est-à-dire le nombre max de transits
	*	Protocol : 1 (IMCP), 6 (TCP), 17 (UDP)

Remarque : la charge (payload)/données/contenu commence après l'adresse
destination (20 octets en général, soit la zone bleue). Sa taille est de :code:`TPL-IHL`.

Pour savoir si des paquets sont fragmentés, on doit vérifier :

	*	ils ont la même source
	*	ils ont la même destination
	*	ils ont le même id
	*	le paquet à l’offset 0 (et tous sauf le dernier) ont un flag[+] sur tcpdump ce qui signifie qu’un autre paquet va arriver par opposition au flag[none].
	*	ils ont le même protocole

Dans la commande ping, un flag[+] indique des fragments à venir.