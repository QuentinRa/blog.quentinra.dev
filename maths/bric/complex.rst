.. _complex:

================================
Nombres complexes
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 24/11/2020}`

1. Définition
------------------

:math:`\mathbb{C} = {x+iy,\ avec\ x,y \in \mathbb{R}}`  = l'ensemble des nombres complexes
soit tous les nombres de la forme x + iy avec x et y dans z.

	* i est un nombre imaginaire, :math:`i^2 = -1`
	* Partie imaginaire : coefficient devant le i. Im(z) = y
	* Partie réelle : coefficient pas devant le i. Re(z) = x

Géométriquement

	* :math:`Re(z) = x = |z| cos(\theta)`
	* :math:`Im(z) = y = x = |z| sin(\theta)`
	* on a un triangle rectangle avec \|z\| (hypoténuse), et Re(z) (adjacent), Im(z) (opposé)
	* on ne parle pas de coordonnées mais d'affixe
	* arg(z) = angle de l'origine jusqu'au point z

Opérations

	* addition : :math:`(a+ib)+(c+id)=(a+c)+i(b+d)`
	* multiplication : :math:`(a+ib)*(c+id)=ac+iad+ibc+i^2bd=(ac-bd)+i(ad+bc)`
	* inverse : :math:`\frac{1}{a+ib} = \frac{1}{a+ib} \frac{a-ib}{a-ib} = \frac{a-ib}{a^2-i^2b^2} = \frac{a}{a^2+b^2} - i \frac{b}{a^2b^2}`
	* conjugaison (inverse signe de i) : :math:`\overline{z} = x - iy`
	* module : :math:`|z| = \sqrt{x^2 + y^2}`

Propriétés
	* :math:`Re(z) = \frac{z+\overline{z}}{2}`
	* :math:`Im(z) = \frac{z-\overline{z}}{2i}`
	* :math:`z^2 = z+\overline{z}`

2. Forme exponentielle
-------------------------------

| Forme : :math:`z = |z| e^{iarg(z)}` avec :math:`z \in \mathbb{C}^*`
| Forme : :math:`e^{i\theta}= \cos(\theta) + i\sin(\theta)`

Opérations
	* forme exponentielle vers algébrique : :math:`\rho e^{i\theta}`
	* forme algébrique vers exponentielle : calculer :math:`\rho = |z|` et :math:`arg(z) = \pi (si\ z \in \mathbb{R}^-)\ ou\  2\arctan(\frac{y}{x+\sqrt{x^2+y^2}})`
	* :math:`e^{i(x+y)}= \cos(x+y) + i\sin(x+y)`
	* :math:`e^{ix}*e^{iy}= (\cos(x) + i\sin(x))(\cos(y) + i\sin(y)) = (\cos(x)\cos(y)-\sin(x)\sin(y)) - i(\cos(x)\sin(y)-\sin(x)\cos(y))`

Remarques
	* L'écriture exponentielle est unique à 2 pi près.
	* il vaut vérifier que si z=0, alors l'équation est impossible donc il existe bien une forme exponentielle

3. Résolution :math:`z^n = c`
-------------------------------

Propriétés
	* :math:`|z1z2| = |z1||z2|`
	* :math:`|z^n| = |z|^n`
	* :math:`arg(z1z2) = arg(z1) + arg(z2) [2\pi]`
	* :math:`arg(z^n) = n arg(z) [2\pi]`

Méthode
	* objectif : écrire c et z^n sous la forme exponentielle, car l'écriture est unique alors le module + l'angle sont les mêmes
	* Christophe MOUILLERON

		* calculer :math:`\rho = c^{1/n}`
		* résoudre :math:`n\theta = arg(c) [2\pi]`

	* En terminale

		* trouver :math:`\rho^n = |c|`
		* trouver :math:`n \theta = arg(c) + 2k\pi` donc :math:`\theta = \frac{arg(c) + 2k\pi}{n}`
		* on teste les valeurs de k tant que theta est entre pi et -pi (1,2,...,-1,...) : il y en a n.

Exemple : :math:`z^3 = 1`
	* forme exponentielle :math:`\rho e^{i3\theta} = |1| e^{i0}`

		* :math:`z^3` et 1 sont complexes et différents de 0 donc on peut les écrire sous forme exponentielle
		* on remarque que :math:`|1| e^{i0}= 1 e^0 = 1*1 = 1` donc c'est bon

	* on a donc

		* :math:`\rho^3 = |1|` donc :math:`\rho = 1`
		* :math:`3 \theta = 0 + 2k\pi` donc :math:`\theta = \frac{2k\pi}{3}`

	* 3 solutions

		* z1 (k=0) = 1
		* z2 (k=1) = :math:`|1| e^{2i\pi/3} = j`
		* z2 (k=-1) = :math:`\overline{j}`

4. Résolution de :math:`az^2+bz+c=0`
=========================================

Une équation du second degré à deux solutions complexes lorsque :math:`\Delta = b^2 - 4ac` est
négatif.

.. math::

	z_1 = \frac{-b-i\sqrt{-\Delta}}{2a}

	z_2 = \overline{z_1} = \frac{-b+i\sqrt{-\Delta}}{2a}

Alternativement

	* on peut résoudre :math:`z^2 = \Delta` (voir 3.).
	* on peut poser :math:`\sqrt{\Delta} = x+iy`
		* résoudre :math:`Re(\delta) = x^2 - y^2`, :math:`Im(\delta) = 2xy`
		* remplace y par :math:`\frac{Im(\delta)}{2x}`
		* on remplace :math:`x^2` par X

5. Factorisation de polynômes
=========================================

Théorème de d’Alembert-Gauss
	Tout polynôme P à coefficients complexes de degré :math:`deg(P) \ge 1` admet
	au moins une racine (=solutions P=0) dans :math:`\mathbb{C}`.

	Donc corollaire : soit n le degré du polynôme P, alors il y a n solutions à P(z) = 0

Donc en gros pour factoriser,

	* on trouve son solutions
	* on pose :math:`P(z) = (z-solution_1) * ... * (z-solution_n)`
	* on simplifie sachant que :math:`(z-z_1) * (z-\overline{z_1}) = z^2 - (z_1+\overline{z_1})z+(z_1\overline{z_1}) = z^2 - 2 Re(z_1) + |z_1|^2`
	* on obtient une forme factorisée dans :math:`\mathbb{R}`

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.cmath.fr/0ter/nombres_complexes/cours.php
	* http://passeport.univ-lille1.fr/site/Math-va/cdmath/e1124/e1124zna.htm
	* https://www.maths-et-tiques.fr/telech/NombrecTS2.pdf
	* http://math.univ-lyon1.fr/capes/IMG/pdf/new.expo.pdf