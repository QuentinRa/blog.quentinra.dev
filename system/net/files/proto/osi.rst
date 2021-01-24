==============================
Couches et Modèle OSI
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

Chaque couche à ses protocoles, voici une image

.. image:: /assets/system/net/cours/osi.png

Note : Les couches sont indépendantes.

Quelques protocoles d'application

	* FTP : File transfert protocole, transférer des fichiers d'une machine à une autre. :code:`Port 21`
	* SSH : se connecter à une machine distante de façon sécurisée. :code:`Port 22`
	* SFTP : FTP mais sécurisé. :code:`Port 22`
	* HTTP : protocole pour récupérer/envoyer des informations à un serveur web. :code:`Port 80`
	* HTTPS : protocole HTTP Sécurisé. :code:`Port 443`
	* SMTP : protocole de messagerie. :code:`Port 25`