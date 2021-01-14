==============================================
Motifs et expression régulières
==============================================

Niveau débutant
***********************

1. Mes premiers motifs
-----------------------------

On récupère l'archive :download:`globpattern.tar <../../../assets/system/linux/exercices/globpattern.tar>`.

1. Donnez une commande pour désarchiver.

2. Donnez les patterns qui correspondent

		1. de GLOB/gLob/ qui se terminent par une majuscule.
		2. de GLOB/ qui contiennent au moins une majuscule.
		3. de GLOB/ et de GLOB/gLob/ dont le deuxième caractère est un chiffre.
		4. de GLOB/ qui contiennent au moins un nombre d’au moins 2 chiffres.

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<motifs/d1>

| :code:`[TAG] IUTSF ASR TP4 2018 S1`

2. Motifs pour les noms de fichiers/répertoires
------------------------------------------------

Restriction : une seule ligne de commande, depuis le domicile sans se déplacer.

Donnez une commande pour afficher le contenu de

1. mon domicile dont le nom se termine par ~
2. mon domicile dont le nom se termine par ~ ou commence par # (attention # est un caractère spécial)
3. mon domicile dont l'extension du nom est constitué d'un seul caractère
4. ~/ASR/ dont le troisième caractère du nom est une voyelle
5. ~/ASR/ dont le nom contient une lettre parmi a,b,c,d,i,j,k,l, suivie d'un chiffre parmi 1,2,3,6,7,8,9
6. ~/ASR/ dont le nom ne commence ni ne se termine par un chiffre

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<motifs/d2>

| :code:`[TAG] IUTSF ASR TD3 2018 S1`

3. sed le StreamEditor
-------------------------------

| On récupère le fichier :download:`message.hex <../../../assets/system/linux/exercices/message.hex>`.

À l’aide de la commande sed

1. \
	Sans modifier le fichier, on affiche à l’écran le résultat de la transformation obtenue
	en insérant ZZZZ

		(a) Avant chaque ligne.
		(b) Au début du ficher.
		(c) Avant la dernière ligne.
		(d) Après chaque ligne.
		(e) Après la dernière ligne.

2. \
	On insère une ligne vide après chaque ligne du fichier en enregistrant le résultat dans le
	fichier Message.hex.
3. On insère une ligne vide après la ligne 2.
4. On insère Hello avant la première ligne et Bye après la dernière ligne.
5. \
	Sans modifier Message.hex, on affiche le résultat de la suppression de toutes les lignes
	vides du fichier Message.hex.
6. On remplace toute occurrence d’un caractère d’espacement dans message.hex par ?
7. On remplace toute suite de caractères d’espacement dans message.hex par ?

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<motifs/d3>

| :code:`[TAG] IUTSF ASR TP8 2018 S1`

4. awk
-------------------------------

| On récupère le fichier :download:`message.hex <../../../assets/system/linux/exercices/message.hex>`.

A l’aide de la commande awk :

1. À partir du fichier message.hex, on affiche :

		(a) Le premier champ (mot) de chaque ligne.
		(b) Le troisième champ de chaque ligne.
		(c) Le nombre de champs de chaque ligne.
		(d) Les lignes dont le nombre de champs est plus petit que 2.
		(e) Le quatrième champ de la troisième ligne.

2. On affiche :

		(a) La taille de chaque fichier/répertoire contenu dans le répertoire /etc/
		(b) Les noms des fichiers/répertoires de /etc/ dont la taille est supérieure à 512 octets.

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<motifs/d4>

| :code:`[TAG] IUTSF ASR TP8 2018 S1`

5. Recap des expression régulières
-------------------------------------

1. Quels chaînes de caractères cherche t'on a attraper avec

	* :code:`'^$'`
	* :code:`'^...$'`
	* :code:`'.c$'`
	* :code:`'.[config]$'`
	* :code:`'^..[$'`[:digit:]]'`
	* :code:`'^.\.[[:digit:]]'`
	* :code:`[^[[:upper:]]].$'`

2. Quels chaînes de caractères cherche t'on a attraper avec

	* :code:`'T?ST?AR'`
	* :code:`'(back)?(slash)?'`
	* :code:`'^[[:space:]]*$'`
	* :code:`'^.?..$'`
	* :code:`'^[[:space:]]+$'`
	* :code:`'[$][[:digit:]]?$'`

3. Quels chaînes de caractères cherche t'on a attraper avec

	* :code:`'[.](config|cfg)'`
	* :code:`'[$]([[:digit:]]|$)'`
	* :code:`'(.{3})(.{5})\2\1`
	* :code:`'[$]([[:digit:]]|$)'`

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<motifs/d5>

| :code:`[TAG] IUTSF ASR TD10 2018 S1`

Niveau supérieur
***********************

