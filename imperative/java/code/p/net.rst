========
Réseau
========

Il est possible de créer un serveur local sur n'importe qu'elle machine mais toutes les machines
ne peuvent pas créer un serveur accessible hors du réseau. Toutes les machines peuvent par contre
se connecter à un serveur.

**Client**

.. code:: java

		//connexion
		//throws IOException, UnreachableHostException, SecurityException
		Socket s = new Socket(host, port);

		//lire
		InputStream i = s.getInputStream();

		//écrire
		OutputStream o = s.getOutputStream();

		//Attention !! vous devez forcer le système à lire/écrire avec flush
		//pour qu'il vide le tampon
		i.flush();
		o.flush();

**Serveur**

.. code:: java

		//création
		ServerSocket s = new ServerSocket(port);

		//attendre un client
		Socket	accept();

		//fermer
		void close();

**Méthodes utiles**

.. code:: java

		InetAddress inet;

		// retourne le nom d'Host de ce réseau
		inet.getHostName();

		// nom réseau vers adresse
		inet.getByName(String host);

		// Adresse locale
		inet.getLocalHost();