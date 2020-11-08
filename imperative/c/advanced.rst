.. _language-c-advanced:

================================
Langage C - avancé
================================

.. warning::

	Cette partie est complémentaire de du tutoriel
	en C et contient des outils et connaissances sur des sujets pas forcément plus compliqués
	mais que vous n'allez pas forcément avoir besoin de connaitre pour savoir faire du c.

1. Débogueur (GDB)
=============================

Débogueur (GDB) : compiler avec l’option -g puis saisir la commande gdb a.out

Une fois dans la console GDB, voici les commandes

================== ================================================================================================================================
Commande           Explication
================== ================================================================================================================================
run                lance l'exécutable (jusqu’à un breakpoint/fin)
b x ou break x     met une pause (breakpoint) au point x (L’instruction actuellement affiché et la prochaine qui sera exécutée)
p ... ou print...  affiche une expression/variable
p[s]@x             pour afficher x cases d'un tableau depuis s
l ou list          liste 10 lignes
step               avance de une ligne
bt ou backtrace    affiche la pile des appels (tout ce qui est mis en attente car ils ont besoin du résultat d’une autre fonction pour continuer)
c ou continue      reprends l’exécution
q                  quitter
================== ================================================================================================================================

2. Makefile en c
=============================

...

3. Réseau
=============================

3.1 Vocabulaire
***************************************

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

3.2 Le principe
***************************************

En mode TCP (il y a une connection)

	* vous devez d'abord créer votre socket (type de protocole, ...)
	* vous devez ensuite associer (bind) votre socket à un port et une plage d'adresses (qui peuvent vous envoyer/à qui envoyer si client)
	* vous devez ensuite écouter sur votre socket (pour détecter les tentatives de communication)
	* si une tentative est détectée, alors :code:`accept` va vous donner un flux dans lequel échanger avec votre contact
	* vous envoyez/recevez des messages
	* vous fermez la connection avec le client
	* vous fermez votre socket

En mode UDP

	* vous créer vos socket
	* vous lui associez un port
	* vous écrivez/lisez (en précisant le port et la plage)
	* vous fermez votre socket

.. toctree::
    :name: exemple
    :maxdepth: 1

    Exemples                     <exemples-net>

3.3 Les fonctions
***************************************

3.3.1 - Obtenir une adresse IP
-------------------------------------------

Convertir une adresse "192.168.0.1" vers une adresse que la machine
sait utiliser et inversement.

.. code:: c

	//décimale pointée vers représentation hexadécimale
	int inet_aton(const char *cp, struct in_addr *inp);
	//représentation hexadécimale vers décimale pointée
	char *inet_ntoa(struct in_addr in);

	//obtenir une adresse ip depuis un nom de domaine
	// donc par exemple l'adresse IP de www.google.com
	struct hostent *gethostbyname(const char *name);
	struct hostent *gethostbyaddr(const char *addr, int len, int type);

	/*avec*/ struct hostent {
			char *h_name;		//nom officiel
			char **h_aliases;	//autres noms
			int h_addrtype;		//type : AF_INET = 0
			int h_lenght;		//taille des adresses en bytes
			in_addr** h_addr_list;	//list des adresses, null = fin
	};

3.3.2 - Sérialisation des entiers
-------------------------------------------

Ces fonctions vous permettent d'encoder vos entiers
et de les décoder de telle sorte à ce que peu importe la machine,
votre nombre ait la même valeur.

.. code:: c

	//machine vers format réseau
	ulong htonl(ulong hostlong);
	ulong htons(ulong hostshort);
	//Réseau vers format machine
	ulong  ntohl(ulong netlong);
	ulong  ntohs(ulong netshort);

3.3.3 - Création d'un socket et fermeture
-------------------------------------------

Notez que :code:`accept` vous retourne un descripteur,
c'est ce descripteur (socket client) que vous allez utiliser
dans read et write.

Les variables addr et addr_length sont vides à l'appel et seront remplies
avec les infos du client.

Notez également qu'une fonction retourne généralement -1 s'il y a eu une erreur.

.. code:: c

		#include<sys/socket.h>

		//AF_INET/AF_UNIX, protocole=0=DEFAUT
		int socket (int domaine,int type, int protocole);//retourne socket ou -1

		//Socket prends les connexion venant de adresse de taille (4 : IPV4, 6 IPV6)
		int bind(int socket, struct sockaddr* addr, int addr_length);

		//écoute sur la socket
		int listen(int socket, int nb_connexion_max);

		//retoure le socket du client. Stocke dans addr et addr_length les infos sur l'adresse du client
		//bloque jusqu'à ce qu'un client se connecte
		int accept(int socket, struct sockaddr* addr, int* addr_length);

		//fermeture
		//sens : 0=lecture; 1= écriture; 2=les deux
		int shutdown(int socket, int sens);

.. warning::

	Petit rappel mais vous n'utiliser pas listen en mode UDP (Socket Datagram).

	Il n'y a donc pas non plus de méthode accept, car on n'écoute pas sur le socket.

	Il faudra donc spécifier à chaque fois à qui envoyer le message (à chaque envoi/réception).

3.3.4 - Lecture et écriture (ou envoi et réception)
-----------------------------------------------------

Vous pouvez utiliser les fonctions read et write
comme pour les flux, mais seulement en mode connecté (tcp).

Vous pouvez également utiliser les fonctions recv et send,
mais seulement en mode connecté (tcp).

En mode UDP, vous devez spécifier l'adresse IP à chaque envoi, il s'agit
des fonction recv et send mais avec plus d'arguments.

.. code:: c

	//Read
	int recvfrom(int socket, void *message, int length, int flags, struct sockaddr *addr,socklen_t *addr_len);
	//Sent
	int sendto(int socket, void* message, int length, int flags, struct sockaddr *dest_addr,socklen_t dest_len);

4. Processus
==========================================

...

5. Threads et concurrence
==========================================

...

|

------

**Crédits**
	* enseignants à l'IUT de Sénart-Fontainebleau
		* Denis Monnerat
		* Luc Hernandez
		* Selma Naboulsi
		* Denis Monnerat
		* Frédéric Gervais
		* Pierre Petrik
		* Luc Dartois
		* Pierre Valarcher
	* enseignants à l'ENSIIE
			* Renaud RIOBOO
			* Christophe MOUILLERON
			* Julien FOREST
			* Ivan Augé
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* aucune