1. I can do it
---------------------------------

| On récupère l'archive :download:`DIR.tar <../../../assets/system/linux/exercices/DIR.tar>`.
| On récupère l'archive :download:`font1.tar <../../../assets/system/linux/exercices/font1.tar>`.

Seules les commandes grep, egrep, sed, peuvent être utilisées. On n’utilisera au-
cun pipeline.

1. Afficher les lignes du fichier sysctl.conf qui contiennent ipv4 ou ipv6 entre deux symboles "."
2. Afficher les lignes du fichier sysctl.conf qui ne commencent pas par le symbole "#"
3. \
	Afficher les lignes du fichier ca-certificates.conf qui contiennent des noms de certificats avec la chaîne de caractères root entre deux symboles "_". Les lettres dans root
	peuvent être en minuscule ou en majuscule.
4. \
	Afficher les lignes du fichier ca-certificates.conf qui contiennent des noms de certificats
	avec la chaîne de caractères Class entre deux symboles "_", et suivie d’un chiffre.
5. \
	Avec la commande grep, afficher le nom du fichier du répertoire DIR/ o`u se trouve une
	variable d’environnement de nom KEYMAP. On ne veut que le nom du fichier qui contient
	KEYMAP.
6. \
	Avec la commande grep, afficher le nom du fichier du répertoire DIR/ o`u se trouve une
	variable d’environnement de nom LANG. On ne veut que le nom du fichier qui contient
	LANG.
7. \
	Afficher les lignes du fichier Xorg.0.log qui contiennent (au moins) une expression entre
	parenthèses.
8. \
	Le fichier krb5.conf contient des noms de machines d’une certaine forme (par exemple,
	lithium.lcs.mit.edu). Le nombre de fois o`u le symbole . (dot) apparaît dans la com-
	position du nom est quelconque. Afficher les lignes de ce fichier qui contiennent des noms
	de cette forme.
9. \
	Afficher les lignes du fichier syslog qui contiennent (au moins) une chaîne de caractères
	formée de 4 nombres séparés par le symbole . (dot) (comme : 172.16.1.34).
10. \
	Afficher les lignes du fichier sensors.conf qui contiennent des expressions sous forme de
	produits comme 3.3 * 0.95
11. \
	Le fichier de configuration de Name Service Cache s’appelle nscd.conf. Les lignes non
	commentées (dont le premier caractère autre que <space> n’est pas "#") permettent de
	configurer des services. Par exemple, on a :

	enable-cache passwd yes

	Afficher toutes les lignes non commentées de ce fichier, dont la colonne du milieu contient
	soit passwd, soit services.
12. \
	Le fichier de configuration de Name Service Cache s’appelle nscd.conf. Les lignes non
	commentées (dont le premier caractère autre que <space> n’est pas "#") permettent de
	configurer des services. Par exemple, on a :

	shared hosts yes

	Afficher toutes les lignes non commentées de ce fichier, dont la colonne du milieu contient
	soit hosts, soit group.
13. \
	Afficher toutes les lignes du fichier man db.conf qui contiennent deux chemins absolus
	(par exemple : /bin /usr/share/man).
14. \
	Sans utiliser un éditeur de texte interactif, sans modifier le fichier syslog, supprimer
	toute ligne dont le dernier caractère autre que <space> est . (dot), en pla¸cant le résultat
	de la transformation dans le fichier sub-syslog.
15. \
	Sans utiliser un éditeur de texte interactif, sans modifier le fichier auth.log, supprimer
	toute occurrence de la chaîne de caractères RP2-13, et écrire le résultat de la transformation
	correspondante de auth.log dans sub-auth.log.
16. \
	Sans utiliser un éditeur de texte interactif, sans modifier le fichier pacman.conf, commenter
	(ajouter un symbole "#" au début de) toutes les lignes non commentées qui
	commencent par Include = en mettant le résultat dans le fichier pacman-v1.conf.
17. \
	Sans utiliser un éditeur de texte interactif, sans modifier le fichier sysctl.conf, créer un
	fichier sysctl-v1.conf qui contient les mêmes lignes que le fichier sysctl.conf, mais
	dans lequel on supprime le premier symbole "#" de chaque ligne qui contient soit ipv4,
	soit ipv6, entre deux symboles "."
18. \
	Sans utiliser un éditeur de texte interactif, sans modifier le fichier daemon.log, on veut
	remplacer dans chaque ligne de daemon.log qui se termine par eth0.0’, cette dernière
	occurrence de eth0.0 par eth1.0. On veut enregistrer uniquement les lignes ainsi trans-
	formées dans le fichier sub-daemon.log.

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<motifs/s1>

| :code:`[TAG] IUTSF ASR TP12 2018 S1`

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc DARTOIS (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)