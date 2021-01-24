==============================
Modèle OSI
==============================

Les 7 couches du modèle OSI représente
comment un message est envoyé.

	1. Couche Physique : hub, transfert de bits
	2. Couche Liaison : switch, transfert d'octets
	3. Couche Réseau : routeur, transfert de bloc d'octets
	4. Couche Transport : envoi des données entre processus
	5. Couche Session : ???
	6. Couche Présentation : ajout des headers etc.
	7. Couche Application : échange des données

Alternativement
------------------

Soit A et B deux machines.

Une application sur la machine A génère des données (octets)
qui forment un Datagram (octets empaquetés). On ajoute
l'en-tête d'application et le tout est routé.

L'en-tête d'application est remplacé par un en-tête IP
(avec destination, source) et on forme des paquets.

Les paquets sont transférés en LAN jusqu'au routeur.

On remplace le crée un header avec l'adresse MAC source et destination (du routeur et de B)
et on ajoute le paquet comme contenu.

On envoi via la carte réseau le paquet. La machine B fait les étapes dans
le sens inverse (réception carte réseau, paquet devient datagram devient des octets d'application)
et reçoit l'information.