=============================================
4. CyberSécurité - Les problèmes du système
=============================================

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

Transferts de fichiers via FTP
	FTP (File Transfert protocol) est un protocole de transfert de fichiers utilisé pour déposer et télécharger
	des fichiers sur une autre machine (dite serveur). Le protocole FTP utilise le port 21 (connexion, ... ou le port 22 si sftp)
	mais les données transférés passent par le port 20.

	Certains serveurs ont une utilisateur ftp :code:`anonymous` c'est-à-dire qui n'a pas besoin de mot de passe et qui certaines
	fois peut faire des choses sur le serveur qu'il ne devrait pas pouvoir faire. Il est donc recommandé de le désactiver.

	En tant qu'utilisateur anonyme, nous ne sommes pas associé a une session et n'avons donc pas des permissions restreintes,
	si par exemple un script que nous avons déposé est exécuté, alors nous pourrions obtenir une porte dérobée sur le serveur.

	Vous pouvez utilsez :code:`FileZilla` sous windows pour vous connecter en ftp. Sinon en ligne de commande
	:code:`ftp <ip>`.

		* :code:`ls` : liste les fichiers/dossiers d'un répertoire
		* :code:`cd` : se déplacer
		* :code:`put` : déposer un fichier sur le serveur
		* :code:`get` : récupérer un fichier sur le serveur

	Voici une vidéo + exemple : https://www.youtube.com/watch?v=i-jqFYTPEV4

Transferts de fichiers via SMB/NFS
	FTP est un protocole souvent utilisé pour partager des fichiers de façon externe. En interne, les protocoles
	SMB (~windows) ou NFS (~linux) sont majoritairement utilisés.

	Samba est un outil qui relie des infrastructures utilisant l'un des deux protocole et uniformise les échanges. Les échanges
	faits sont encryptés par défaut donc assez sécurisés. Vous pouvez ainsi relier tous les ordinateurs, photocopieuses, imprimantes
	d'une entreprise à un même dossier :code:`share` dont le contenu sera commun à toutes.

	enum (enum4linux)
		Télécharger ici l'alternative de enum.exe `enum4linux.pl <https://github.com/CiscoCXSecurity/enum4linux/blob/master/enum4linux.pl>`_
		sachant que je n'ai pas trouvé comment faire sous windows.

			* utilisation : :code:`./enum4linux.pl <options> <ip>`
			* :code:`-U` : liste des utilisateurs
			* :code:`-M` : liste des machines
			* :code:`-S` : liste des shares
			* :code:`-o` : infos sur le système
			* :code:`-i` : infos sur les imprimantes
			* :code:`-v` : affiche tout ce qui est fait

		Note: vous devez installer :code:`smbclient` pour utiliser enum4linux.

		Pour vous connecter a un dossier partagé : :code:`smbclient //IP/nom_dossier_share`. Vous pouvez tester de ne pas mettre
		de mot de passe. Les commandes sont les mêmes que plus haut en FTP (ls, cd, get, put, pwd, more).

	Voici une vidéo + exemple : https://www.youtube.com/watch?v=HscyCbModk4