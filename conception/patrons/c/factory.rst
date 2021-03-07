===========
Factory
===========

Il s'agit d'un patron dans lequel on utilise une interface (on va dire I)
pour créer des objets.

Par exemple l'interface I va avoir une méthode disons :code:`createObject() : A`
qui retourne un objet de type A.

On parle de factory car on dans chaque implémentation de l'interface, on pourra choisir
si on retourne un objet de type A ou une sous-classe de A ! Cela permet de facilement
changer le type de createObject sans changer le code.

More

	* :code:`➡️` : par exemple la méthode iterator()
	* :code:`✅` : permettre plus de flexibilité, utilisé dans les framework généralement
	* :code:`🚫` : peut faire beaucoup de classes (au moins les concrètes à créer donc A et ses sous-classes)

.. code:: java

		import java.util.Iterator;

		// a random generic class that can create something
		public class Creator<T> implements Iterable<T>  {

		 // some code here

		 // ...

		 // my iterator method

		 @Override
		 public Iterator<T> iterator() {
			// don't returns Iterator but CreatorIterator
			return new CreatorIterator();
		 }

		 // my private iterator
		 private class CreatorIterator implements Iterator<T> {

			@Override
			public boolean hasNext() {
			 //todo : code here
			 return false;
			}

			@Override
			public T next() {
			 //todo : code here
			 return null;
			}
		 }
		}