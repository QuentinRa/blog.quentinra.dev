=============================================
3. Réseau - Les fonctions
=============================================

Obtenir une adresse IP
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

Sérialisation des entiers
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

Création d'un socket et fermeture
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

Lecture et écriture (ou envoi et réception)
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