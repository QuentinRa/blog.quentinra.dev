===============================
Tris
===============================

Voir pouvez voir les tris en C, pour d'autres tris. La méthode ayant la même idée.

**Tri rapide**

L'idée est de choisir un élément dans un tableau dit pivot (par exemple le premier)
puis de comparer tous les autres et de classer ceux plus grand et ceux plus petits.

.. code:: java

		public static void quickSort(Comparable[] tab, int deb, int fin){
		 if(deb < fin){
			int m = partition(tab, beg, fin);
			quickSort(tab, deb, m-1);
			quickSort(tab, m+1, fin);
		 }
		}

		//comparable est une interface implémentée par toutes les entités comparables
		private static int partition(Comparable[] tab, int deb, int fin){
		 if(tab.legth < 2) return 0;
		 int avance = debut+1, recule = fin;
		 do {
			while((avance <= recul) && (tab[avance] <= tab[debut])) avance++;
			while((recule >= avance) && (tab[recule] >= tab[debut])) recule--;

			if(avance < recule) {
			 Comparable tmp = tab[avance];
			 tab[avance] = tab[recule];
			 tab[recule] = tmp;
			 avance++;
			 recule--;
			}
		 } while(avance < recul);

		 Comparable tmp = tab[recule];
		 tab[recule] = tab[debut];
		 tab[debut] = tmp;

		 return recule;
		}

**Autres algorithmes de tri**

	*	tri par insertion
	*	tri par base
	*	tri à bulles
	*	tri par tas
	*	tri arborescent
	*	tri fusion