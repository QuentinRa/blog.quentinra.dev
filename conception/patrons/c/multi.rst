===========
Multiton
===========

C'est la même chose qu'un singleton, mais vous allez avoir 2,3, ..., n instances.
Généralement, vous allez avoir une méthode :code:`getInstance(n) : instance`
avec n la clef utilisé (int, string, ...).

On utilisera généralement une Map ou une ArrayList pour générer nos instances.

More

	* :code:`➡️` : si vous vouliez un singleton mais avez plusieurs instances
	* :code:`✅` : pareil que singleton
	* :code:`🚫` : pareil que singleton

.. code:: java

		public class RpgMaker {
		 private static final int MAX_INSTANCE = 5;
		 private static ArrayList<RpgMaker> instance = null;

		 // get instance, lazy instantiation
		 public static RpgMaker getInstance(int i) {
			// creates
			if(i > MAX_INSTANCE) throw new IllegalArgumentException("not a valid key");
			if(instance == null){ // creates
			 instance = new ArrayList<>();
			 for (int j = 0; j < MAX_INSTANCE; j++) {
				instance.add(new RpgMaker());
			 }
			}
			return instance.get(i);
		 }

		 // private !!!
		 private RpgMaker(){}

		}

		public class RpgMaker {
		 private static final int MAX_INSTANCE = 5;
		 // creates, early instantiation
		 private static final ArrayList<RpgMaker> instance = new ArrayList<>();

		 static {
			// fill
			for (int j = 0; j < MAX_INSTANCE; j++) {
					instance.add(new RpgMaker());
			}
		 }

		 // get instance
		 public static RpgMaker getInstance(int i) {
			// creates
			if(i > MAX_INSTANCE) throw new IllegalArgumentException("not a valid key");
			return instance.get(i);
		 }

		 // private !!!
		 private RpgMaker(){}

		}