======================
Tests paramétriques
======================

Les tests paramétriques sont ultra pratiques si vous voulez
lancer le même test mais avec un argument ayant des valeurs différentes

.. code:: java

	// on est dans une classe de tests
	@ParameterizedTest
	@MethodSource({"nom_methode1", ...})
	// ou @MethodSource("nom_methode")
	public void monTest(TypeDeMonArgument nom){
	 // code
	}


	private static Stream<TypeDeMonArgument> nom_methode1(){
	 return ...;
	}

Pour vous simplifier la vie, voici un exemple. On va faire une méthode
qui affiche un nombre.

.. code:: java

    @ParameterizedTest
    @MethodSource({"test", "test2", "test"})
    public void monTest(int p){
        // du code de test ici (voir assertions)
        System.out.println(p);
    }

    private static Stream<Integer> test() {
        ArrayList<Integer> e = new ArrayList<>();
        e.add(5);
        return e.stream();
    }

    private static Stream<Integer> test2() {
        ArrayList<Integer> e = new ArrayList<>();
        e.add(7);
        e.add(3);
        return e.stream();
    }

On va appeler ici

.. code:: java

		monTest(5) // reçu de test (première valeur du stream)
		monTest(7) // reçu de test2 (première valeur du stream)
		monTest(3) // reçu de test2 (deuxième valeur du stream)
		monTest(5) // reçu de test (première valeur du stream)


Sous JUnit4, voici mes notes, la classe concernée

	* doit être annotée @RunWith(Parameterized.class) ;
	* doit avoir un constructeur qui correspond aux paramètre
	* doit avoir une méthode STATIC annotée avec @Parameterized.Parameters qui renvoie une collection (Arrays.asList()) qui contient chaque objet à créer.