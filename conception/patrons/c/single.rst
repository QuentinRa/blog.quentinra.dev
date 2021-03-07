===========
Singleton
===========

Le singleton est utilisé si une classe ne soit avoir qu'une seule instance.
Vous allez alors créer l'instance si elle n'existe pas ou alors retournée l'instance
déjà crée.

Vous pouvez également directement initialiser la variable static.

Soyez sur de rendre privés vos constructeurs, sinon personne ne va utiliser
votre méthode :code:`getInstance() : instance` (nom traditionnel) qui est
censée retourner l'instance de la classe (souvent gardée dans un attribut i ou instance).

More

	* :code:`➡️` : les classes Config, ... connues sous la nom de classes Utility qui ne sont là que pour aider
	* :code:`✅` : cela permet de réduire la consommation de mémoire
	* :code:`🚫` : peut poser des problèmes car c'est une "instance globale" (par accès accès simultanés si vous utiliser des threads, ...)

.. code:: java

		public class RpgMaker {
		 private static RpgMaker instance = null;

		 // get instance, lazy instantiation
		 public static RpgMaker getInstance() {
			// creates
			if(instance == null) instance = new RpgMaker();
			return instance;
		 }

		 // private !!!
		 private RpgMaker(){}
		}

		// ou

		public class RpgMaker {
		 // creates, early instantiation
		 private static RpgMaker instance = new RpgMaker();

		 // get instance
		 public static RpgMaker getInstance() {
			return instance;
		 }

		 // private !!!
		 private RpgMaker(){}
		}