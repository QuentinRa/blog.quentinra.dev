========================
Protocole TCP/IP
========================

Le modèle TCP/IP, basé sur le modèle OSI, est découpé en 4 couches au lieu de 7.

  	* Application (couches 7,6,5)
  	* Transport (couche 4) : TCP/UDP (savoir a qui envoyé, socket, port)
  	* Réseau (couche 3) : Réseau/Internet (ethernet et ipv4/ipv6)
  	* Liaison/Physique (couche 2,1) : Accès au réseau, règles d'accès au média (WIFI, ADSL, ETHERNET)

Note: un socket (=prise) est une connexion ouverte à un certain port permettant à un protocole
de recevoir et d'envoyer (voir cours de réseau en C/Java).

Explication par l'exemple
-----------------------------

Soit A et B deux machines.

Une application sur la machine A génère des données (octets)
qui forment un Datagram (octets empaquetés). On ajoute
l'en-tête d'application et le tout est routé (envoyé au hub).

L'en-tête d'application est remplacé par un en-tête IP
(avec destination, source) et on forme des paquets.

Les paquets sont transférés en LAN (cable) jusqu'au routeur.

On crée un header avec l'adresse MAC source et destination (du routeur et de B)
et on ajoute le paquet comme contenu.

On envoi via la carte réseau le paquet. La machine B fait les étapes dans
le sens inverse (réception carte réseau, paquet devient datagram devient des octets d'application)
et reçoit l'information.

Encapsulation et la dés-encapsulation
	Il s'agit du fait que les données d'un protocole (header+payload) deviennent la payload du prochain
	protocole, qui ajoute un header à la place.

	Pour ré-obtenir la payload originale, on doit refaire l'étape dans le sens inverse (décapsule).

Exemple pratique
---------------------------

.. image:: /assets/system/net/cours/protocol.png

Détails

	* vous avez des données à envoyer
	*	ils sont compressés (via SMTP)=payload et on ajoute le header d'application
	* on envoi au N-1
	* payload:=header+payload et on ajoute le header TCP/UDP (méthode de routage)
	* on envoi au N-1
	* payload:=header+payload et on ajoute le header IP (indication de la destination, ...)
	* on envoi au N-1
	* payload:=header+payload et on ajoute l'adresse MAC (obtenue via ARP si besoin depuis l'IP). On fait l'échange via Ethernet.

Voilà le paquet est envoyé. Si vous regarder le payload, vous ne reconnaitrez
pas vos données car les données sont passées par IP, TCP/UDP et SMTP et
les headers de la N-1 ont étés mis dans la payload. Il faudra donc faire tous les étapes
dans le sens inverse pour lire les données.