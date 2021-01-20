=================================
Abstraction et Interfaces
=================================

Il est possible en java d'avoir des classes utilisateurs qui n'existent que pour d'autre classes.
Ces classes vont avoir uniquement pour but d'êtres héritées ou implementées
mais vont garantir que le classe Fille possède certaines propriétés (méthodes/attributs).

Classes Abstraites
=============================

Les classes abstraites permettent de créer une classe contenant des méthodes et des attributs mais permettant
certaines méthodes d'être abstraites, c'est à dire vide.

Leur compilateur forcera les classes qui héritent d'une classe ayant une méthode abstraite à réécrire les méthodes.

Ces classes étant incomplètes, vous ne pouvez pas en créer d'objets. En revanche, vous les utiliserez
généralement dans les déclarations de méthodes pour permettre la Substitution de Liskov.

Voilà un exemple bidon et bizarre

.. code:: java

		public abstract class ClasseAbstraite {
			private final Color couleur;//ne peux pas être modifié
			protected int graine;//les enfants y ont accès

			//ce constructeur ne peux pas être utilisé comme new ClasseAbstraite(...)
			//mais il sera utilisée par les classes qui héritent de ClasseAbstraite
			public ClasseAbstraite(Color couleur){
				this.couleur = couleur;
				this.setGraine(this.genererValeur());
			}

			//toutes les classes qui héritent de cette classe devront réécrire cette méthode
			public abstract int genererValeur();

			//méthode privée
			private int setGraine(int graine){
				this.graine = graine;
			}
		}

		public class BasicGenerator extends ClasseAbstraite {
			public ClasseAbstraite(){
			 super(Color.RED);
			}

			@Overrides
			public abstract int genererValeur(){
			 return 255;
			}
		}

:code:`Notes`

	* une classe ayant une méthode abstraire et forcément abstraite
	* une méthode ne peut pas être static et abstraite
	* elle a toutes les propriétés d'une classe normale
	* on met généralement AbstractNomClasse (ou A...) si la classe n'est jamais utilisée dans le code (méthode, ...)

Interfaces
================================

Les interfaces sont une version d'abstraction plus stricte que les classes Abstraites.
Tous les attributs sont public static final. Toutes les méthodes sont publiques.
Il n'est pas possible de déclarer des attributs, ou d'écrire du code (sauf depuis java 8).

.. code:: java

		public interface MonInterface {

			int CONSTANTE = 5; //équivalent de public static final int CONSTANTE = 5;

			void uneMethode(Classe args); //public abstract void uneMethode(Classe args);

			//méthode avec du code, ce code sera supprimé si la méthode est réécrite
			default void code(){ ... }

			//méthode static, ne devra pas être réécrite, forcément avec du code
			static void methode(){ ... }
		}

Le truc sympa des interfaces est que vous pouvez héritez (on dit implémenter)
autant d'interfaces que vous le voulez.

.. code:: java

	// 1 interface
	public class Realisation implements Interface1 {}
	// 2 interfaces
	public class Realisation implements Interface1, Interface2 {}
	// ...

Une interface peut implémenter d'autres interfaces, avec le mot clef extends.

.. code:: java

	public interface MonInterface2 extends MonInterface, MonInterface1 {}