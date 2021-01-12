=================================================
2. Partiel 2021 Système d'exploitation
=================================================

Exercice 1 (Commandes shell, 5 points)
================================================

1. Donner une commande shell qui imprime le contenu du répertoire de
login de l’utilisateur user quel que soit le répertoire coutant.

2. Donner une commande shell différentes qui impriment le nom du répertoire
de login de l’utilisateur user quel que soit le répertoire courant

3. Donner une commande shell qui affiche les noms de tous les fichiers
de suffixe .h du répertoire /tmp.

4. Donner une commande shell qui affiche le nombre de fichiers contenant
la chaîne de caractères \"Bob\" du répertoire \"/tmp\"

5. On rappelle que la variable d’environnement PATH donne les noms des
répertoires dans lesquels le système va chercher les commandes séparés
par des : (deux points). Donner une commande shell qui affiche les
premier et troisième répertoire.

Exercice 2 (sed 2 points)
=============================

On considère le script sed suivant

:code:`sed -e ’s/\([a-z]+\)\([0-9]+].*/\2\1/’`

quel est son comportement sur les entrées

— abc123
— 123abc
— abc123def
— 123abc123

Exercice 3 (Script shell 3 points)
====================================

Écrire un script bash qui prend trois arguments "s", "n" et "f" et qui affiche
1 fois la chaîne de caractères s puis deux fois puis i avec un espace les séparant
dans le fichier f du répertoire "/tmp" et ainsi de suite jusque n. Si le fichier
f n’existe pas ou si il existe déjà ou si on a pas pu le créer on affichera un
message d’erreur pertinent.

Exercice 4 (fork 5 points)
============================

Écrire un programme C qui crée deux fils. Le père affiché "fait", le premier
fils affiche "il" et le deuxième affiche "ilbeau". Le comportement du du
programme est d’afficher "il fait beau" sur le sortie standard. Le père
attendra la fin de ses fils pour se terminer.

Exercice 5 (Généralités 5 points)
=======================================

.. image:: /assets/system/linux/annales/exo5.png

1. Décrire précisément son comportement

2. Expliquer comment le modifier pour créer 3 fils qui impriment respectivement
les entiers congrus à 0, 1 et 2 modulo 3


