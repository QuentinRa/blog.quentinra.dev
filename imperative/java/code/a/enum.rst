=================
Énumérations
=================

Une énumération est une classe qui contient un nombre d'objets finis.
On peut donc les créer et les utiliser dans le code.

.. code:: java

		public enum ClassesRpg {
		 SORCIER, GUERRIER, ARCHER, TANK
		}

Il est possible de créer des énumérations complexes par exemple avec des valeurs et des méthodes.

.. code:: java

		public enum ClassesRpg {
		 SORCIER(12,58), GUERRIER(58,12), ARCHER(35,35), TANK(70,0)
		 ;// vous devez mettre un ; à la fin de l'énumération des valeurs

		 private int hp;
		 private int mp;

		 //constructeur toujours package-private
		 ClassesRpg(int hp, int mp){
			this.hp = hp;
			this.mp = mp;
		 }

		 public getHp(){
			return this.hp;
		 }
		}

**Utilisation**

.. code:: java

		ClassesRpg.SORCIER.getHp();

**EnumMap**

Il s'agit d'un type de dictionnaire pour les enums.

.. code:: java

		EnumMap<EnumClass, ValeurClass> map;
		map = new EnumMap<>(EnumClass.class);
		// les méthodes sont les mêmes qu'une HashMap