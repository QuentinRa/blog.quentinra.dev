.. _r:

================================
Langage R
================================

| :math:`\color{grey}{Version \ 0.0.5}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/01/2021}`

1. Introduction
===================================

Vous pouvez obtenir de l'aide sur une fonction avec :code:`?nom_fonction`
qui sous RStudio/IntelliJ ouvre une page de documentation. Vous
pouvez faire :code:`args(fonction)` pour voir ses arguments.

Les commentaires se font avec :code:`#`. Pas de symbol en fin de ligne.

La commande :code:`ls` liste toutes les variables. Pour nettoyer
toutes vos variables, tapez :code:`rm(list=ls())`.

2. Types et Opérateurs
========================

Le R est faiblement typé, les types sont déduis. On remarque

	* int : entiers
	* float : flottants
	* les booléens : TRUE ou FALSE
	* autre : la valeur NULL, la valeur NA (not available)
	* les strings : "chaine de caractères"
	* les vecteurs, on utilise c(valeur, ...) pour créer un vecteur

Les opérations sont

	* les basiques : :code:`+,-,/,*`
	* :code:`nombre^puissance`
	* l'assignation : :code:`variable <- valeur`
	* autre : :code:`sqrt, abs, log, ...`
	* concatenation (string) : :code:`paste(string, string, ...)`

Vous pouvez faire des opérations sur des vecteurs comme si c'était des nombres
(ex: vecteur * 2 + 100). Les opérations sont fait sur chaque valeur du vecteur.
En cas de calcul avec deux vecteur qui ne sont pas la même taille (ex: taille 2 et
taille 4), alors on re-parcours le plus petit vecteur depuis le début. Attention cependant,
le plus petit doit avoir une taille multiple du plus grand (sinon warning).

.. code:: r

		> (1, 2, 3, 4) + c(0,10)
		[1]  1 12  3 14 # 1 + 0, 2+10, 3 + 0, 4 + 10

Les conditions sont

	* les basiques : :code:`>, >=, <=, <, ==, !=`
	* union/or : :code:`|` (tester plusieurs conditions - ou logique)
	* intersection/and : :code:`&` (tester plusieurs conditions - et logique)
	* négation : :code:`!` (inverse le résultat de la condition)

3. Gérer son environnement
============================

Fonctions de déplacement

	* :code:`getwd()` : retourne le répertoire courant
	* :code:`sedwd(path)` : change le répertoire courant
	* :code:`dir()` ou :code:`list.files()` : liste les fichiers du répertoire

Fonctions de manipulation

	* :code:`file.path(partie, partie, ...)` : crée un path [#2]_
	* :code:`dir.create(path)` : créer un dossier
	* :code:`file.create(path)` : créer un fichier
	* :code:`file.exists(path)` : TRUE si existe sinon FALSE
	* :code:`file.info(path)` : infos sur un fichier
	* :code:`file.copy(path,new_path)` : copie un fichier
	* :code:`file.rename(path,new_path)` : renomme un fichier

.. [#2] :code:`file.path("dossier1", "dossier2", "fichier")`. Le path marche sous tout
	système d'exploitation (donc mettra des / sous Linux et des \\ sous Windows).

4. Fonctions utiles en stats
==============================

Génération

	* :code:`runif(n)` : génère n nombres aléatoires entre 0 et 1

5. Affichage graphique
========================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* "Take only pictures, leave only footprints."
	* Swirl, R programming
	* https://pbil.univ-lyon1.fr/R/pdf/lang01.pdf
	* https://pbil.univ-lyon1.fr/R/pdf/lang02.pdf
	* https://fxjollois.github.io/cours-2016-2017/initiation-a-r-tp1.html
	* https://fxjollois.github.io/cours-2016-2017/index.html
	* https://fr.wikibooks.org/wiki/Programmer_en_R/Les_fonctions_statistiques_de_base
	* https://www.dunod.com/sites/default/files/atoms/files/9782100712861/Feuilletage.pdf