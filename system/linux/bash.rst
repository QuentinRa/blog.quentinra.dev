.. _bash:

================================
Bash et Scripts bash
================================

| :math:`\color{grey}{Version \ 2.4.15}`
| :math:`\color{grey}{Dernière \ édition \ le \ 13/01/2021}`

:code:`prérequis` (cours :ref:`linux`) avoir une idée des thèmes suivants

	* bases de linux (introduction)
	* permissions
	* notion de chemins
	* notion de glob pattern/regex
	* scripts
	* processus

1. Introduction
========================

Le bash est le langage le plus répandu sur les machines UNIX.

Sortit en 1988, il contient de nombreuses améliorations par rapport au Bourne Shell
de 1977.

Quelques points à noter sont :
	* :code:`.bashrc` pour configurer vos terminaux bash
	* les scripts :code:`.sh` (shell) sont généralement écrits en bash
	* certaines fonctionnalités du bash : [[]] (()) ... ne sont pas portables (norme POSIX) bien que très utilisés

Généralement un terminal bash possède une ligne qui démarre
comme :code:`nom_utilisateur@machine:position_actuelle$`
donc par exemple :code:`calistro@MSI:~$`.

.. toctree::
	 :maxdepth: 1

		 .bashrc              <files/bash/bashrc>

2. Commandes
===========================

Si vous ne savez pas comment marche une commande, utilisez le man ! Je ne mettrais pas toutes les options
de chaque commande.

.. hint::

	si je met <commande>, ça veut dire que vous devez remplacer <commande> par une commande
	donc :code:`ls <chemin>` donnerait :code:`ls ~` par exemple. Si je met :code:`{chemin}`, cela veut dire
	que l'argument est facultatif. Si je met un \* ou un +, la logique est la même que pour les regex (donc 0 ou plus,
	1 ou plus).

.. toctree::
	 :maxdepth: 1

			Utilitaire de survie I : man, ls, cd, cat, echo, pwd        <files/bash/comm1>
			Utilitaire de survie II : mkdir, touch, mv, cp, rm          <files/bash/comm2>
			Utilitaire de survie III : éditeur de texte                 <files/bash/idt>
			Permissions : chmod et umask                                <files/bash/perms>
			Recherche : find, whereis, locate, which                    <files/bash/find>
			Motifs : grep, sed, awk                                     <files/bash/motifs>
			Utilisateurs : adduser, deluser, id, su, ...                <files/bash/users>

Alternativement, voici des commandes que vous pouvez utiliser
de temps en temps

.. toctree::
	 :maxdepth: 1

			Traitement de texte : wc, nl, tail, tr, sort, expr   <files/bash/comm4>
			Utilitaire de survie spécial : tar, wget, ssh        <files/bash/comm5>
			Connaitre son environnement : id, uname, stat, file  <files/bash/comm6>

3. Bric à brac
==================================

.. toctree::
	 :maxdepth: 1

		 Les opérateurs : &&, ||, ;, `` et les calculs   <files/bric/op>
		 Variables d'environnement                       <files/bric/var>
		 Conversion et bases : #, hexdump, ...           <files/bric/convert>
		 Redirections et pipe : |, >, <, >> et <<        <files/bric/redirect>

4. Scripts
================================

Les scripts bash regroupent tout ce que vous pouvez faire en bash, donc
ce qui sera présenté juste après peut aussi être fait en dehors d'un script.

En particulier, si une partie de votre script ne marche pas, ou vous voulez vérifier alors
tapez la dans un terminal puis regarder le code de retour.

.. toctree::
	 :maxdepth: 1

		 Structure basique et déclarations   <files/scripts/base>
		 Branchements                        <files/scripts/if>
		 Boucles et lecture à la console     <files/scripts/boucles>
		 Arguments                           <files/scripts/args>
		 Fonctions (builtin)                 <files/scripts/functions>

5. Exercices
===========================

.. toctree::
	 :maxdepth: 1

		Introduction et utilisation générale    <exercices/begin>
		Utilisateurs et Permissions        			<exercices/perms>
		Motifs et expression régulières 			  <exercices/motifs>
		Processus          			                <exercices/proc>
		Recherche          			                <exercices/find>
		Scripts			                            <exercices/scripts>
		Appels systèmes                         <exercices/sys>
		Bases  (2, 8, 16, ...)                  <exercices/bases>
		Commandes complexes (expr, sort, ...) 	<exercices/more>
		Annales                                 <annales/index>

--------

**Crédits**
	* enseignants à l'IUT de Sénart-Fontainebleau
		* Denis Monnerat
		* Luc Hernandez
		* Selma Naboulsi
		* Denis Monnerat
		* Frédéric Gervais
		* Pierre Petrik
		* Luc Dartois
		* Pierre Valarcher
	* enseignants à l'ENSIIE
			* Renaud RIOBOO
			* Christophe MOUILLERON
			* Julien FOREST
			* Ivan Augé
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* bash
		* https://iq.opengenus.org/bash-bourne-again-shell/
		* https://en.wikipedia.org/wiki/Bash_(Unix_shell)
	* commandes
		* https://www.tutorialspoint.com/unix_commands/export.htm
	* scripts
		* https://www.diskinternals.com/linux-reader/bash-script/
		* https://medium.com/sysf/bash-scripting-everything-you-need-to-know-about-bash-shell-programming-cd08595f2fba