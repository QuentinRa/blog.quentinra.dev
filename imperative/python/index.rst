.. _etiquette:

================================
Python
================================

| :math:`\color{grey}{Version \ 1.1.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 19/12/2020}`

1. Présentation de python
===================================

Python est un langage de haut niveau associé aux fichiers :code:`.py`. Python ne créé pas d'exécutables,
il s'agit d'un langage de scripts/interprété.

Vous pouvez écrire du code dans un .py et l'exécuter avec
:code:`python chemin/vers/fichier.py`
ou alors tapper :code:`python` puis directement tapper des commandes sans créer de fichier.

Un script python est appelé un module.
Un module correspond généralement à 1 idée (1 concept, 1 logique).
Un ensemble de modules est regroupé dans ce qu'on appelle un **package**.

Vous pouvez installer/chercher des librairies sur https://pypi.org/. La commande pip
permet d'installer une librairie et de pouvoir l'utiliser dans ses scripts (:code:`pip install <lib>`).

Notez que certains projets python sont accompagnés d'un fichier :code:`requirements.txt` qui contient
les librairies et leur version utilisées dans le projet (1 par ligne de la forme nom==version).

2. Particularités de python
====================================

.. toctree::
		:maxdepth: 1

		 Variables, Blocs, ...          <elements/base>
		 Opérateurs arithmétiques       <elements/op>
		 Opérateurs de conditions       <elements/cond>
		 Astuces                        <elements/tips>

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune