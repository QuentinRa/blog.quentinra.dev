.. _analyse:

================================
Analyse numérique
================================

L'objectif est de résoudre numériquement un système linéaire (sl) donc Ax=b
et réussir à calculer les valeurs propres d'une matrice (voir le cours d'algèbre matriciel si besoin).

Il existe des méthodes directes et des méthodes itératives. Le calcul étant fait numériquement, il peut
y avoir des erreurs et des problèmes qu'il faudra estimer. Il faudra également calculer le temps
d'exécution (i.e. le nombre d'opérations).

1. Introduction
=================================

1.1 Méthodes
**********************

- méthode directe : faire un nombre fini d'opérations

	*	Formule de Cramer
	*	Système triangulaire
	*	Méthode de Gauss
	*	Factorisation LU
	*	Factorisation de Cholesky
	*	Factorisation QR

- méthode itérative : approcher x par récurrence

	*	Méthode de Jacobi
	*	Méthode de Gauss Seidel
	*	Méthode de relaxation

1.2 Problèmes
**********************

Les calculs étant fait sur ordinateurs, il y aura des erreurs. Il faut pouvoir
estimer et/ou majorer cette erreur.

	* erreurs arrondi, de mesure
	* erreur de troncature (calcul de série/suite pour un n fixe ; approche d'une intégrale par une somme, une fonction par son DL)
	* méthode, modélisation ou calcul

Les calculs peuvent êtres très longs si le système est très grand. Il faut
connaitre le cout/un ordre d'idée de chaque méthode.

2. Erreurs et normes
=================================

Une erreur est une quantité qui mesure si un résultat calculé est numériquement
proche du résultat théorique.

.. toctree::
	 :maxdepth: 1

		 Erreur absolue       <files/err/abs>
		 Erreur absolue       <files/err/relative>

Une norme N sur un ensemble E est une mesure de l'erreur sur E.

	* croissante : :math:`N(x) \ge 0`
	* inégalité triangulaire : :math:`N(x+y) \le N(x)+N(y)`
	* seul moment où la norme est nulle : :math:`N(x) = 0 \Leftrightarrow x = 0`
	* :math:`N(\lambda{x}) = |\lambda| N(x)`

.. note::

	On note :math:`| \cdot  |` pour la norme d'un réel/complexe.

	On note :math:`|| \cdot ||` pour la norme d'un vecteur.

	On met :math:`||| \cdot  |||` pour la norme d'une matrice.

.. toctree::
	 :maxdepth: 1

		 Norme en 1                     <files/err/norm1>
		 Norme en 2                     <files/err/norm2>
		 Norme en +l'infini             <files/err/norm3>
		 Opérations sur les normes       <files/err/op>

3. Conditionnement
=================================

Le conditionnement permet de mesurer l'impact des erreurs d'arrondis sur x (Ax=b).

Je crois, que le conditionnement permet de mesurer la dépendance entre b (la solution du problème)
et x (le paramètre).

.. toctree::
	 :maxdepth: 1

		 Conditionnement en 1                     <files/cond/cond1>
		 Conditionnement en 2                     <files/cond/cond2>
		 Conditionnement en p                     <files/cond/cond3>

4. Méthodes directes
======================================

.. toctree::
	 :maxdepth: 1

		 Formule de Cramer                    <files/meth_d/cramer>
		 Système triangulaire                 <files/meth_d/tri>
		 Factorisation de Cholesky            <files/meth_d/cholesky>
		 Méthode de Gauss                     <files/meth_d/gauss>
		 Factorisation LU                     <files/meth_d/lu>

-----

**Crédits**
	* Vicent Torri (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Camel#9490 (étudiant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* Analyse numérique
		* https://fr.wikipedia.org/wiki/Cat%C3%A9gorie:Analyse_num%C3%A9rique
		* http://math.univ-bpclermont.fr/~cindea/blog/post/intro-ana-num-interet/
		* https://www.i2m.univ-amu.fr/perso/thierry.gallouet/licence.d/anum.d/anum-tg2.pdf
	* latex
		* https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques
		* https://www.commentcamarche.net/contents/620-latex-table-de-caracteres*
		* https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols
	* outils
		* http://atomurl.net/math/
		* https://www.dcode.fr/norme-vecteur
		* ++ de Camel
	* méthodes
		* http://bibmath.net/dico/index.php?action=affiche&quoi=./r/relaxation.html