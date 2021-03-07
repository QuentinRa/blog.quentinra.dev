===========
Factory
===========

Aussi appelé "Constructeur virtuel" (Virtual constructor).

Il s'agit d'un patron dans lequel on utilise une interface (on va dire I)
pour créer des objets.

Par exemple l'interface I va avoir une méthode disons :code:`createObject() : A`
qui retourne un objet de type A (souvent abstrait).

On parle de factory car on dans chaque implémentation de l'interface, on pourra choisir
si on retourne un objet de type A ou une sous-classe de A ! Cela permet de facilement
changer le type de createObject sans changer le code.

More

	* :code:`➡️` : par exemple la méthode iterator()
	* :code:`✅` : permettre plus de flexibilité, utilisé dans les framework généralement
	* :code:`🚫` : peut faire beaucoup de classes (au moins les concrètes à créer donc A et ses sous-classes)

.. code:: java

		// ------------ factory related ------------- //

		// should manage creation of RPG Units, UnitCreator.java
		public interface UnitCreator {

		 // kind of units
		 enum UnitName { HERO, MONSTER, NPC }

		 // factory method, @see RPGUnit
		 RPGUnit getUnit(UnitName name);

		}

		// concrete
		// real creator
		public class Game implements UnitCreator {

		 // create unit
		 @Override
		 public RPGUnit getUnit(UnitName name) {
			switch (name){
			 case HERO: return new Hero();
			 // not done
			 case NPC: case MONSTER: default: throw new IllegalArgumentException("not implemented yey");
			}
		 }

		 // test
		 public static void main(String[] args) {
			Game game = new Game();
			RPGUnit hero = game.getUnit(UnitName.HERO);
			System.out.println(hero); // Hero
		 }
		}


		// ------------ created ------------- //

		// abstract unit, RPGUnit.java
		public abstract class RPGUnit {
		 // print unit name
		 public abstract String toString();
		}

		// Hero.java
		public class Hero extends RPGUnit {
		 @Override
		 public String toString() { return "Hero"; }
		}