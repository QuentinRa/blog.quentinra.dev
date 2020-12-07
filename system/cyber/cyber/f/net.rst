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