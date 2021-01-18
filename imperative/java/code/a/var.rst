======================
Méthodes variadiques
======================

Une méthode variadique (varargs) prends
un nombre variable d'arguments.

.. code:: java

		// cette fonction prends 1 ou 1 et plusieurs arguments
		//
		// exemples :
		// - methode();
		// - methode(new Object());
		// - methode(new Object(), new Object(), new Object(), new Object());
		public void methode(Object ... args){
		 foreach(Object o: args){
			//traitement des arguments
			System.out.println(o);
		 }
		}

L'argument variadique est toujours le dernier argument. Il s'agit
d'un tableau donc vous pouvez faire
un foreach ou encore vérifier sa taille (.length).