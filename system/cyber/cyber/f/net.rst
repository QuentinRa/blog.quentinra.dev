========================================
4. CyberSécurité - Les problèmes du web
========================================

On rappelle d'une adresse IP est l'adresse d'une machine (127.0.0.1 = adresse IP locale). Il existe
des adresses publiques (n'importe qui peut vous trouver avec) ou des adresses privées (seuls ceux sur le même
réseau peuvent vous trouver).

Un protocole décrit comment sont échangés les données (ex: TCP, UDP).

Les données sont échangées entre deux machines (donc deux IP), en passant par un port et utilisant un protocole.

Le cours sur le réseau contient toutes les informations détaillées.

Fuites de données
	Il est important de vérifier tous les échanges de données faits sur un système car on peut s'apercevoir que certains
	sont faits a notre insu.

	Monitor
		Vous pouvez surveiller les échanges avec Wireshark et en utilisant des filtres (fait sous windows)

			* ip.src == valeur ou ip.dest == valeur
			* tcp.port == valeur ou udp.port == valeur
			* on regarde http.request.method == GET (ou POST)
			* :code:`&&` : et logique, :code:`||` : ou logique et :code:`!=` : différent de

		Une fois la liste des requêtes sous la fin, vous avez la barre des filtres pour appliquer les filtres sur le modèle
		précédent. Lorsque vous trouvez une ligne intéressantes, vous pouvez faire clique droit > suivre > flux TCP par exemple
		pour voir de façon claire les informations échangées (remplacez TCP par le protocole a suivre).

		Vous pouvez utiliser Fichier > Export et choisir par exemple http pour récupérer des fichiers téléchargés par exemple.

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=yZTPMoYY2CA

Explorer un ordinateur
	Vous pouvez trouver des vulnérabilités, des services et applications en scannant une machine depuis son IP. Par exemple
	vous pouvez trouver les ports ouverts d'une machine.

	:code:`nmap` est une commande qui vous permet de scanner une machine pour récolter des informations.

		* Vous avez plusieurs types de scans

			* :code:`-sL` : liste toutes les cibles
			* :code:`-sn` : ne pas regarder les ports

		* Vous avez ensuite le protocole

			* scan UDP : :code:`-sU`
			* scan TCP : :code:`-sS` ou :code:`-sT`

		* :code:`-p <port>` : définir un port
		* :code:`-p- <port-port>` : définir un interval de ports
		* :code:`-T<n>` : timing template, n désigne l'agressivité de 0 (discret) à 5 (agressif)

		* vous pouvez lier un script a exécuter

			* :code:`--script=<lua script>` : https://nmap.org/nsedoc/, https://nmap.org/nsedoc/scripts/

		* :code:`-O` : détecter l'OS
		* :code:`-A` : détecter l'OS + version, scan avec script et table de routage
		* :code:`-v` : affiche toutes les informations

	Se protéger ?

		*
			Non testé mais il existe des outils Intrusion Detection (IDS) & Prevention Systems (IPS)
			qui surveillent votre réseau comme `Snort <https://www.snort.org/>`_ et `suricata <https://suricata-ids.org/>`_
			a installer sur un pare-feu (ex: `pfsense <https://www.pfsense.org/>`_). Ils seraient capables de détecter
			des tentatives de scans, de reverse scripting, traffic dangereux etc.

		*
			Je sais que sur OVH, vous pouvez installer un firewall externe pour bloquer les accès a votre VPS qui ne sont
			pas conformes a des règles que vous avez défini (ips, ports, et protocoles).

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=StmtQKoFiWg
