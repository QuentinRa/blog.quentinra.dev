================================
Types
================================

Java possède 8 types primitifs
qui ne sont pas des objets.

Les classes sont des types, et chaque type primitif à une classe associée.

======= ===== ============ ===========
Type    Bits  Description  Notation
======= ===== ============ ===========
boolean       true/false
byte    8
short   16
char    16    caractères
int     32    entiers      i
float   32    réels        f
double  64    réels        d
long    64L
======= ===== ============ ===========

Classe Objet
----------------

Il est important de retenir que toutes les classes sont des Objets
(elles héritent de la classe Object). Elles ont donc toutes ces méthodes

.. code:: java

		// comparer deux objets (adresse sauf si réécriture)
		boolean	equals(Object obj);

		// cloner un objet, doit être réécrite
		Object clone();

		// affichage de l'objet
		String toString();

		// appelée juste avant la destruction d'un objet
		void finalize();

Vous pouvez utiliser instanceof pour vérifier le type d'une classe

.. code:: java

	//retourne true si une classe est une instance d'une autre classe
	x instanceof y;

Classes des types primitifs
----------------------------------

La classe String permet de manipuler les chaines de caractères.

Il existe également une classe pour chacun des types primitifs. (Integer, Double, ....)

Attention, les types ne sont pas très flexibles, par exemple 1 n'est pas la même chose que true.
Pour convertir un type vers une autre, chaque classe (associée au type) possède une méthode parse.

.. code:: java

		// conversion de string vers int
		int i = Integer.parseInt("13");