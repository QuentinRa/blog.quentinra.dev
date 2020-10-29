================================
Notions et Définitions
================================

Niveau débutant
***********************

1/1 Révisions de notions de cours
-----------------------------------

Soit G le graphe suivant,

.. graphviz::

	digraph {
			size="4";
  		rankdir="LR";
      a -> b;a-> d;
      b -> a;b -> d;b -> h;
			c -> a;
			d -> h;d -> c;
			h -> i;
			i -> h;
			e -> f;e -> g;
   }

1. \
	On note G = (X,U). Écrire X et U.
2. \
	Donner :math:`\Gamma(a)`, :math:`\Gamma(b)`, :math:`\Gamma(c)`
3. \
	Donner les composantes connexes
4. \
	Donner la matrice booléenne associée à la plus grande composante connexe
5. \
	Donner un exemple de chemin, cycle, chaine et de circuit de G.
6. \
	Soit G1=(X1,U1) le sous graphe (induit) défini par X1={a,b,c,d}. Dessiner G1. Est-il connexe ?
	Est-il fortement connexe ? Même question pour G2=(X2,U2) avec X2={e,f,g}
7. \
	Donner les arcs incidents intérieurement à d et son demi-degré intérieur.
	Donner les arcs incidents extérieurement à b et son demi degré extérieur.
8. \
	Donner un graphe partiel de G, puis un sous-graphe partiel de G.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<notions/d1>

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)