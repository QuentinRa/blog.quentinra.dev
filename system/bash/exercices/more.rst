==============================================
Commandes complexes (expr, sort, ...)
==============================================

1. Commande expr
-----------------------------

1. Expliquer le résultat et la commande :code:`expr length stock_market`.

2. Pareil avec :code:`expr substr stock_market 1 5`.

3. Pareil avec :code:`expr substr stock_market 7 12`.

4. Pareil avec :code:`expr index stock_market "_"`.

5. Pareil avec :code:`expr index stock_market "_c"`.

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<more/d1>

| :code:`[TAG] IUTSF ASR TP6 2018 S1`

2. Commande sort
--------------------

| On récupère le fichier :download:`ls-output.txt <../../../assets/system/linux/exercices/ls-output.txt>`.
| On récupère le fichier :download:`find-output.txt <../../../assets/system/linux/exercices/find-output.txt>`.

1. \
	Un quidam nous a envoyé le fichier ls-output.txt à trier :

		(1) par ordre croissant sur la taille des éléments, puis
		(2) par ordre décroissant sur la taille des éléments.

	Pour chacun des deux cas, on écrit une solution avec une seule ligne de commande.

	Remarque : le fichier ls-output.txt est le résultat d’une commande ls -l. Or, on
	remarque que cette option affiche au début une ligne qui renseigne sur un certain total.
	On peut s’en débarrasser, en combinant la solution avec l’utilisation de la commande
	tail. Ce qui donne une solution avec pipeline. On consultera la page manuel de tail
	pour trouver l’option qu’il faut.

	On refait les questions précédentes de manière à pouvoir envoyer les résultats des tris à
	l’expéditeur de ls-output.txt

2. \
	Le no-longer-quidam récidive avec le fichier find-output.txt qu’il veut qu’on trie par
	ordre sur la date de dernière modification

		(1) de la plus récente à la moins récente, puis
		(2) de la plus ancienne à la moins ancienne.

	Pour chacun des deux cas, on écrit une solution avec une seule ligne de commande.

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<more/d2>

| :code:`[TAG] IUTSF ASR TP6 2018 S1`

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)