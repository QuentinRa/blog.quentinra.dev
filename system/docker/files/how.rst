=============
Principe
=============

Docker = Conteneur permet d'empaqueter une application sous la forme d'une "image" [#0]_.

C'est cette image qui sera transmise (=mise en production/partagée), et son exécution
lancera le logiciel.

**Dockerfile**

Vous allez écrire un fichier **Dockerfile**, qui une fois compilé vous donnera une :code:`image`.
Puis sur n'importe quelle machine, vous pouvez lancer votre application avec
:code:`docker run [nom_image]`.

Un fichier Dockerfile doit obligatoirement s'appeler Dockerfile (sans extension).
Les instructions de votre Dockerfile seront exécutés via la commande docker.

**Isolation**

Une machine virtuelle consiste à recréer entièrement une machine (OS=Système d'exploitation, système de fichiers...)
ce qui peu être trop si tout ce qu'on veut tester/déployer c'est une application.

Un Docker est moins isolé car il va utiliser le système de fichiers, la RAM, le CPU du système actuel.
Les échanges entre ce qu'il y a dans le conteneur et le système actuels passent par une API.

.. [#0]
		Une image est un fichier dont la structure est sous la forme de couches dans lequel les fichiers sont empilés
		les uns au dessus des autres.

		Un image fonctionne toujours comme si c'était la première fois que vous la lanciez (pas de mémoire)
