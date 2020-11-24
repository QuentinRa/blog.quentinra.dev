================================
Flux de texte
================================

Niveau débutant
***********************

1. Numérotation
---------------------

Écrivez un programme qui lit un fichier contenant uniquement du texte dont le nom et le chemin seront donnés en argument
sur la ligne de commande puis affiche le contenu du fichier sur sa sortie standard en numérotant chaque ligne.

Pour les esthètes, faites en sorte d'afficher les numéros dans une couleur différente (en utilisant un code d'échappement).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_t/d1>

| :code:`[TAG] IUTSF APL S1 TP20 2019`

2. Tableur
---------------------

Un fichier au format CSV sert à décrire un tableau de valeurs à deux dimensions. Les valeurs sont séparées
par des virgules (ou parfois des points-virgule en configuration française) et forment ainsi des lignes. Les lignes sont bien sûr
séparées par des sauts de ligne.

Reprenez le programme du premier exercice sur les tableaux multidimensionnels et sauvegardez les tableaux dans des
fichiers nommés t1.csv, t2.csv, et t3.csv. Si vous respectez bien le format, vous devriez pouvoir ouvrir ces fichiers
à l'aide d'un tableur.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_t/d2>

| :code:`[TAG] IUTSF APL S1 TP20 2019`

3. Dénomination
---------------------

Le fichier :download:`rgb.txt <../../../../assets/imperative/c/exercice/files/rgb.txt>` est parfois utilisé pour représenter
les correspondances entre les noms des couleurs et leurs composantes RVB.

Écrivez un programme qui prend sur la ligne de commande trois composantes et qui affiche
tous les noms qui correspondent.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_t/d3>

| :code:`[TAG] IUTSF APL S1 TP20 2019`

4. Décomposition
---------------------

Sur le même principe que l'exercice précédent, écrivez un programme qui prend un nom de couleur sur la ligne de
commande et qui affiche les composantes correspondantes (si elles sont dans le fichier).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_t/d4>

| :code:`[TAG] IUTSF APL S1 TP20 2019`

5. Censure
----------------------

Écrivez un programme qui prend sur sa ligne de commande le nom et le chemin d'un fichier contenant uniquement
du texte et qui remplace dans ce fichier tous les «e» par des «X». Le programme ne devra pas retenir en mémoire plus
d'un caractère du fichier à la fois.

Que se passe-t-il si on modife le programme pour remplacer chaque «e» par «XXX» ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_t/d5>

| :code:`[TAG] IUTSF APL S1 TP20 2019`

Niveau supérieur
***********************

1. Gomoku
---------------------

Écrivez un programme permettant à deux joueurs de s'affronter au Gomoku. Le programme devra demander à un joueur où
il souhaite placer sa pierre, puis il affichera le tablier mis à jour. Il passera ensuite à l'autre joueur, et ainsi de suite
jusqu'à ce que le tablier soit rempli (ce qui donne un match nul).

Pour simplifier l'exercice, on ne contrôlera pas la légalité des coups et on ne testera pas les conditions de victoire.
Par contre, les joueurs auront l'option d'interrompre la partie et de la sauvegarder pour plus tard. Le fichier de sauvegarde
devra utiliser un format texte permettant de facilement visualiser l'état de la partie.

2. Archive
--------------

La commande tar est employée pour regrouper plusieurs fichiers en un seul (sans compression). Le format employé est décrit ici.

Écrivez un programme qui prend sur sa ligne de commande le nom et le chemin d'une archive .tar et qui en
affiche le contenu (comme la commande tar avec l'option t).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<flux_t/s2>

| :code:`[TAG] IUTSF APL S1 TP21 2019`

3. Désarchivage
----------------

Écrivez un programme qui prend sur sa ligne de commande le nom et le chemin d'une archive .tar et qui la désarchive
(comme la commande tar avec l'option x). On se limitera à des archives ne contenant que des fichiers réguliers sans indication
de chemin, et on ne reconstituera pas les propriétés d'origine.

4. Matrices
--------------

On souhaite multiplier des matrices à coefficients entiers, chacune étant stockée dans un fichier contenant :

	* Deux entiers représentant le nombre de lignes et le nombre de colonnes de la matrice.
	* Les coefficients de la matrice (dans l'ordre de parcours ligne par ligne).

Écrire le programme qui va avec le menu suivant :

	*	1) Saisir une matrice dans un fichier.
	*	2) Afficher une matrice depuis un fichier.
	*	3) Multiplier deux matrices dans un fichier.

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)