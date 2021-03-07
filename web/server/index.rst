.. _apache:

================================
Serveur apache (Linux/Windows)
================================

| :math:`\color{grey}{Version \ 0.2.6}`
| :math:`\color{grey}{Dernière \ édition \ le \ 16/02/2021}`

Attention, je suis en train d'apprendre donc je mets des notes en
vracs pour les parties 3 ou plus, car la version propre et correcte
ne sera faite que dans très très longtemps.

1. Introduction
===================================

Un serveur apache vous permet d'héberger un site web, en particulier vous
pourrez exécuter du php ou un framework côté serveur (node.js, ...).

Vous pouvez utilisez des logiciels qui font tout pour vous comme WampServer (Windows), XamppServer (Linux) ou
MampServer (MacOs).

Si vous souhaitez le faire manuellement (ce qui est très instructif), alors vous pouvez passer
directement à la partie 3.

2. WampServer
===================================

Allez sur le site https://www.wampserver.com/ et télécharger une version (vous serez redirigé
vers sourceforge par exemple https://sourceforge.net/projects/wampserver/files/WampServer%203/WampServer%203.0.0/).

Ensuite lancer l'installation, vous pouvez ou non faire suivant partout. Il vous demandera
probablement de choisir un navigateur, si vous ne trouver pas le chemin alors

	* tapez le nom de votre navigateur de la barre de recherche en bas à gauche
	* faites un clic droit dessus et ouvrir l'emplacement du fichier
	* vous tombez sur un raccourcis, faites encore ouvrir l'emplacement du fichier
	* vous avez trouvé le chemin de votre navigateur

Une fois l'installation terminé, il faut savoir que vous devrez lancer le logiciel à chaque
redémarrage (il sera dans le barre des icônes avec le son, la batterie, votre connexion internet, ...)
sauf si vous l'avez configuré pour qu'il se lance tout le temps.

Une fois le serveur lancé, l'URL http://localhost correspond à la racine de votre serveur
et les fichiers se trouvent réellement à l'emplacement

	* Windows : :code:`C:\wamp64\www\index.php`
	* Linux : :code:`/var/www/html/`

Les scripts PHP utilisent souvent une base de données. Ici vous
pouvez y accéder avec http://localhost/phpmyadmin/, root sans mot de passe.

Notez que pour éviter des bugs, vous devriez explicitement choisir votre base de données
(mysql, mariadb) ce qui se fait avec clic droit sur wamp > paramètre wamp et ne laissez
que mariadb (ou mysql) pour éviter des problèmes plus tard.

Vous pouvez changer la lange avec clic droit sur wamp > langue.

Enfin, vous pouvez changer la version PHP avec clic gauche sur wamp > php > version.

Si vous êtes du genre à vous faire du mal, vous pouvez aussi essayer d'installer postgre
(https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). Il faudra faire attention
car les versions 12+ inclue demandent php 7.4.0 ou plus. Tapez dans la barre de recherche
:code:`pgadmin` pour lancer "phpmyadmin". Attention ! Vous devez d'abord peut être lancer le serveur
avec :code:`psql -U user` dans un powershell.

3. Virtual private server (VPS)
====================================

Je fais de la pub, mais vous pouvez acheter un petit serveur
chez OVH : https://www.ovhcloud.com/fr/vps/. La suite de ce tutoriel est basé
sur un VPS sous debian que j'ai acheté pour environ 110€ pour 2ans.

Pour la configuration (premiers pas)

	* installer putty (optionnel mais c'est plus sympa)
	* il est important de changer le port ssh (mettre autre chose que 22)
	* il est important de créer un nouveau utilisateur et lui donner les droits root

Ensuite j'ai suivit ces magnifiques tutoriels très clairs

	* `Initial Server Setup with Debian 10 <https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-10>`_
	* `Installer PHP, Apache, mariadb, ... <https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mariadb-php-lamp-stack-on-debian-10>`

Personnellement, pour lier mon vps avec un nom de domaine, j'ai fait

	* dans ovh, aller sur la page du nom de domaine
	* aller dans DNS
	* créer une redirection, mettre votre nom de domaine vers l'adresse ip de votre machine
	* attendre environ 12 heures pour que ce soit ok partout
	* sinon quelques minutes peuvent suffire

4. Introduction au serveur apache
====================================

....

5. Serveur apache avancé
===========================

**SSL**

Pour avoir un site web en https sur votre vps, vous pouvez
let's encrypt qui génère un certificat gratuitement
(voir `let's encrypt debian <https://linuxize.com/post/secure-apache-with-let-s-encrypt-on-debian-10/>`
ou d'autres liens dans les références).

Vous devrez le renouvellement après 3 mois, sauf si vous activer le renouvellement
automatique. Pour avoir renouvelé manuellement, c'est vraiment très rapide.

**Logs**

Vous pouvez trouver les logs du serveur dans
:code:`/var/log/apache2`. Vous
pouvez suivre le lien suivant pour configurer vos
dossiers/forme de vos logs `apache-log-files <https://linuxize.com/post/apache-log-files/>`_.

**Mails**

Pour envoyer des mails, j'ai suivit ce tutoriel

	* `Postfix <https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-debian-10>`_
	* ...

Notez qu'il y a plein de trucs à faire pour ne pas finir
dans les spams, le conseil numéro 1 que j'ai a donné est que les modifications
ne sont pas immédiates donc attendez environ 12h avant de faire un test.

	* vous pouvez faire des tests avec : `mail-tester.com <https://www.mail-tester.com/>`_
	* si besoin, j'aime bien ce site : https://emailconfiguration.com/ovh-net

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* configuration apache

		* http://www.iut-fbleau.fr/sitebp/web/wim11/apache/apache.pdf
		* https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-10
		* https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mariadb-php-lamp-stack-on-debian-10
		* https://linuxize.com/post/apache-log-files/

	* mon vps

		* https://www.ovhcloud.com/fr/vps/
		* https://linuxize.com/post/secure-apache-with-let-s-encrypt-on-debian-10/
		* https://geekflare.com/free-ssl-certificate-apache-letsencrypt/
		* https://community.ovh.com/en/t/how-to-link-a-domain-name-with-a-vps/280
		* https://www.techrepublic.com/blog/smb-technologist/secure-your-apache-server-from-ddos-slowloris-and-dns-injection-attacks/

	* liens utiles

		* Script infini : https://www.peterbe.com/plog/run-forever.sh
		* cache : http://www.webdeveloperjuice.com/2010/01/25/10-baby-steps-to-install-memcached-server-and-access-it-with-php/

	* mails

		* https://www.alsacreations.com/tuto/lire/614-Serveur-mail-Postfix.html