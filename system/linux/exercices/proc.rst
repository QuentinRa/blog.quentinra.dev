==============================================
Processus
==============================================

Niveau débutant
***********************

aucun

Niveau supérieur
***********************

1. Informations sur les Processus
-------------------------------------

1. \
	On écrit hello.sh et bonjour.sh qui ne font qu'afficher "hello" et "bonjour" toutes les
	deux secondes. On lance. On arr^ete par CTRL-C dans le terminal où on a lancé le script.
2. \
	:code:`hello.sh &`

	Peut-on le terminer par CTRL-C dans le terminal où on l'a lancé ?

	Que fait donc l'opérateur de contrôle & et dans quelle situation s'avère-t-il utile ?
3.
	Là où hello.sh tourne, on tape fg qui signifie foreground. On tape CTRL-C dans le
	terminal de contrôle.

	Que fait donc la commande fg ?
4.
	On lance hello.sh. On va dans un autre terminal et on affiche, pour le processus correspondant
	à hello.sh, dans cet ordre : son terminal de contrôle (TTY), son numéro (PID),
	le numéro de son groupe de processus (PGID), le numéro de son parent (PPID), le numéro
	du groupe de processus au premier-plan dans le m^eme terminal de contrôle (TPGID), la
	commande correspondante (CMD). On compare PGID et TPGID.
5. \
	On termine et on relance en arrière-plan. On consulte à nouveau les valeurs précédentes.
	On compare PGID et TPGID. Conclusion : qu'indique TPGID ? On termine le processus qui
	tourne comme on a vu au 3.
6. \
	Un autre signal de contrôle. On lance hello.sh. On tape CTRL-Z dans le terminal de
	contrôle du processus correspondant. On consulte son état par la commande ps. Que fait
	CTRL-Z sur un processus au premier-plan ?
7. On veut quand-m^eme le terminer par CTRL-C. Comment faire ?
8. \
	On lance ./hello.sh | ./bonjour.sh. Combien a-t-on lancé de processus par cette
	ligne de commandes ?

	Peut-on les terminer par CTRL-C ? Comment le déduire de l'affichage rendu par ps ?
9. \
	On lance ./hello.sh & ./bonjour.sh. Par ps, on va voir, dans un autre terminal,
	les informations TTY PID PGID PPID TPGID CMD, pour chacun des deux processus. On
	déduit sur qui CTRL-C aura directement un effet.
10. On fait comme on a vu au 3 pour terminer l'autre aussi par CTRL-C.

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<proc/s1>

| :code:`[TAG] IUTSF ASR TP10 2018 S1`

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)