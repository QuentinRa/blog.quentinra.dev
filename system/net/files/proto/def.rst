=========================
Protocoles
=========================

Protocole
	Une définition simple : forme des données + procédure d'envoi. Il s'agit donc
	de la façon dont les données sont échangées.

	L'objet échangé est appelé PDU (Protocol Data Unit) est est constitué

		* d'un header/en-tête contenant les informations du protocole (taille change selon protocole)
		* de données appelées Payload ou charge.

	Le payload ne corresponds pas forcément au message envoyé, un message passe par plusieurs
	protocoles donc les headers de l'ancien protocole deviennent le payload. Il faut refaire
	toutes les étapes dans l'autre sens pour obtenir votre message (re extraire tous les headers).

Elements d'un protocole
	Les éléments principaux de mise en place d'un protocole sont la détermination

		* du format et de la structure (endianness ? format des flottants ? charset ? séparateur ? ...)
		* de la méthode pour transférer les données
		* de la gestion des erreurs (dans quels cas on considère qu'il y a une erreur, que faire, ...)
		* détermination du début et de la fin de la communication

	Les étapes sont

		* Choisir la couche N-1
		* Déterminer l'API
		* Coder les services, en utilisant l'API de la couche N-1

Couches et OSI
	Pour permettre une implémentation plus facile de chaque protocole, des couches
	distinctes ayant chacune leurs protocoles ont étés introduites avec le modèle des 7 couches OSI
	(voir partie suivante). Ceci permet aux protocoles de ne pas devoir refaire tout de zéro
	et de repartir d'une couche inférieure.

	TCP/IP est un protocole ont une structure basée sur le modèle OSI mais avec uniquement 4 couches
	(voir partie suivante).

API
	Chaque protocole implémente une API de la couche du niveau inférieur (dite N-1).

	Exemple : Le protocole HTTP est implémenté par le protocole de Firefox, Chrome, Edge, Apache, ...
	donc faire la commande :code:`GET /` marche partout car ils ont respecté l'API et peuvent
	donc communiquer entre eux. Bien sûr Firefox, ... n'ont pas codé le même code pour réaliser l'API
	cependant ce code est caché.

Service
	On appelle services les fonctions d'une API.

Automate
	Il s'agit d'un mot que je n'ai jamais vu en réseau mais qui indique l'ensemble des cas
	de communication possibles (comme un automate en UML/Maths).

Message Sequence Chart (MSC)
	Les échanges entre A et B via un protocole suivent un format déterminé : c'est la MSC qui illustre
	un exemple d'échange utilisant le format.