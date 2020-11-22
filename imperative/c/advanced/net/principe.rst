=============================================
3. Réseau - Le principe
=============================================

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