===================================
Comprendre la notion de chemin
===================================

Linux et Windows ont une hiérarchie des fichiers assez similaire :

============== ===============   ========  ====================================================================
Windows        Linux             Nom       Sémantique (sens)
============== ===============   ========  ====================================================================
C:\\           /                 Racine    Le point de départ de l'arborescence des fichiers

C:\\users\user /usr/user/home/   Domicile  Le dossier utilisateur de :code:`user`, il contient vos Documents,
               ou ~ (tilde)                votre bureau etc... :code:`~` est un raccourci pour
                                           :code:`/usr/user/home/`

\              .                 Dossier   Il s'agit du dossier dans lequel vous vous trouvez
                                 Courant

\              \.\.              Dossier   Il s'agit du dossier contenant votre dossier actuel. La racine
                                 Parent    est son propre parent.
============== ===============   ========  ====================================================================

Vous entendrez pour dossier les mots : répertoire, catalogue, qui sont des synonymes.

Vous entendrez pour fichier le mot : fichier régulier, qui veut juste dire fichier normal (donc pas un lien,
ou les fichiers spéciaux (terminaux etc.)).

Chemin
	Il s'agit d'un chemin partant tel que :code:`/usr/user/home/`.

	Le chemin suivant, se lit comme suit
		* partant de la racine (:code:`/`)
		* on a un dossier :code:`usr`
		* dans ce dossier :code:`usr`, on a un dossier :code:`user`
		* dans ce dossier :code:`user`, on a un dossier :code:`home`

	Il existe deux types de chemins :

		* les chemins dit absolus : ils commencent par :code:`/` donc par la racine.
		*
			les chemins relatif : :code:`~/Bureau` est l'équivalent du chemin absolu
			:code:`/usr/user/home/Bureau`. Un autre exemple serait un fichier dans votre
			dossier courant: :code:`./.bashrc`

	Un fichier qui commence par un . est un fichier caché.

Notes
	* Si vous mettez /.../ avec un nombre pair de slashes, alors les slashes sont fusionnés.

.. hint::

		Fun Fact -- "Tout est fichier sous Linux"

		Les utilisateurs de Linux ont tendance à dire que tout est fichier sous linux,
		c'est-à-dire que

					* un disque dur (dossier /mtn/) ;
					* un terminal (dossier /dev/...) ;
					* un connexion réseau ;
					* un processus (dossier /bin/...) ;
					* ...

		sont des fichiers.