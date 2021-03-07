=========
Iterator
=========

Probablement le patron à connaître. Il s'agit d'un moyen permettant de parcourir
un jeu d'objets.

L'idée est un peu sur le même format que composite, vous allez avoir une interface/classe parente
et des enfants (pas forcément des Branches/Feuilles). En gros pour éviter de faire
une boucle pour chaque type d'enfants, on va mettre tout itérer sur le type de la classe parent.

More

	* :code:`➡️` : par exemple pour parcourir un jeu de objets Branches-Feuilles/Dossiers-fichiers
	* :code:`✅` : cool pour faire un foreach d'un jeu de données
	* :code:`🚫` : peut pas modifier les objets itérés (certains envoient une copie donc vous modifiez la copie, d'autres lèvent une erreur)

.. code:: java

		public class Sac implements Iterable<Object> {
		 private final ArrayList<Object> objects;

		 public Sac(Object ... objects){ this.objects = new ArrayList<>(Arrays.asList(objects)); }

		 // proxy
		 public boolean ajouter(Object o){ return this.objects.add(o); }
		 public boolean remove(Object o){ return this.objects.remove(o); }
		 public boolean contient(Object o){ return this.objects.contains(o); }

		 @Override
		 public Iterator<Object> iterator() {
			return new SacIterator(this);
			// remarque : on aurait pu faire
			//return this.objects.iterator();
		 }

		 // iterator of my Sac
		 private static class SacIterator implements Iterator<Object> {

			private int current;
			private final Sac sac;

			public SacIterator(Sac sac) {
			 this.sac = sac;
			 this.current = -1; //start right before 0
			}

			@Override // do we have a next ?
			public boolean hasNext() { return this.current+1 < this.sac.objects.size(); }

			@Override
			public Object next() {
			 // doc says that we must throw NoSuchElementException
			 if(!hasNext()) throw new NoSuchElementException("no such elements");
			 this.current++;
			 return this.sac.objects.get(this.current);
			}
		 }
		 // ...

		 public static void main(String[] args) {
			Sac sac = new Sac(new Hero(), new Hero(), new Hero());
			Iterator<Object> iterator = sac.iterator();
			while (iterator.hasNext()){
			 System.out.println(iterator.next());
			}
			//or that's the same since sac is Iterable
			System.out.println("----");
			for (Object o : sac) {
			 System.out.println(o);
			}
		 }

		}