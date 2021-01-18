=============
Généricité
=============

Il est possible de faire des méthodes génériques avec la substitution de liskov
(voir héritage).

Cependant par exemple si une méthode retourne un Object de la classe
Animal ou une classe héritant de la classe Animal, alors :

.. code:: java

		// on suppose une méthode
		public Animal liskov(Animal a){
		 return a;
		}

		//on peut appeler la méthode comme suit
		liskov(new Chat());
		liskov(new Chien());
		//Avec Chien extends Animal et Chat qui extends Animal
		//
		//cependant l'objet retourné est de type animal, pas chat ni chien donc:
		//
		Chien c = liskov(new Chien()); //produit une erreur, l'objet retourné est un animal
		Chien c = (Chien) liskov(new Chien());//ok

Il existe un mécanisme qui permet d'éviter de devoir caster à chaque fois,
en déclarant une méthode ou une classe générique.

.. code:: java

		// par exemple une HashMap
		public class MonHashMap<K, V> extends Map<K, V> {

		 //cette méthode prends en argument un élément de la classe K, celle que vous
		 //déclarez pour le premier argument et retourne un object de type V, celle
		 //que vous avez déclaré pour les valeurs
		 public V get(K key){
			...
		 }

		}

		// utilisation
		MonHashMap<String, Integer> map = new HashMap<>();
		//
		// récupération d'un résultat
		String valeur = map.get(Integer.valueOf(12));//new Integer() est deprecated

Il est possible d'utiliser une méthode générique dans une classe non générique. Il faudra
alors déclarer la variable générique dans la signature.

.. code:: java

		// prends une classe de type <T>
		public <T> void methode(arguments, Class<T> aClass){
		 ...
		}

		// prends une classe de type T qui extends la classe ...
		public <T extends ...> void methode(arguments, Class<T> aClass){
		 ...
		}

		// méthode retourne un objet de la classe T
		// prends un argument de type T qui extends la classe ...
		public <T> T methode(arguments, Class<T extends ...> aClass){
		 ...
		}

		// le ?/type joker est l'équivalent d'objet.
		// vous pourriez écrire Class<Object>
		public void methode(arguments, Class<?> aClass){
		 ...
		}

		// prends une classe qui extends T
		public <T> void methode(arguments, Class<? extends T> aClass){
		 ...
		}