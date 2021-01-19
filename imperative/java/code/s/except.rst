=================
Exceptions
=================

Les erreurs en JAVA sont gérés sous la forme d'Exceptions.

Il existe deux types d'exceptions :

	* \
		Les exceptions dites vérifiées, qui devront être capturée. Ce type d'erreur est susceptible d'arriver
		et l'utilisateur ne peux pas les controller (un fichier n'existe plus...)
	* \
		Les runtime exceptions (extends RuntimeException) soit les erreurs qui arrivent seulement
		lorsque certains comportement sont produis mais peuvent être évités (division par 0, ...)

Il est possible de capturer une exception via un bloc try catch.

	* Il faut écrire dans le try

		* le code qui est susceptible de générer une exception
		* mais également le code est censé marcher

	* On écrit dans la partie catch ce que faire si le bloc de code a été interrompu car il y a eu une erreur.


.. code:: java

		// forme basique
		try {
		 ...
		} catch(TypeException e){
		 ...
		}

		// Il est possible d'avoir plusieurs branches catch en fonction
		// des exceptions.
		// Une exception va aller dans la branche la plus proche de sa classe (en termes d'héritage)
		try {
		 ...
		} catch(TypeException1 type1){
		 ...
		} catch(TypeException2 type2){
		 ...
		} //etc

		// Il est possible de faire un seule branche pour plusieurs types d'exceptions
		try {
		 ...
		} catch(TypeException1|TypeException2 type1){
		 ...
		}

Quelques exceptions connues

	* :code:`Exception` : si vous savez qu'il va y avoir une erreur
	* :code:`NumberFormatException` : conversion d'un nombre vers ... à échoué car format du nombre invalide
	* :code:`IllegalArgumentException` : méthode appelée avec un argument incorrect
	* :code:`IllegalStateException` : programme est dans un état interdit (ex: méthode appelée mais S de Solid pas respecté)
	* :code:`ArrayIndexOutOfBoundsException` : tentative d'accès d'un indice invalide dans un tableau
	* :code:`NullPointerException` : appel d'une méthode avec null/...
	* :code:`IOException` : les exceptions liées aux fichiers/flux
	* ...

Exemple
==================

.. code:: java

		try {
		 //code qui lève une exception
		 Integer.parseInt("ceci n'est pas un nombre");
		} catch(NumberFormatException e) {
		 //gère l'exception
		 //affichage de la pile des appels
		 e.printStackStace();

		 //affichage du message d'erreur
		 System.err.println(e.getMessage());
		}

Lever une exception
=====================

.. code:: java

		// méthode indique qu'elle lève une exception
		public void erreur() throws IllegalArgumentException {
		 // code
		}

		// code pour lever une exception
		throw new IllegalStateException(message);

Try Catch Finally
=========================

Il est possible d'ajouter une partie de coder dans un bloc supplémentaire "finally" qui sera exécuté
dans tous les cas, qu'il y a eu une erreur ou non, avant de quitter le try catch.

.. code:: java

		try {
		 ...
		} catch(Exception e) {
		 ...
		} finally {
		 ...
		}

Try with ressource
=========================

Il est possible de faire un try qui ferme automatique un flux ou autre,
n'importe quel object qui est fermable (extends Closable).

.. code:: java

		try(Closable c = ...) {
		 ...
		}