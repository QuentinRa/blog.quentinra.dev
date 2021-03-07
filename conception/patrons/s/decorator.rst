============
Decorator
============

Un Décorateur est une classe qui prends généralement un Objet d'une classe I
(une interface/...) et qui modifie le comportement de l'un de ses méthodes.

Son constructeur typiquement prends un objet de type I et se comporte
comme un objet de type I, avec les données de l'objet passé en argument. La seule
différence est qu'il va modifier une méthode.

More

	* :code:`➡️` : par exemple ...
	* :code:`✅` : permet d'éviter des héritages (complets) pour une seule modification
	* :code:`🚫` : vous devez bien adapter votre décorateur pour pas vous tromper

Note: vous pouvez mettre DriveFood abstrait ou créer des classes concrètes
comme "SupplementBacon" ou "SupplementCheese".

.. code:: java

		public class DriveFood implements Food {
		 private final Food food;

		 public DriveFood(Food food){ this.food = food; }

		 @Override
		 public int getPrice() {
			// increase price by seven (should be a final static but ****)
			return food.getPrice() + 3;
		 }

		 @Override
		 public String getName() { return this.food.getName(); }
		}

		class Pizza implements Food {
		 @Override
		 public String getName() { return "Pizza"; }

		 @Override
		 public int getPrice() { return 7; }
		}

		interface Food {
		 String getName();
		 // returns food price
		 int getPrice();

		 default String print() { return "{ name:"+getName()+", price:"+getPrice()+" }"; };
		}

		class Test {
		 public static void main(String[] args) {
			Pizza p = new Pizza();
			System.out.println(p.print()); //{ name:Pizza, price:7 }
			DriveFood f = new DriveFood(p);
			System.out.println(f.print()); // { name:Pizza, price:10 }
		 }
		}

