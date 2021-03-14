.. _matrix:

================================
Matrice
================================

| :math:`\color{grey}{Version \ 2.0.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 12/11/2020}`

1. Introduction
=====================

On note :math:`M_{n,p}` une matrice de n lignes et p colonnes. Il s'agit d'un tableau à deux dimensions dans lequel
on identifie une case par des coefficients i (ligne) et j (colonne) qui commencent à 1.

.. math::

	M=\ \begin{pmatrix}
	\ a_{1,1} & \cdots & a_{1, p-1} \\
	\vdots  & \cdots & \vdots  \\
	\ a_{n-1,1} & \cdots & a_{n-1, p-1}
	 \end{pmatrix}

Les matrices :math:`M_{n,p}` sont parfois notées :math:`M_{np}` lorsqu'il est évident
qui est n et qui est p.

.. toctree::
    :maxdepth: 1

    Matrice d'un système linéaire		      	<files/sl>
    Matrices remarquables		      					<files/mp>

3. Opérations sur les matrices
===============================

.. toctree::
    :maxdepth: 1

    Addition avec une matrice      	<files/op/add>
    Multiplication par un réel		  <files/op/mr>
    Multiplication par une matrice	<files/op/mm>

.. _gauss:

4. Pivot de gauss
=========================

.. toctree::
	 :maxdepth: 1

			Résoudre un système avec Gauss  <files/gauss/index>
			Exemple d'utilisation de Gauss  <files/gauss/ex>

.. _matrix_inverse:

5. Matrice Inverse
=====================

.. toctree::
	 :maxdepth: 1

			Déterminant      <files/gl/deter>
			Matrice inverse  <files/gl/inv>

6. Réduction d'endomorphisme :code:`avancé`
===============================================

L'objectif est calculer :math:`A^n` ou :math:`exp(A)`. On va réduire la matrice à une matrice diagonale.

.. toctree::
	 :maxdepth: 1

			Objectifs     <files/re/obj>
			Définitions   <files/re/def>
			Calcul        <files/re/calc>

7. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

    Calculs	de matrices		      					<exercices/calculs>
    Déterminant et Matrices inverses      <exercices/determinant>
    Résolution (GAUSS)		      					<exercices/gauss>
    Réduction d'endomorphisme   					<exercices/reductions>
    Non triés					   									<exercices/non_rank>
		Astuces de calcul   									<astuces>

|

-----

**Crédits**
	* Denis MONNERAT (enseignant à l'IUT de Sénart-Fontainebleau)
	* Jérémy POSSAMAÏ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Vicent TORRI (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* Matrices
		* https://fr.wikipedia.org/wiki/Matrice_normale
		* http://uel.unisciel.fr/physique/outils_nancy/outils_nancy_ch11/co/apprendre_ch11_17.html
		* https://en.wikipedia.org/wiki/Matrix_(mathematics)
		* https://fr.wikipedia.org/wiki/D%C3%A9terminant_(math%C3%A9matiques)
	* Bornes
		* https://fr.wikipedia.org/wiki/Borne_sup%C3%A9rieure_et_borne_inf%C3%A9rieure
		* https://fr.wikipedia.org/wiki/Extremum
	* latex
		* https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques
		* https://www.commentcamarche.net/contents/620-latex-table-de-caracteres*
		* https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols
	* endomorphisme
		* https://fr.wikipedia.org/wiki/Spectre_d%27une_matrice
		* https://fr.wikipedia.org/wiki/Matrices_semblables
		* https://fr.wikipedia.org/wiki/Polyn%C3%B4me_caract%C3%A9ristique
		* https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Cayley-Hamilton
		* https://fr.wikipedia.org/wiki/R%C3%A9duction_de_Jordan
	* outils
		* http://atomurl.net/math/
		* https://www.dcode.fr/determinant-matrice
		* https://calculis.net/matrice-inverse
		* https://www.dcode.fr/inverse-matrice