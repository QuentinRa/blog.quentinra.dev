======================
Exemples réseau
======================

1. TCP
=====================

1.1 Serveur
************

.. code:: c

	#include <stdio.h>
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <string.h>
	#include <libnet.h>

	typedef struct sockaddr SA;

	int open_listenfd(int port){
		int listenfd, optval = 1;
		struct sockaddr_in serveraddr;

		if ((listenfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
			return -1;

		if (setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, (const void *)&optval, sizeof(int)) < 0)
			return -1;

		bzero((char *) &serveraddr, sizeof(serveraddr));
		serveraddr.sin_family = AF_INET;
		serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
		serveraddr.sin_port = htons((unsigned short) port);

		if (bind(listenfd, (SA *)&serveraddr, sizeof(serveraddr)) < 0)
			return -1;

		if (listen(listenfd, 1024) < 0)
			return -1;

		return listenfd;
	}

1.2 Client
************

.. code:: c

	#include <stdio.h>
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <string.h>
	#include <libnet.h>

	typedef struct sockaddr SA;

	int open_clientfd(char *hostname, int port){
		int clientfd;
		struct hostent *hp;
		struct sockaddr_in serveraddr;

		if ((clientfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
			return -1;

		if ((hp = gethostbyname(hostname)) == NULL)
			return -2;

		bzero((char *) &serveraddr, sizeof(serveraddr));
		serveraddr.sin_family = AF_INET;
		bcopy( (char *) hp->h_addr, (char *) &serveraddr.sin_addr.s_addr, hp->h_length);
		serveraddr.sin_port = htons(port);

		if (connect(clientfd, (SA *)&serveraddr, sizeof(serveraddr)) < 0)
				return -1;

		return clientfd;
	}

2. UDP
=====================

2.1 Serveur
************

.. code:: c

	#include <stdio.h>
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <string.h>
	#include <libnet.h>

	typedef struct sockaddr SA;

	int open_listenfd(int port){
		int listenfd, optval = 1;
		struct sockaddr_in serveraddr;

		if ((listenfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
			return -1;

		if (setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, (const void *)&optval, sizeof(int)) < 0)
			return -1;

		bzero((char *) &serveraddr, sizeof(serveraddr));
		serveraddr.sin_family = AF_INET;
		serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
		serveraddr.sin_port = htons((unsigned short) port);

		if (bind(listenfd, (SA *)&serveraddr, sizeof(serveraddr)) < 0)
			return -1;

		return listenfd;
	}

2.2 Client
************

.. code:: c

	int open_clientfd(){
		int clientfd;

		if ((clientfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) return -1;

		return clientfd;
	}