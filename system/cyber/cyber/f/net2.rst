=======================================================
4. CyberSécurité - Les problèmes du web et du système
=======================================================

Common Gateway Interface (CGI)
	Certains ordinateurs (ordinateurs intégrés, IOT)
	n'utilisent pas de framework PHP par exemple pour afficher des pages web (trop complexe)
	mais utilisent les scripts CGI.

	Comme pour le PHP, vous allez faire une requête à un site qui vous retourne de l'HTML.
	Lorsque l'ordinateur reçoit votre requête, il la transmet via l'interface CGI à un programme JAVA, Python, ...
	qui est exécuté sur la machine et dont le résultat est reconvertit via l'interface pour donner une page web.

	Les scripts CGI sont souvent dans le dossier :code:`/cgi-bin/`

	Le problème ?
		Si vous parvenez a identifier la machine, alors vous pouvez essayer d'injecter des commandes qui seront
		exécutés par le système.

			* détecter l'OS de la machine : tester une URL qui n'existe pas peut afficher une erreur avec le système de la machine
			* trouver un script : :code:`/cgi-bin/script.sh`, ici c'est un script shell donc on peut tenter d'exécuter des commandes shell (suppose l'OS est une architecture linux)
			* :code:`/cgi-bin/script.sh&commande_linux`
			* :code:`/cgi-bin/script.sh&systeminfo` : révèle des infos sur le système

Metasploit (metasploit-framework)
	| Lien : https://github.com/rapid7/metasploit-framework
	| Debian : https://computingforgeeks.com/install-metasploit-framework-on-debian/
	| Tuto : https://blog.tryhackme.com/metasploit/

	Il s'agit d'un framework pour tester vos architectures.

	| Rechercher un module d'un service/truc (ex: apache, iis, ...) : :code:`msf5 > search <service>`
	| Utiliser le module : :code:`msf5 > use <module>`
	| Définition des options : :code:`msf5 exploit('module') > set <option> <valeur>`
	| Définition du reste des options : :code:`msf5 exploit('module') > options`
	| Voir les options : :code:`msf5 exploit('module') > show options`
	| Exécuter : :code:`msf5 exploit() > run`

	Avec option, quelques choses du genre

		* set LHOST <valeur> : la machine qui attaque donc vous
		* set RHOST(s) <valeur> : les machines attaquées
		* set RPORT <valeur> : port de la machine attaquée
		* set TARGETURI <valeur> : location du script
		* set use <module> : faire que ce module utilise un autre module
		* set PAYLOAD <valeur> : faire que ce module utilise un autre module
		* ...

	| Après le run d'une ShellShock attack (CVE 2014-6271), lancer un shell sur la machine : :code:`meterpreter > shell`


