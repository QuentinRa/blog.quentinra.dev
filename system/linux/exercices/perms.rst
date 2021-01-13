==============================================
Utilisateurs et Permissions
==============================================

Niveau débutant
***********************

aucun

Niveau supérieur
***********************

1. Création d'utilisateur et permissions
----------------------------------------------

*se connecter en tant que root*.

1. A quoi servent /etc/group et /etc/gshadow. Vous devrez vérifier leur contenu lorsqu'ils ont changé.

2. On crée deux groupes d’utilisateurs grp1 et grp2.

3.
	Créer les utilisateurs east, west ayant comme groupe primaire grp1 ainsi que north et south ayant comme groupe primaire grp2.
	La commande devra créer leur domicile qui est : :code:`/home/`.

4. Définir un mot de passe pour chaque utilisateur.

*se connecter en tant que east*.

5. Donnez une commande pour voir les infos de l'utilisateur actuel

6. sans bouger de ~, on créé ~/fi-east, ~/dir-east/sub-dir-east/ et le fichier fifi-east dans ~/dir-east/sub-dir-east/.

7. Donnez les permissions des fichiers et dossier créés.

8. Testez quelques permissions avec les 3 autres utilisateurs.

9. Utilisez la commande umask, expliquer là et son résultat.

10.
		east veut que, dans tout ce qu’il crée dorénavant, (1) que tout le monde puisse traverser
		tous ses répertoires, (2) que east seulement puisse modifier ses fichiers/répertoires, et
		que (3) seulement east et les membres de son groupe puissent savoir ce qu’il y a dans
		ses répertoires/fichiers.
		On passe la ligne de commande qui réalise cela.

11. Testez si la modification est permanente sinon rendez la permanente.

12. Les anciens répertoires ne respectent pas la condition. Mettez à jour leurs permissions.

*se connecter en tant que root*

13. Quelques petits problèmes

		1. Un e-mail envoyé par east dit qu’il a oublié son mot de passe et east n’est pas présent sur le site.
		2. south veut que son shell de login soit sh.
		3. Même question pour north qui veut que son shell de login soit tcsh.
		4. Changer le groupe primaire de west sans supprimer l’utilisateur.

Commandes utiles : groupadd, useradd, passwd, whoami, id, su, exit, pwd, umask

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<perms/d1>

| :code:`[TAG] IUTSF ASR TP2 2018 S1`

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)