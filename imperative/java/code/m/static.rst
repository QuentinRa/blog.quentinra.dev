==========================
Constructeurs statique
==========================

Il s'agit d'un moyen d'exécuter du code à la création de la classe.
La classe est crée, par expérience, au moment ou elle est utilisée par le programme
(en tout cas pas directement au lancement du programme).

.. code:: java

		public class uneClasse {
				static {
					// du code, par exemple une initialisation des variables statiques
				}
				// ...
		}