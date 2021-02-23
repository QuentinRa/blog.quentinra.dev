========================
Remote Working
========================

Tout d'abord vous devez changer de compilateur
et définir un compilateur remote.

Voici le tutoriel officiel : https://www.jetbrains.com/help/clion/remote-projects-support.html,
dont seulement les étapes 1 à 4 sont requises pour la suite.

		* on suppose que vous avez mis par défaut le compilateur remote
		* que vous l'avez créé

**Ouvrir un ssh localement**

Pour ouvrir un terminal ssh dans CLion, j'utilise les outils remote

	* Aller dans Settings > Tools > Remote SSH External tools
	* cliquer sur +
	* name : ssh, description : connexion ssh
	* program : /bin/bash
	* ok

Ensuite dans la barre de menu, onglet tools, ligne remote tools
vous avez votre "ssh" (ou le nom que vous lui avez donné) et en cliquant
un terminal ssh est ouvert.

Vous pouvez aussi faire shift+shift puis taper le nom de l'outil.

**Parcours de fichiers remote**

Dans la colonne de droite vous avez un onglet RemoteHost pour parcourir les
fichiers du pc distant.

Si par malheur vous l'avez fermé, alors shift+shift puis tapez "Browse Remote Host"
et vous l'aurez de nouveau.