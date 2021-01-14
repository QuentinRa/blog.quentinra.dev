===================================
Processus, premier et arrière plan
===================================

Déjà l'utilité : vous pouvez voir les processus
qui tournent dans un terminal donc les tuer si vous avez un problème. Vous pouvez
également utiliser les commandes premier/arrière plan pour lancer des programmes
qui tournent en arrière plan et que vous puissiez toujours continuer à utiliser
la console (ex: lancer un IDE, etc.).

Changer le plan

	* :code:`commande &` : exécute cette commande en arrière plan
	* :code:`fg` : passe un processus à l'arrière plan, %numero permet de choisir lequel
	* :code:`bg` : passe un processus au 1er plan, %numero permet de choisir lequel

Lorsque vous utilisez :code:`fg` par exemple, cela vous affiche :code:`[1] ...`
par exemple et 1 ici est le numéro donc vous pouvez faire :code:`bg %1`.

:code:`top` : affiche tous les processus/services qui tournent (=gestionnaire des tâches de windows)

:code:`ps` : affiche des informations sur des processus
	En particulier, vous pouvez tapez ps dans un terminal pour voir les processus qui y tournent. Un autre
	utilité est de voir tous les processus d'un certain type qui tournent sur votre machine.

	| :code:`-e` : tous les processus
	| :code:`-C <commande>` : processus associés à commande (tous les processus bash par ex)
	| :code:`-p <pid>` : processus depuis pid (séparés par une virgule si plusieurs)
	| :code:`-s <sid>` : processus depuis sid
	| :code:`-u <data>` : processus depuis données
	| :code:`-t <path>` : processus depuis chemin terminal (:code:`/dev/pts/3` par exemple pour tty3).
	| :code:`-j` : un affichage pré-customisé "job format"
	| :code:`-l` : un affichage pré-customisé "long format"
	| :code:`-f` : un affichage pré-customisé "full format"
	| :code:`-o <format>` : affichage personnalisé séparé par une virgule, les termes suivants sont possibles [#2]_

	.. [#2] pid (n° processus),ppid (n° processus père), pgid (n° groupe), tpgid (id processus 1er plan), sid (n°session), comm...
