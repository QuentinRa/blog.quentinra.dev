=======================================================
4. CyberSécurité - Les problèmes du système
=======================================================

PowerShell
	C'est une surcouche au langage run de .Net (Common Language Runtime (CLR)). Une commande powershell est
	appelée un cmdlets.

		* :code:`Get-ChildItem` (ls) : liste le contenu d'un répertoire

			* :code:`-Path` : spécifier les répertoires à afficher
			* :code:`-File / -Directory` : que des fichiers/dossiers
			* :code:`-Hidden` : affiche les fichiers cachés
			* :code:`-Filter` : filtre sur le nom

		* :code:`Get-Content` (cat) : voir le contenu d'un fichier
		* :code:`Measure-Object` (wc) : retourne le nombre de ... (-Word : mots, ...)
		* :code:`Set-Location` (cd) : se déplacer dans un dossier
		* :code:`Select-String` (grep) : trouver un motif dans un fichier

			* :code:`-Pattern 'pattern'` : définir le pattern de recherche

		* :code:`Get-FileHash` : retourne le hash d'un fichier

			* :code:`-Algorithm` : algorithme de hash (MD5 par exemple)

		* :code:`Get-Help` (man) : affiche de l'aide sur une commande
		* :code:`c:\Tools\strings64.exe -accepteula fichier` : affiche tous les mots clefs cachés

	Vous pouvez utiliser toutes ces commandes pour vous déplacer etc. sur une machine ayant un powershell,
	ou par exemple vérifier qu'un fichier .exe a bien le bon hash.

Alternate Data Streams (ADS)
	Dans les fichiers NTFS, généralement un flux :$DATA est le flux par défaut, mais il peut y avoir d'autres flux
	cachés dans un exécutable.

		* :code:`Get-Item -Path fichier.exe -Stream *` : voir tous les flux
		* :code:`wmic process call create $(Resolve-Path .\fichier.exe:flux)` : lancer l'exécutable via un flux

	J'ai pas trop compris mais en gros on peut lancer un fichier caché dans un autre.

