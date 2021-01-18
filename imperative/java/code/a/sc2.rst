=========================
Tableaux dynamiques
=========================

Vous pouvez créer des tableaux dynamiques
avec le classe ArrayList (java.util).

.. code:: java

		// vous donnez la classe entre les crochets
		// par exemple ArrayList<Integer> crée une tableau dynamique d'entiers (int n'est pas une classe)
		ArrayList<Classe> list;
		list = new ArrayList<>();// initialisation

		// méthodes
		list.add(element); // ajout
		list.remove(element); // suppression
		list.clear(); // vider
		list.get(indice); // récupérer
		list.toArray(); // créer un tableau statique
		ArrayList<Classe> copie = new ArrayList<>(list); // clone

**HashSet**

Il s'agit d'un tableau dynamique qui conserver l'ordre d'arrivée
mais dans lequel les éléments sont uniques.

.. code:: java

		HashSet<Classe> set = new HashSet<>();
		set.add(valeur);
		set.contains(valeur);
		set.remove(valeur);
		set.clear();