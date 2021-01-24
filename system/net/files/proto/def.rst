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

Pour permettre une implémentation plus facile de chaque protocole, des couches
distinctes ayant chacune leurs protocoles ont étés introduites avec le modèle OSI.