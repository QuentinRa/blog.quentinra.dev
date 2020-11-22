=============================================
3. Réseau - Rappel de vocabulaire
=============================================

Socket
	Il s'agit de la "prise" que vous ouvrez de votre côté pour permettre
	à une machine de se connecter à la votre et inversement.

	Il existe en C deux "types" de Sockets principaux : les Sockets
	:code:`STREAM` si vous allez utilisez le protocole TCP,
	:code:`DATAGRAM` si vous utilisez le protocole UDP et enfin
	:code:`UNIX` si vous utilisez le protocole Unix.

Protocole
	Il s'agit de la façon utilisée pour transmettre les données, ce qui n'inclus
	pas seulement le type des données envoyés mais aussi l'ordre.

	.. warning::

		Notez que les entiers par exemple ne sont pas encodés (voir linux) de la même façon
		sur toutes les machines donc il se peut qu'une autre machine lise un mauvais nombre.

		Pour éviter ceci, utiliser des fonctions pour sérialiser vos données.

Protocole : UDP
	Il s'agit d'un protocole dans lequel il n'y a pas de connection ! Donc dès que le Socket
	est crée vous envoyez vos données sans vous soucier de si elles sont reçues ou non.

Protocole : TCP
	Vous devez vous connecter à une machine. Une fois ceci fait, vous échangez (écriture/lecture) et
	enfin vous fermez la connection.

Protocole : Unix
	Il s'agit d'un protocole spécial pour communiquer uniquement avec des machines sous linux.